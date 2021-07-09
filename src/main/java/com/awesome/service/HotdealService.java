package com.awesome.service;

import java.util.List;

import com.awesome.domain.Criteria;
import com.awesome.domain.HotdealStorageVO;
import com.awesome.domain.HotdealVO;

public interface HotdealService {
	//상우
	public void hotdeal_get(HotdealStorageVO hotdealstorageVO);
	public int countHotdealList();
	public List<HotdealVO> getHotdealPagingList(Criteria cri);	
	public int checkhds(String id, int hdcode);
}
