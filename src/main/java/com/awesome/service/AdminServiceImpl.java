package com.awesome.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.awesome.domain.Criteria;
import com.awesome.domain.HotdealVO;
import com.awesome.domain.MenuList;
import com.awesome.domain.ReviewVO;
import com.awesome.domain.ShopVO;
import com.awesome.domain.UsersVO;
import com.awesome.mapper.AdminDAO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {

	AdminDAO adminDAO;

	/*------- 메인페이지 관리 -----------------------------------------------  */

	// 관리자 메인페이지 식당목록
	@Override
	public List<ShopVO> mainGetShopList() {
		log.info("mainGetShopList() ...........");
		return adminDAO.mainGetShopList();
	}

	// 관리자 메인페이지 유저목록
	@Override
	public List<UsersVO> mainGetUsersList() {
		log.info("mainGetUsersList() ...........");
		return adminDAO.mainGetUsersList();
	}

	@Override
	public List<ReviewVO> mainGetReviewList() {
		log.info("mainGetReviewList() ...........");
		return adminDAO.mainGetReviewList();
	}

	/*------- 회원 관리 -----------------------------------------------  */
	// 회원목록
	@Override
	public List<UsersVO> getUsersList(Criteria cri) {
		log.info("getUsersList() ...........");
		return adminDAO.getUsersList(cri);
	}

	// 회원전체개수
	@Override
	public int countUsersList(String search) {
		return adminDAO.countUsersList(search);
	}

	/*------- 식당 관리 -----------------------------------------------  */
	// 식당
	@Override
	public List<ShopVO> getShopList(Criteria cri) {
		log.info("getShopList() ...........");
		return adminDAO.getShopList(cri);
	}

	// 식당전체개수
	@Override
	public int countShopList(String search) {
		return adminDAO.countShopList(search);
	}

	// 식당등록처리
	@Override
	public void insertShop(ShopVO shopVO) {
		log.info("insertShop().........");
		adminDAO.insertShop(shopVO);
	}

	// 메뉴등록처리
	@Override
	public void insertMenu(HttpServletRequest request, int rscode) {
		log.info("insertMenu().........");

		String[] arrmnname = request.getParameterValues("mnname");
		String[] arrmnprice = request.getParameterValues("mnprice");

		HashSet<MenuList> menuList = new HashSet<MenuList>();

		for (int i = 0; i < arrmnname.length; i++) {
			MenuList menu = new MenuList(rscode, arrmnname[i], Integer.parseInt(arrmnprice[i]));
			menuList.add(menu);
		}

		adminDAO.insertMenu(menuList);
	}

	// 식당이미지 파일업로드 처리
	@Override
	public void uploadFile(MultipartHttpServletRequest request, MultipartFile[] file, int rscode) {

		String uploadPath = request.getServletContext().getRealPath("/resources/assets/img/shoppic");

		log.info(uploadPath);

		String fileOriginName = "";
		// String fileMultiName = "";

		HashMap<String, Integer> shoppicMap = new HashMap<String, Integer>(); // rsimg, rscode 를 담을 컬렉션

		for (int i = 0; i < file.length; i++) {
			fileOriginName = file[i].getOriginalFilename();
			log.info("기존 파일명 : " + fileOriginName);
			// 확장자명
			String extension = fileOriginName.split("\\.")[1];
			// fileOriginName에 식당코드 + . + 확장자명으로 저장시킴. 예) 300-1.jpg
			fileOriginName = rscode + "-" + i + "." + extension;
			log.info("변경된 파일명 : " + fileOriginName);

			File f = new File(uploadPath + "\\" + fileOriginName);
			try {
				file[i].transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			shoppicMap.put(fileOriginName, rscode); // hashmap 객체에 저장 rsimg(키), rscode(값)
		}
		HashMap<String, Object> dbParams = new HashMap<String, Object>();
		dbParams.put("shoppicList", shoppicMap);
		log.info("shoppicMap.size()>>>" + shoppicMap.size());
		// 식당이미지 DB저장
		adminDAO.insertShoppic(dbParams);
	}

	// 식당 인증마크 등록
	@Override
	public void markUpdateShop(int rscode) {
		log.info("markUpdateShop() ...........");
		adminDAO.markUpdateShop(rscode);
	}

	// 식당 인증마크 삭제
	@Override
	public void markdeleteShop(int rscode) {
		log.info("markdeleteShop() ...........");
		adminDAO.markdeleteShop(rscode);
	}

	@Override
	public void updateShop(int rscode) {
		log.info("updateShop() ...........");
		adminDAO.updateShop(rscode);
	}

	@Override
	public void deleteShop(int rscode) {
		log.info("deleteShop() ...........");
		adminDAO.deleteShop(rscode);
	}

	/*------- 리뷰 관리 -----------------------------------------------  */
	// 리뷰 목록
	@Override
	public List<ReviewVO> getReviewList(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("getReviewList() ...........");
		return adminDAO.getReviewList(cri);
	}

	// 리뷰전체개수
	@Override
	public int countReviewList(String search) {
		return adminDAO.countReviewList(search);
	}

	// 리뷰사진 업로드 처리
	@Override
	public void uploadReviewFile(MultipartHttpServletRequest request, MultipartFile[] file, int rvcode) {

		String uploadPath = request.getServletContext().getRealPath("/resources/assets/img/reviewpic");

		log.info(uploadPath);

		String fileOriginName = ""; // 파일이름저장 초기화
		// String fileMultiName = "";

		HashMap<String, Integer> shoppicMap = new HashMap<String, Integer>(); // rsimg(키), rscode(값) 를 담을 컬렉션

		for (int i = 0; i < file.length; i++) {
			fileOriginName = file[i].getOriginalFilename(); // 원래이미지명을 삭제하고 ASDFASDFJLKASJDFF.jpg
			log.info("기존 파일명 : " + fileOriginName);

			String extension = fileOriginName.split("\\.")[1]; // 확장자명
			// fileOriginName에 리뷰코드 + . + 확장자명으로 저장시킴. 예) 300-1.jpg
			fileOriginName = rvcode + "-" + i + "." + extension;
			log.info("변경된 파일명 : " + fileOriginName);

			File f = new File(uploadPath + "\\" + fileOriginName);
			try {
				file[i].transferTo(f); // 서버에 파일 집어넣음
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			shoppicMap.put(fileOriginName, rvcode); // hashmap 객체에 저장 rsimg(키), rscode(값)
		}
		HashMap<String, Object> dbParams = new HashMap<String, Object>();
		dbParams.put("reviewpicList", shoppicMap);
		log.info("shoppicMap.size()>>>" + shoppicMap.size()); // 갯수확인
		// 식당이미지 DB저장
		adminDAO.insertReviewpic(dbParams);
	}

	// Pro리뷰 등록
	@Override
	public void insertProReview(ReviewVO reviewVO) {
		log.info("insertProReview() ...........");
		adminDAO.insertProReview(reviewVO);
	}

	// 리뷰등록을 위한 식당코드 조회 처리
	@Override
	public ShopVO getShop(String rsname) {
		return adminDAO.getShop(rsname);
	}

	/*------- 핫딜 관리 -----------------------------------------------  */

	// 핫딜목록처리서비스
	@Override
	public List<HotdealVO> getList(Criteria cri) {

		return adminDAO.getHotdealList(cri);
	}

	// 핫딜목록 카운트
	@Override
	public int getCount(String search) {
		return adminDAO.getCount(search);
	}

	// 핫딜등록 중 식당코드를 받아오기위한 처리
	@Override
	public ShopVO getShopInfo(String search) {

		return adminDAO.getShopInfo(search);
	}

	// 핫딜 파일업로드 등록
	@Override
	public int hotdealRegist(MultipartHttpServletRequest request, MultipartFile file, HotdealVO hotdealVO) {

		// 식당 정보 유효성 검사
		ShopVO shopVO = adminDAO.getShopInfoByRsCode(hotdealVO.getRscode());
		if (shopVO == null) {
			return 0;
		}
		int hdcode = adminDAO.hotdealRegist(hotdealVO);

		if (hdcode == 0) {
			return 0;
		}

		hotdealVO.setHdimg(file.getOriginalFilename()); // 이미지 이름 저장
		// 파일 저장 경로
		String uploadPath = request.getServletContext().getRealPath("/resources/assets/img/hotdeal");

		log.info(uploadPath);

		String fileOriginName = String.format("%s_%s", hdcode, file.getOriginalFilename());
		log.info("저장된 파일명 : " + fileOriginName);

		File f = new File(uploadPath + "\\" + fileOriginName);
		try {
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			return 0;
		}

		return hdcode;
	}

	// 할딜 수정처리
	@Override
	public void hotdealUpdate(HotdealVO hotdealVO) {
		adminDAO.hotdealUpdate(hotdealVO);
	}

	// 핫딜 상세보기
	@Override
	public HotdealVO detail_hotdeal(int hdcode) {
		log.info("modify() ............" + hdcode);
		return adminDAO.detail_hotdeal(hdcode); // 정상적인 처리시 1 반환 == 연산자를 통해 true/false 처리
	}
	
	
}
