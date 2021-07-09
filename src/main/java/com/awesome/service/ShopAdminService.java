package com.awesome.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.awesome.domain.BookingVO;
import com.awesome.domain.Criteria;
import com.awesome.domain.HotdealVO;
import com.awesome.domain.MenuVO;
import com.awesome.domain.ReviewVO;
import com.awesome.domain.ShopPicVO;
import com.awesome.domain.ShopVO;

public interface ShopAdminService {

		
	//핫딜관리
	public List<HotdealVO> getHotdealList(int rscode, int limit_count);	// 첫페이지 핫딜 리스트
	public int countHotdealList(int rscode, String search);				// 페이징 처리를 위한 전체 갯수
	public List<HotdealVO> getHotdealPagingList(Criteria cri);			// 핫딜 리스트 페이지(+페이징&검색 조건)

	//예약관리
	public List<BookingVO> getBookingList(int rscode, int limit_count);	// 첫페이지 예약 리스트
	public int countBookingList(int rscode, String search);				// 페이징 처리를 위한 전체 갯수
	public List<BookingVO> getBookingPagingList(Criteria cri);			// 예약 리스트 페이지(+페이징&검색 조건)
	
	public void approveBooking(int bkcode);		//예약승인 처리
	public void noShowBooking(int bkcode);  	//노쇼 처리
	public void completeBooking(int bkcode);	//방문확인 처리

	//리뷰관리
	public List<ReviewVO> getReveiwList(int rscode, String sort);		// 첫페이지 리뷰 리스트
	public int countReviewList(int rscode);								// 페이징 처리를 위한 전체 갯수
	public List<ReviewVO> getReviewPagingList(Criteria cri);			// 리뷰 리스트 페이지(+페이징 조건)
	
	//식당관리
	public ShopVO getShop(int rscode);			//식당정보 가져오기
	public List<MenuVO> getMenu(int rscode);	//식당메뉴 가져오기
	public List<ShopPicVO> getShoppic(int rscode);	//식당이미지 가져오기
	
	//식당수정
	public void updateShop(ShopVO shopVO);
		
	//식당메뉴수정
	public void updateMenu(HttpServletRequest request, int rscode);
		
	//식당이미지업로드
	public void uploadFile(MultipartHttpServletRequest request, MultipartFile[] file, int rscode) throws Exception;
	
	
}
