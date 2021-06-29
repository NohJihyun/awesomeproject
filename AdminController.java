package com.awesome.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.awesome.domain.HotdealVO;
import com.awesome.domain.ShopVO;
import com.awesome.service.AdminService;
import com.awesome.util.PagingUtil;
import com.awesome.util.WebHelper;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.web.servlet.ModelAndView;


@RequestMapping(value = "/admin", name = "관리자")
@Log4j
@Controller
@RequiredArgsConstructor
public class AdminController {

	private final WebHelper web;  // 헬퍼 
	private final AdminService service;

	//페이지 당 노출 개수 
	int rowCountPerPage = 10;
	int VIEW_PAGE_COUNT = 10;

	//핫딜 등록에 검색처리
	@GetMapping(value = "/reg_hotdeal.do", name = "핫딜 등록 페이지") // --> /admin/hotdeal/reg_hotdeal.do
	public String reg_hotdeal(Model model) {

		log.info("핫딜등록페이지이동");

		web.init();         // WebHelper 초기화		root-context.xml에서 bean 객체로 미리 설정해놓음
		String search = web.getString("search"); // getString 메서드를 통해 브라우저 입력 파라미터 가져오기
		model.addAttribute("search", search);

		if (search != null && search != "") {

			ShopVO shopVO = service.getShopInfo(search);
			if (shopVO != null) {
				model.addAttribute("rscode", shopVO.getRscode()); // 서비스클래스에서 데이타 받아옴
			}
		}

		return "hotdeal/reg_hotdeal";
	}


	//핫딜파일업로드
	@PostMapping(value = "/reg_hotdeal.action", name = "핫딜 등록 처리") // http://localhost:8080/hotdeal 요청이 들어오면, 관리자 admin
	public ModelAndView regHotdealAPI(
		MultipartHttpServletRequest multipartRequest, MultipartFile file,
		HotdealVO hotdealVO
	) {
		web.init(); // WebHelper 초기화

		int hdcode = service.hotdealRegist(multipartRequest, file, hotdealVO); // 핫딜 등록
		if (hdcode == 0) {
			return web.redirect(web.getRootPath() + "/admin/reg_hotdeal.do", "핫딜 등록에 실패했습니다.");
		}

		return web.redirect(web.getRootPath() + "/admin/hotdeal_list.do", null);
	}

	// 목록리스트 출력처리 (검색)
	//form 검색을 이용하는 방식 , controller로 자기자신한테 보내는 검색방식.
	/*
	@설명 : 자기 자신의 url (위치) 로 그대로 받아서 serch라는 name=값을 가진 input이 입력되면 value 값으로 담겨서
	url 경로에 search=검색값이 달려 webhelper가 getString("input에서 작성한 name 속성명")으로 가져온후
	String으로 값을 받아내서 model.addattributedp 에 다시 serch 로 등록하면 search 라는 녀석을 jsp 에서 ${search}라는 값으로
	value="" 안에 넣어주면 사용자 검색값이 검색 버튼 후에도 유지될수 있다 .
	search 값을 controller에서 받아냈으니 이걸 service에서 getList() 에게 전달하는 방식이다.
	
	@이동경로: controller 에서 search 받은걸 service에게 전달하고 service interface 에서 명시하고
	servicelmpl 에서 받아내서 DAO interface에 또 보내고 DAO interface 에서 명시하고 mapper 에서 #{search} 사용 적용!!
	
	*/

	//핫딜목록 페이징및 검색
	@GetMapping(value = "/hotdeal_list.do", name = "핫딜 목록") // http://localhost:8080/hotdeal 요청이 들어오면, 관리자 admin
	public String hotdealList(Model model, HttpServletRequest request) {
		System.out.println("테스트");

		//페이징 세팅
		int pageNo = request.getParameter("pageNo") == null || "".equals(request.getParameter("pageNo")) ? 1 : Integer.parseInt((String) request.getParameter("pageNo"));
		int startRow = (pageNo - 1) * rowCountPerPage;

		//검색
		log.info("핫딜목록처리");
		web.init();         // WebHelper 초기화		root-context.xml에서 bean 객체로 미리 설정해놓음
		String search = web.getString("search");        // getString 메서드를 통해 브라우저 입력 파라미터 가져오기
		log.debug("search = " + search);
		model.addAttribute("search", search);

		HotdealVO vo = new HotdealVO();
		vo.setSearch(search);
		vo.setStartRow(startRow);
		vo.setRowCountPerPage(rowCountPerPage);

		model.addAttribute("hotdeals", service.getList(vo)); // 서비스클래스에서 데이타 받아옴
		int totalRowCount = service.getCount(vo);

		//페이징 결과
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("startRow", (pageNo - 1) * rowCountPerPage);
		model.addAttribute("rowCountPerPage", rowCountPerPage);
		model.addAttribute("totalRowCount", totalRowCount);


		model.addAllAttributes(PagingUtil.getPageListInfo(pageNo, totalRowCount, rowCountPerPage, VIEW_PAGE_COUNT));

		return "hotdeal/hotdeal_list"; // VIEW URI 전송 /WEB-INF/views/test.jsp (ViewResolver설정 servlet-context.xml)
	}

	@GetMapping(value = "/hotdeal_list.api", name = "[API] 핫딜 목록", produces = "application/json")
	// http://localhost:8080/hotdeal 요청이 들어오면, 관리자 admin
	public String hotdealListAPI(HttpServletRequest request, HttpServletResponse response) {
		log.info("[API] 핫딜목록처리");

		int pageNo = request.getParameter("pageNo") == null || "".equals(request.getParameter("pageNo")) ? 1 : Integer.parseInt((String) request.getParameter("pageNo"));
		int startRow = (pageNo - 1) * rowCountPerPage;

		web.init();         // WebHelper 초기화		root-context.xml에서 bean 객체로 미리 설정해놓음
		String search = web.getString("search");        // getString 메서드를 통해 브라우저 입력 파라미터 가져오기
		log.debug("search = " + search);


		HotdealVO vo = new HotdealVO();
		vo.setSearch(search);
		vo.setStartRow(startRow);
		vo.setRowCountPerPage(rowCountPerPage);

		List<HotdealVO> hotdeals = service.getList(vo);// 서비스클래스에서 데이타 받아옴

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rtCode", "200");
		data.put("hotdeals", hotdeals);

		int totalRowCount = service.getCount(vo);
		//페이징 결과
		data.put("pageNo", pageNo);
		data.put("startRow", (pageNo - 1) * rowCountPerPage);
		data.put("rowCountPerPage", rowCountPerPage);
		data.put("totalRowCount", totalRowCount);

		ObjectMapper mapper = new ObjectMapper();
		try {
			mapper.writeValue(response.getWriter(), data);
		} catch (JsonGenerationException e) {
			log.debug(e.getLocalizedMessage());
			web.printJsonRt("500", "알 수 없는 에러가 발생했습니다. 관리자에게 문의바랍니다.");
			return null;
		} catch (JsonMappingException e) {
			log.debug(e.getLocalizedMessage());
			web.printJsonRt("500", "알 수 없는 에러가 발생했습니다. 관리자에게 문의바랍니다.");
			return null;
		} catch (IOException e) {
			log.debug(e.getLocalizedMessage());
			web.printJsonRt("500", "알 수 없는 에러가 발생했습니다. 관리자에게 문의바랍니다.");
			return null;
		}

		return null;
	}


	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	//식당관리 컨트롤러 부분

	@GetMapping("/shop_list.do")
	public String shopList(Model model) {
		log.info("식당관리페이지");
		web.init();
		String search = web.getString("search");
		model.addAttribute("search", search);
		model.addAttribute("shoplist", service.getShopList(search));
		return "shop/shop_list";
	}

	@GetMapping("/reg_shop.do")
	public String reg_shop() {
		log.info("식당등록페이지");
		return "shop/reg_shop";
	}

	@PostMapping("/insert_shop.do")
	public String insert_shop(HttpServletRequest request, ShopVO shopVO, MultipartHttpServletRequest multirequest,
							  @RequestParam("file") MultipartFile[] file) throws Exception {

		log.info("식당등록처리");

		//식당정보등록처리  -> rscode 값을 가져옴 
		service.insertShop(shopVO);
		int rscode = shopVO.getRscode();    // Mybatis에 설정한 SelectKey의 property값이 shopVO에 저장된것을 가져옴

		log.info("rscode >> " + rscode);

		//식당사진 업로드 처리 
		service.uploadFile(multirequest, file, rscode);

		// 메뉴등록 처리
		service.insertMenu(request, rscode);


		return "redirect:/admin/shop_list.do";
	}

	@GetMapping("/proReview_list.do")
	public String proReviewList() {
		log.info("리뷰관리페이지");
		return "review/proReview_list";

	}

	@GetMapping("/user_list.do")
	public String userList() {
		log.info("회원관리페이지");
		return "user/user_list";

	}
}
		
	
	

