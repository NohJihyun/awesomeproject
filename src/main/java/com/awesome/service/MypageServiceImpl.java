package com.awesome.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.awesome.domain.BookingVO;
import com.awesome.domain.FavoriteVO;
import com.awesome.domain.HotdealStorageVO;
import com.awesome.domain.ReviewVO;
import com.awesome.domain.UsersVO;
import com.awesome.mapper.MypageDAO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MypageServiceImpl implements MypageService {

	private MypageDAO mypageDAO;

	@Override
	public List<BookingVO> getBookingList(String id) {
		log.info("getBookingList() ...........");
		return mypageDAO.getBookingList(id);
	}

	@Override
	public List<HotdealStorageVO> myhotdeal_sort(String orderby, String id) {
		log.info("getHotdealList() ...........");

		return mypageDAO.myhotdeal_sort(orderby, id);
	}

	@Override
	public List<FavoriteVO> getFavoriteList(String id) {
		log.info("getFavoriteList() ...........");
		return mypageDAO.getFavoriteList(id);
	}

	@Override
	public void myhotdeal_cancel(int hdsseq) {
		log.info("myhotdeal_cancel() ...........");
		mypageDAO.myhotdeal_cancel(hdsseq);
	}

	@Override
	public void myhotdeal_use(int hdsseq) {
		log.info("myhotdeal_use() ...........");
		mypageDAO.myhotdeal_use(hdsseq);

	}

	@Override
	public List<HotdealStorageVO> getHotdealList(String id) {
		log.info("getHotdealList() ...........");
		return mypageDAO.getHotdealList(id);
	}

	@Override
	public void favorite_cancel(int rscode) {
		log.info("favorite_cancel() ...........");
		mypageDAO.favorite_cancel(rscode);
	}

	@Override
	public void booking_cancel(int bkcode) {
		log.info("booking_cancel() ...........");
		mypageDAO.booking_cancel(bkcode);
	}

	@Override
	public List<BookingVO> getReviewList(String id) {
		log.info("getReviewList() ...........");
		return mypageDAO.getReviewList(id);
	}

	@Override
	public void submit_review(MultipartHttpServletRequest request) {

	}

	@Override
	public void insertReview(ReviewVO reviewVO) {
		log.info("insertReview().........");
		mypageDAO.insertReview(reviewVO);

	}

	@Override
	public void uploadFile(MultipartHttpServletRequest request, MultipartFile[] file, int rvcode) {
		String uploadPath = request.getServletContext().getRealPath("/resources/assets/img/reviewpic");

		log.info(uploadPath);

		String fileOriginName = "";
		String fileMultiName = "";

		HashMap<String, Integer> reviewpicMap = new HashMap<String, Integer>(); // rsimg, rscode 를 담을 컬렉션

		for (int i = 0; i < file.length; i++) {
			fileOriginName = file[i].getOriginalFilename();
			log.info("기존 파일명 : " + fileOriginName);
			// 확장자명
			String extension = fileOriginName.split("\\.")[1];
			// fileOriginName에 식당코드 + . + 확장자명으로 저장시킴. 예) 300-1.jpg
			fileOriginName = rvcode + "-" + i + "." + extension;
			log.info("변경된 파일명 : " + fileOriginName);

			File f = new File(uploadPath + "\\" + fileOriginName);
			try {
				file[i].transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			reviewpicMap.put(fileOriginName, rvcode); // hashmap 객체에 저장 rsimg(키), rscode(값)
		}
		HashMap<String, Object> dbParams = new HashMap<String, Object>();
		dbParams.put("reviewpicList", reviewpicMap);
		log.info("reviewpicList.size()>>>" + reviewpicMap.size());
		// 식당이미지 DB저장
		mypageDAO.insertReviewPic(dbParams);
	}

	@Override
	public UsersVO getMyinfo(String id) {
		log.info("getMyinfo() ...........");
		return mypageDAO.getMyinfo(id);
	}

	@Override
	public void update_user(UsersVO usersVO) {
		log.info("update_user().........");
		mypageDAO.update_user(usersVO);
	}

	@Override
	public void uploadUserPic(MultipartHttpServletRequest request, MultipartFile file, String id) {
		String uploadPath = request.getServletContext().getRealPath("/resources/assets/img/userpic");

		log.info(uploadPath);

		
		//파일처리 /////////////////////////////////////////////
		String fileOriginName = "";
		String userpicList;
		fileOriginName = file.getOriginalFilename();
		log.info("기존 파일명 : " + fileOriginName);
		// 확장자명
		String extension = fileOriginName.split("\\.")[1];
		// fileOriginName에 식당코드 + . + 확장자명으로 저장시킴. 예) 300-1.jpg
		fileOriginName = id + "." + extension;
		log.info("변경된 파일명 : " + fileOriginName);

		File f = new File(uploadPath + "\\" + fileOriginName);
		try {
			file.transferTo(f);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		userpicList = fileOriginName;
		mypageDAO.insertUserPic(userpicList);
	}

	@Override
	public ReviewVO showReview(int rvcode) {
		log.info("show_review().........");
		return mypageDAO.showReview(rvcode);
		
	}
}
		
		


