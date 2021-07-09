package com.awesome.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.awesome.domain.BookingVO;
import com.awesome.domain.FavoriteVO;
import com.awesome.domain.HotdealStorageVO;
import com.awesome.domain.ReviewVO;
import com.awesome.domain.UsersVO;

public interface MypageService {
	public List<BookingVO> getBookingList(String id);	// 테스트
	public List<HotdealStorageVO> myhotdeal_sort(String orderby, String id);
	public List<FavoriteVO> getFavoriteList(String id);
	public List<HotdealStorageVO> getHotdealList(String id);
	public List<BookingVO> getReviewList(String id);
	public UsersVO getMyinfo(String id);
	public void myhotdeal_cancel(int hdsseq);
	public void myhotdeal_use(int hdsseq);
	public void favorite_cancel(int rscode);
	public void booking_cancel(int bkcode);
	public void update_user(UsersVO usersVO);
	//리뷰등록처리
	public void submit_review(MultipartHttpServletRequest request);
	public void insertReview(ReviewVO reviewVO);
	public void uploadFile(MultipartHttpServletRequest request, MultipartFile[] file, int rvcode);
	
	public void uploadUserPic(MultipartHttpServletRequest request, MultipartFile file, String id);
	
	public ReviewVO showReview(int rvcode);
}
