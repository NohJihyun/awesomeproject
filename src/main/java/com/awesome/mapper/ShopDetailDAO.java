package com.awesome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.awesome.domain.BookingVO;
import com.awesome.domain.Criteria;
import com.awesome.domain.MenuVO;
import com.awesome.domain.ReplyVO;
import com.awesome.domain.ReviewVO;
import com.awesome.domain.ShopVO;




public interface ShopDetailDAO {
			//리뷰 목록
	public List<ReviewVO> getList(@Param("rscode") int rscode, @Param("sort") String sort);
	
	/* public List<ReviewVO> getReview(int rvcode); */
	//댓글 삽입
	public void ReplyInsert(ReplyVO replyVO);
	//상점 정보
	public List<ShopVO> get(@Param("rscode") int rscode);
	//메뉴 정보
	public List<MenuVO> getmenu(@Param("rscode") int rscode);
	//평점
	public String getScore(@Param("rscode") int rscode);
	//조회수
	public int getReviewCount(@Param("rscode") int rscode);
	//즐겨찾기 수
	public int countingFavorite(@Param("rscode") int rscode);
	//리뷰 상세정보
	public List<ReviewVO> ReviewDetail(int rvcode);
	//리뷰 한개 처리
	public ReviewVO ReviewOne(int rvcode);
	//댓글 상세목록
	public List<ReplyVO> ReplyDetail(Criteria cri);
	//댓글 삭제
	public boolean DeleteReply(int rpcode);
	//댓글 수정
	public void UpdateReply(@Param("rpcode") int rpcode, @Param("rpcontent") String rpcontent);
	//즐겨찾기 확인
	public int getFavorite(@Param("rscode") int rscode, @Param("id") String id);
	//즐겨찾기 삭제
	public void DeleteFav(@Param("id") String id, @Param("rscode") int rscode);
	
	public void InsertFav(@Param("id") String id, @Param("rscode") int rscode);
	
	public void Booking(BookingVO bookingVO);
	
	public void Uprscnt(int rscode);
	
	public int  countReplyList(int rvcode);
}
