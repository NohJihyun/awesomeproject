package com.awesome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.awesome.domain.Criteria;
import com.awesome.domain.HotdealVO;
import com.awesome.domain.ReviewVO;
import com.awesome.domain.ShopVO;

public interface ShopDAO {

	//건휘
	// 식당 검색 결과 뿌리기
	public List<ShopVO> searchinfo(Criteria cri);
	// 페이징처리를 위한 전체 갯수 가져오기
	public int countShopList(String keyword);

	// 상우
	// index.jsp 전문가 평점 목록 처리
	public List<ReviewVO> getProReviewList();

	public List<ReviewVO> getUserReviewList();

	public List<HotdealVO> getHotdealList();

	public List<HotdealVO> hotdeal_sort(@Param("hdorderby") String hdorderby);

	public int countHotdealList(@Param("hdcode") int hdcode);

}
