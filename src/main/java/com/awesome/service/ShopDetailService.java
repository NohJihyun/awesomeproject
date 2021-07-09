package com.awesome.service;

import java.util.List;

import com.awesome.domain.BookingVO;
import com.awesome.domain.Criteria;
import com.awesome.domain.MenuVO;
import com.awesome.domain.ReplyVO;
import com.awesome.domain.ReviewVO;
import com.awesome.domain.ShopVO;


public interface ShopDetailService {		
	//리뷰조회
	public List<ReviewVO> getList(int rscode, String sort);
	//식당 정보 조회
	public List<ShopVO> get(int rscode); 
	//메뉴 조회
	public List<MenuVO> getmenu(int rscode);
	//평균평점조회
	public String getScore(int rscode);
	//리뷰의 숫자
	public int getReviewCount(int rscode);
	//즐겨찾기 수 숫자
	public int countingFavorite(int rscode);
	//댓글 삽입
	public void ReplyInsert(ReplyVO replyVO);
	
	//리뷰 상세 보기 
	public List<ReviewVO> ReviewDetail(int rvcode);
	
	//리뷰 한개만 가져오기
	public ReviewVO ReviewOne(int rvcode);
	
	//댓글 가져오기
	public List<ReplyVO> ReplyDetail(Criteria cri);
	//댓글 삭제
	public boolean DeleteReply(int rpcode);
	//댓글 수정
	public void UpdateReply(int rpcode, String rpcontent);
	//즐겨찾기 가져오기
	public int getFavorite(int rscode, String id);
	//즐겨찾기 삭제
	public void DeleteFav(String id, int rscode);
	//즐겨찾기 추가
	public void InsertFav(String id, int rscode);
	//예약
	public void Booking(BookingVO bookingVO);
	
	public void Uprscnt(int rscode);
	
	public int countReplyList(int rvcode);
}
