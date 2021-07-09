package com.awesome.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.awesome.domain.Criteria;
import com.awesome.domain.HotdealVO;
import com.awesome.domain.ReviewVO;
import com.awesome.domain.ShopVO;
import com.awesome.domain.UsersVO;

public interface AdminService {

	/*------- 메인페이지 관리 -----------------------------------------------  */

	public List<ShopVO> mainGetShopList();		// 메인 식당목록
	public List<UsersVO> mainGetUsersList();	// 관리자메인 유저목록
	public List<ReviewVO> mainGetReviewList();	// 관리자메인 리뷰목록

	
	/*------- 핫딜 관리 -----------------------------------------------  */

	List<HotdealVO> getList(Criteria cri); // 핫딜 목록 (리스트)
	int getCount(String search);			//리스트 카운트
	int hotdealRegist(MultipartHttpServletRequest request, MultipartFile file, HotdealVO hotdealVO);  		// 핫딜 파일업로드 등록
	void hotdealUpdate(HotdealVO hotdealVO);			// 핫딜 수정 처리
	ShopVO getShopInfo(String search);				// 핫딜등록시 식당이름 검색
	HotdealVO detail_hotdeal(int hdcode);	// 핫딜 상세보기
	
	/*------- 회원 관리 -----------------------------------------------  */
	
	public List<UsersVO> getUsersList(Criteria cri);	//회원정보 리스트
	public int countUsersList(String search);			//회원 전체개수(페이징처리)
	
	/*------- 식당 관리 -----------------------------------------------  */
	
	public List<ShopVO> getShopList(Criteria cri);		//식당목록
	public int countShopList(String search);			// 식당목록 페이징
	public void insertMenu(HttpServletRequest request, int rscode);			//식당메뉴
	public void insertShop(ShopVO shopVO);					//식당등록
	public void uploadFile(MultipartHttpServletRequest request, MultipartFile[] file, int rscode);   	//식당이미지업로드
	public void updateShop(int rscode);					//식당 계약등록
	public void deleteShop(int rscode);			//식당 계약취소				
	public void markUpdateShop(int rscode);			//식당 인증마크등록
	public void markdeleteShop(int rscode);				//식당인증마크삭제
	
	/*------- 리뷰 관리 -----------------------------------------------  */	
	
	public List<ReviewVO> getReviewList(Criteria cri);	// 리뷰 목록
	public int countReviewList(String search);			// 리뷰목록 페이징
	public void insertProReview(ReviewVO reviewVO);			//Pro리뷰 등록	
	public ShopVO getShop(String rsname);						//리뷰등록을 위한 식당코드 조회
	public void uploadReviewFile(MultipartHttpServletRequest request, MultipartFile[] file, int rvcode); 		//리뷰사진 등록
		
	
		
		
}
