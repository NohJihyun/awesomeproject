package com.awesome.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.awesome.domain.BookingVO;
import com.awesome.domain.FavoriteVO;
import com.awesome.domain.HotdealStorageVO;
import com.awesome.domain.ReviewVO;
import com.awesome.domain.UsersVO;

public interface MypageDAO {
	// 목록
	// @Select("select * from users") -> UserMapper.xml에서 처리함으로 주석처리
	public List<BookingVO> getBookingList(String id);

	public List<HotdealStorageVO> myhotdeal_sort(@Param("orderby") String orderby, @Param("id") String id);

	public List<HotdealStorageVO> getHotdealList(String id);

	public List<FavoriteVO> getFavoriteList(String id);

	public List<BookingVO> getReviewList(String id);
	
	public UsersVO getMyinfo(String id);

	public void myhotdeal_cancel(int hdsseq);

	public void myhotdeal_use(int hdsseq);

	public void favorite_cancel(int rscode);

	public void booking_cancel(int bkcode);

	// 식당등록
	public void insertReview(ReviewVO reviewVO);

	// 식당이미지업로드
	public void uploadFile(MultipartHttpServletRequest request, MultipartFile[] file, int rvcode);
	public void uploadUserPic(MultipartHttpServletRequest request, MultipartFile[] file, String id);
	public void insertReviewPic(HashMap<String, Object> reviewpicList);
	public void insertUserPic(String userpicList);
	public void update_user(UsersVO usersVO);
	
	public ReviewVO showReview(int rvcode);
//		public List<FavoriteVO> getFavoriteList(@Param("orderby") String orderby,@Param("id") String id);
}
