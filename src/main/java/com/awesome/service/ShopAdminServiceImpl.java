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

import com.awesome.domain.BookingVO;
import com.awesome.domain.Criteria;
import com.awesome.domain.HotdealVO;
import com.awesome.domain.MenuList;
import com.awesome.domain.MenuVO;
import com.awesome.domain.ReviewVO;
import com.awesome.domain.ShopPicVO;
import com.awesome.domain.ShopVO;
import com.awesome.mapper.ShopAdminDAO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ShopAdminServiceImpl implements ShopAdminService {

	ShopAdminDAO shopAdminDAO;

	
	// #######  예약처리 ################################ 
	// 첫페이지 예약 리스트
	@Override
	public List<BookingVO> getBookingList(int rscode, int limit_count) {
		return shopAdminDAO.getBookList(rscode, limit_count);
	}
	
	// 예약 전체 갯수 (페이징 처리)
	@Override
	public int countBookingList(int rscode, String search) {
		return shopAdminDAO.countBookingList(rscode, search);
	}

	// 예약리스트 페이지 (페이징 + 검색처리)
	@Override
	public List<BookingVO> getBookingPagingList(Criteria cri) {
		return shopAdminDAO.getBookPagingList(cri);
	}
	
	//예약 승인 처리
	@Override
	public void approveBooking(int bkcode) {
		shopAdminDAO.approveBooking(bkcode);
	}
	//예약 노쇼 처리
	@Override
	public void noShowBooking(int bkcode) {
		shopAdminDAO.noShowBooking(bkcode);
	}
	
	//방문 완료 처리
	@Override
	public void completeBooking(int bkcode) {
		shopAdminDAO.completeBooking(bkcode);
	}
	
	// #######  핫딜 처리 ################################ 
	// 핫딜 전체 게시물 수
	@Override
	public int countHotdealList(int rscode, String search) {
		return shopAdminDAO.countHotdealList(rscode, search);
	}

	// 핫딜리스트 페이지 (+페이징 + 검색 처리)
	@Override
	public List<HotdealVO> getHotdealPagingList(Criteria cri) {
		return shopAdminDAO.getHotdealPagingList(cri);
	}

	// 홈화면 핫딜 리스트 
	@Override
	public List<HotdealVO> getHotdealList(int rscode, int limit_count) {
		return shopAdminDAO.getHotdealList(rscode, limit_count);
	}

	// #######  리뷰 처리 ################################ 
	// 첫화면 리뷰 리스트
	@Override
	public List<ReviewVO> getReveiwList(int rscode, String sort) {
		return shopAdminDAO.getReviewList(rscode, sort);
	}
	// 리뷰 갯수 (페이징처리)
	@Override
	public int countReviewList(int rscode) {
		return shopAdminDAO.countReviewList(rscode);
	}

	@Override
	public List<ReviewVO> getReviewPagingList(Criteria cri) {
		return shopAdminDAO.getReviewPagingList(cri);
	}


	// #######  식당 처리 ################################ 
	// 식당 정보가져오기
	@Override
	public ShopVO getShop(int rscode) {
		return shopAdminDAO.getShop(rscode);
	}

	// 메뉴 가져오기
	@Override
	public List<MenuVO> getMenu(int rscode) {
		return shopAdminDAO.getMenu(rscode);
	}

	// 식당사진 가져오기
	@Override
	public List<ShopPicVO> getShoppic(int rscode) {
		return shopAdminDAO.getShoppic(rscode);
	}

	//식당 수정 처리
	@Override
	public void updateShop(ShopVO shopVO) {
		log.info("updateShop().........");
		shopAdminDAO.updateShop(shopVO);
	}

	//메뉴등록처리
	@Override
	public void updateMenu(HttpServletRequest request, int rscode) {
		log.info("updateMenu().........");
		
		String[] arrmnname = request.getParameterValues("mnname");
		String[] arrmnprice = request.getParameterValues("mnprice");
		
		HashSet<MenuList> menuList = new HashSet<MenuList>();

		for (int i = 0; i < arrmnname.length; i++) {
			MenuList menu = new MenuList(rscode, arrmnname[i], Integer.parseInt(arrmnprice[i]));
			menuList.add(menu);
		}
		
		shopAdminDAO.deleteMenu(rscode);	// 기존 메뉴 삭제 처리 후
		shopAdminDAO.insertMenu(menuList);	// 새로 추가
	}
	
	//식당이미지 파일업로드 처리
	@Override
	public void uploadFile(MultipartHttpServletRequest request, MultipartFile[] file, int rscode) throws Exception {

		String uploadPath = request.getServletContext().getRealPath("/resources/assets/img/shoppic");

		log.info(uploadPath);
		
		String fileOriginName = ""; 
		String fileMultiName = "";
		
		HashMap<String, Integer> shoppicMap = new HashMap<String, Integer>(); // rsimg, rscode 를 담을 컬렉션 
		
		for(int i=0; i < file.length; i++) { 
			fileOriginName = file[i].getOriginalFilename(); 
			log.info("기존 파일명 : " + fileOriginName); 
			//확장자명 
			String extension = fileOriginName.split("\\.")[1];
			//fileOriginName에 식당코드 + . + 확장자명으로 저장시킴.  예) 300-1.jpg 
			fileOriginName = rscode + "-" + i + "." + extension;
			log.info("변경된 파일명 : "+fileOriginName);

			File f = new File(uploadPath+"\\"+fileOriginName); 
			try {
				file[i].transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			shoppicMap.put(fileOriginName, rscode);	// hashmap 객체에 저장   rsimg(키), rscode(값)  
		}
			HashMap<String, Object> dbParams = new HashMap<String, Object>();
			dbParams.put("shoppicList", shoppicMap);
			log.info("shoppicMap.size()>>>" + shoppicMap.size());
		// 식당이미지 DB저장
		shopAdminDAO.insertShoppic(dbParams);
	}

		
	
}
