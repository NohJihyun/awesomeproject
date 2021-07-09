package com.awesome.service;

import java.util.List;

import com.awesome.domain.UsersVO;

public interface UsersService {

	public UsersVO find_account(String id, String name, String email); 			// 계정찾기
	
	public int updatePassword(String id, String password);		//비밀번호 수정

	public void register(UsersVO usersVO); 				// 등록
	
	public UsersVO login(String id, String password);   //로그인

	public boolean modify(UsersVO usersVO); 			// 수정

	public boolean remove(String id); 					// 삭제

	List<UsersVO> getUsersList();						// 목록

	public int idCheck(String id);						// 아이디 중복체크
	
	public void deleteShop(int rscode);					//식당삭제
}
