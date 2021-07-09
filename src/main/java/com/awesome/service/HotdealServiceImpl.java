package com.awesome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.awesome.domain.Criteria;
import com.awesome.domain.HotdealStorageVO;
import com.awesome.domain.HotdealVO;
import com.awesome.mapper.HotdealDAO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class HotdealServiceImpl implements HotdealService {

	@Autowired
	HotdealDAO hotdealDAO;
	
	@Override
	public void hotdeal_get(HotdealStorageVO hotdealstorageVO) {

		log.info("hotdeal_get() ...........");
		hotdealDAO.hotdeal_get(hotdealstorageVO);

	}

	@Override
	public int countHotdealList() {
		log.info("countHotdealList() ...........");
		return hotdealDAO.countHotdealList();
	}



	@Override
	public List<HotdealVO> getHotdealPagingList(Criteria cri) {
		// TODO Auto-generated method stub
		return hotdealDAO.getHotdealPagingList(cri);
	}

	@Override
	public int checkhds(String id, int hdcode) {
		log.info("checkhds() ...........");

		return hotdealDAO.checkhds(id, hdcode);
	}
}
