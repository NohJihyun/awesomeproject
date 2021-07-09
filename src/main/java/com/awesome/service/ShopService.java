package com.awesome.service;

import java.util.List;

import com.awesome.domain.Criteria;
import com.awesome.domain.HotdealVO;
import com.awesome.domain.ReviewVO;
import com.awesome.domain.ShopVO;

public interface ShopService {
	// 검색 결과 뿌리는 김건휘
	public List<ShopVO> searchinfo(Criteria cri);

	// 검색 결과 페이징네이션하는 김건휘
	public int countShopList(String keyword);

	// 상우
	// index.jsp 전문가 평점 목록 처리
	public List<ReviewVO> getProReviewList();

	public List<ReviewVO> getUserReviewList();

	public List<HotdealVO> getHotdealList();

	public List<HotdealVO> hotdeal_sort(String hdorderby);
}
