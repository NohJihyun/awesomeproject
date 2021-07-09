package com.awesome.mapper;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.awesome.domain.BookingVO;
import com.awesome.domain.Criteria;
import com.awesome.domain.HotdealVO;
import com.awesome.domain.MenuList;
import com.awesome.domain.MenuVO;
import com.awesome.domain.ReviewVO;
import com.awesome.domain.ShopPicVO;
import com.awesome.domain.ShopVO;

public interface ShopAdminDAO {
	
	// =========== 예 약 관 리 =========================== //
	// 식당,검색별 예약 갯수 가져오기
	public int countBookingList(@Param("rscode") int rscode,
   							    @Param("search") String search);

	// 예약리스트 페이지  (검색,페이징처리)  Param value: Criteria객체(식당코드, 검색어, 페이징)
	public List<BookingVO> getBookPagingList(Criteria cri); 

	// 메인 예약목록처리  Param value: 예약코드, 출력갯수
	public List<BookingVO> getBookList(@Param("rscode") int rscode,
			  						   @Param("limit_count") int limit_count); 
	
	// 예약승인 처리
	public void approveBooking(int hdcode);
	
	// 예약노쇼 처리
	public void noShowBooking(int hdcode);
	
	// 방문확인 처리
	public void completeBooking(int hdcode);

	// =========== 핫 딜 관 리 =========================== //
	
	// 메인화면 핫딜목록처리 (출력갯수제한)  Param value: 식당코드, 출력갯수
	public List<HotdealVO> getHotdealList(@Param("rscode") int rscode,
										  @Param("limit_count") int limit_count);	

	
	// 식당,검색별 핫딜전체 갯수 가져오기
	public int countHotdealList(@Param("rscode") int rscode,
							  @Param("search") String search);


	
	// 핫딜리스트 페이지 (검색,페이징처리)  Param value: Criteria객체(식당코드, 검색어, 페이징)
	public List<HotdealVO> getHotdealPagingList(Criteria cri);	
		
	
	// =========== 리 뷰 관 리 =========================== //
	
	// 리뷰목록처리  Param value : 식당코드, 정렬
	public List<ReviewVO> getReviewList(@Param("rscode") int rscode, 
										@Param("sort") String sort);
	
	// 리뷰 갯수 가져오기
	public int countReviewList(int rscode);
	
	// 리뷰리스트 페이지 (페이징 처리) 
	public List<ReviewVO> getReviewPagingList(Criteria cri);
	
	
	// =========== 식 당 관 리 =========================== //
	// 식당관리
	// 식당정보 
	public ShopVO getShop(int rscode);
	// 식당메뉴
	public List<MenuVO> getMenu(int rscode);
	// 식당이미지
	public List<ShopPicVO> getShoppic(int rscode);
	
	//식당수정
	public void updateShop(ShopVO shopVO);
	//식당메뉴삭제
	public void deleteMenu(int rscode);
	//식당메뉴수정
	public void insertMenu(HashSet<MenuList> menuList);
	
	//식당이미지 등록 매퍼
	public void insertShoppic(HashMap<String, Object> shoppicList);
	
	
	
}
