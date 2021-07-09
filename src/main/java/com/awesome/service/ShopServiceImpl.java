package com.awesome.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.awesome.domain.Criteria;
import com.awesome.domain.HotdealVO;
import com.awesome.domain.ReviewVO;
import com.awesome.domain.ShopVO;
import com.awesome.mapper.ShopDAO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ShopServiceImpl implements ShopService{
	
	ShopDAO shopDAO;	

	//건휘
	@Override
	public List<ShopVO> searchinfo(Criteria cri) {
		log.info("거의 끝나간드아ㅏㅏㅏㅏㅏㅏ@@@@@@@@@@@@@@@@@@@@@@");
		return shopDAO.searchinfo(cri);
	}

	@Override
	public int countShopList(String keyword) {
		
		return shopDAO.countShopList(keyword);
	}
	
	// 상우
	@Override
	public List<ReviewVO> getProReviewList() {
		log.info("getProReviewList() ...........");
		return shopDAO.getProReviewList();
	}

	@Override
	public List<ReviewVO> getUserReviewList() {
		log.info("getUserReviewList() ...........");
		return shopDAO.getUserReviewList();
	}

	@Override
	public List<HotdealVO> getHotdealList() {
		log.info("getHotdealList() ...........");
		return shopDAO.getHotdealList();
	}

	@Override
	public List<HotdealVO> hotdeal_sort(String hdorderby) {
		log.info("hotdeal_sort() ...........");

		return shopDAO.hotdeal_sort(hdorderby);
	}
	
}
