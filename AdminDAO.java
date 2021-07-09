package com.awesome.mapper;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import com.awesome.domain.Criteria;
import com.awesome.domain.HotdealVO;
import com.awesome.domain.MenuList;
import com.awesome.domain.ReviewVO;
import com.awesome.domain.ShopVO;
import com.awesome.domain.UsersVO;

public interface AdminDAO {

	// == 관리자 메인 ================================================
	// 관리자메인 식당목록
	public List<ShopVO> mainGetShopList();

	// 관리자메인 유저목록
	public List<UsersVO> mainGetUsersList();

	// 관리자메인 리뷰목록
	public List<ReviewVO> mainGetReviewList();

	// == 회원관리 ================================================
	// 회원목록매퍼
	public List<UsersVO> getUsersList(Criteria cri);

	// 회원목록 페이징
	public int countUsersList(String search);

	// == 식당관리 ================================================
	// 식당목록
	public List<ShopVO> getShopList(Criteria cri);

	// 식당목록 페이징
	public int countShopList(String search);

	// 식당메뉴등록
	public void insertMenu(HashSet<MenuList> menuList);

	// 식당등록
	public void insertShop(ShopVO shopVO);

	// 식당이미지 등록 매퍼
	public void insertShoppic(HashMap<String, Object> shoppicList);

	// 식당 계약등록
	public void updateShop(int rscode);

	// 식당 계약취소
	public void deleteShop(int rscode);

	// 식당 인증마크등록
	public void markUpdateShop(int rscode);

	// 식당인증마크삭제
	public void markdeleteShop(int rscode);

	// == 리뷰관리 ================================================
	// 리뷰 목록
	public List<ReviewVO> getReviewList(Criteria cri);

	// 리뷰목록 페이징
	public int countReviewList(String search);

	// Pro리뷰 등록
	public void insertProReview(ReviewVO reviewVO);

	// 리뷰등록을 위한 식당코드 가져오기
	public ShopVO getShop(String rsname);

	// 전문가리뷰이미지등록
	public void insertReviewpic(HashMap<String, Object> reviewpicList);

	// == 핫딜관리 ================================================
	// 핫딜목록 @Select("select * from users") -> hotdealMapper.xml에서 처리함으로 주석처리
	List<HotdealVO> getHotdealList(Criteria cri); // 마이바티스 mapper.xml 연동

	// 핫딜 목록 카운트
	public int getCount(String search); // 마이바티스 mapper.xml 연동

	// 핫딜 파일 업로드 등록
	int hotdealRegist(HotdealVO hotdealVO); // 마이바티스 mapper.xml 연동

	// 핫딜 수정
	public void hotdealUpdate(HotdealVO hotdealVO);

	// 핫딜등록에서 식당정보 조회
	ShopVO getShopInfo(String search);

	ShopVO getShopInfoByRsCode(int rscode); // 마이바티스 mapper.xml 연동

	// 핫딜 상세보기
	public HotdealVO detail_hotdeal(int hdcode);

}