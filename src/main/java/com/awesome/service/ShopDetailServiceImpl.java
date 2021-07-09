package com.awesome.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.awesome.domain.BookingVO;
import com.awesome.domain.Criteria;
import com.awesome.domain.MenuVO;
import com.awesome.domain.ReplyVO;
import com.awesome.domain.ReviewVO;
import com.awesome.domain.ShopVO;
import com.awesome.mapper.ShopDetailDAO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ShopDetailServiceImpl implements ShopDetailService{

	ShopDetailDAO shopdetailDAO;
		
	@Override
	public List<ReviewVO> getList(int rscode, String sort) {		
		log.info("ShopReview() ..........." );
		return shopdetailDAO.getList(rscode, sort);
		}
	
	@Override
	public List<ShopVO> get(int rscode){
		log.info("Shopinfo().......................");
		return shopdetailDAO.get(rscode);
	}

	@Override
	public List<MenuVO> getmenu(int rscode) {
		log.info("Menuinfo().....................");
		return shopdetailDAO.getmenu(rscode);
	}

	@Override
	public String getScore(int rscode) {
		log.info("avgScore()................................");
		return shopdetailDAO.getScore(rscode);
	}

	@Override
	public int getReviewCount(int rscode) {
		log.info("cntReview()..................@@@@@");
		return shopdetailDAO.getReviewCount(rscode);
	}

	@Override
	public int countingFavorite(int rscode) {
		log.info("cntFavorite()..................@@@@@");
		return shopdetailDAO.countingFavorite(rscode);
	}

	@Override
	public void ReplyInsert(ReplyVO replyVO) {		
		log.info("삽입중@@@@@@@@@@@@@@");
		shopdetailDAO.ReplyInsert(replyVO);
		}

	@Override
	public List<ReviewVO> ReviewDetail(int rvcode) {
		log.info("리뷰디테일 가져오는 중 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		return shopdetailDAO.ReviewDetail(rvcode);
	}

	@Override
	public List<ReplyVO> ReplyDetail(Criteria cri) {
		log.info("댓글 디테일 가져오는중@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		return shopdetailDAO.ReplyDetail(cri);
	}
	//리뷰 한개가져오기
	@Override
	public ReviewVO ReviewOne(int rvcode) {
		return shopdetailDAO.ReviewOne(rvcode);
	}
	
	@Override
	public boolean DeleteReply(int rpcode) {
		log.info("댓글 삭제하는 중~@@@@@@@@@@@@");
		return shopdetailDAO.DeleteReply(rpcode) == true;		
	}

	@Override
	public void UpdateReply(int rpcode, String rpcontent) {
		log.info("댓글 수정 중@@@@@@@@@@@@@@@@@@@@@@@@22");
		shopdetailDAO.UpdateReply(rpcode, rpcontent);
	}

	@Override
	public int getFavorite(int rscode, String id) {
		log.info("즐겨찾기 목록을 가져오고 있습니다");
		return shopdetailDAO.getFavorite(rscode, id);
	}

	@Override
	public void DeleteFav(String id, int rscode) {
		log.info("즐겨찾기 삭제");
		shopdetailDAO.DeleteFav(id, rscode);	
		
	}	
	@Override
	public void InsertFav(String id, int rscode) {
		log.info("즐겨찾기 삭제");
		shopdetailDAO.InsertFav(id, rscode);			
	}

	@Override
	public void Booking(BookingVO bookingVO) {
		log.info("예약이 잡히는 중");
		shopdetailDAO.Booking(bookingVO);
	}

	@Override
	public void Uprscnt(int rscode) {
		log.info("조회수가 증가하였습니다");
		shopdetailDAO.Uprscnt(rscode);		
	}

	@Override
	public int countReplyList(int rvcode) {
		log.info("댓글 숫자 세는 중");
		return shopdetailDAO.countReplyList(rvcode);
	}
	
}
