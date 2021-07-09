package com.awesome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.awesome.domain.Criteria;
import com.awesome.domain.HotdealStorageVO;
import com.awesome.domain.HotdealVO;

public interface HotdealDAO {
	
	public void hotdeal_get(HotdealStorageVO hotdealstorageVO);
	public int countHotdealList();
	
	public List<HotdealVO> getHotdealPagingList(Criteria cri);	
	public int checkhds(@Param("id") String id, @Param("hdcode") int hdcode);
}
