package com.awesome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.awesome.domain.UsersVO;

public interface UsersDAO {

	//목록
	// @Select("select * from users") -> UserMapper.xml에서 처리함으로 주석처리
	public List<UsersVO> getUsersList();
	
	//등록
	public void register(UsersVO usersVO);
	
	//조회
	public UsersVO find_account(@Param("id") String id, @Param("name") String name, @Param("email") String email);
	
	//로그인
	public UsersVO login(@Param("id") String id, @Param("password") String password);
	
	//탈퇴
	public int delete(String id);
	
	//수정
	public int update(UsersVO usersVO);
	
	//비밀번호수정
	public int updatePassword(@Param("id") String id,@Param("password") String password);
	
	//아이디 중복검사
	public int idCheck(String id);
	
}