package com.awesome.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.awesome.domain.UsersVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserDAOTest {

	@Setter(onMethod_ = { @Autowired })
	private UsersDAO userDAO;

//	// 목록가져오기 테스트
//	@Test
//	public void testGetList() {
//		userDAO.getList().forEach(user -> log.info(user));
//	}

//	// 검색 테스트
//	@Test
//	public void testGet() {
//		UserVO user = userDAO.get("test");
//		log.info(user);
//	}
//
	// 저장 테스트
	@Test
	public void testInsert() {
		UsersVO user = new UsersVO();
		user.setId("test2");
		user.setPassword("test1234");
		user.setName("홍길동");
		user.setNickname("테스터2");
		user.setJuminnum("990901-1544444");
		user.setEmail("aa@gmail.com");
		user.setPhonenum("010-1111-1111");
		user.setRole("ADMIN");

		userDAO.insert(user);
		log.info(user);
	}
//
//	// 수정 테스트
//	@Test
//	public void testUpdate() {
//		UserVO user = new UserVO();
//		user.setId("test");
//		user.setPassword("test1234");
//		user.setNickname("테스터");
//		user.setEmail("test@gmail.com");
//
//		log.info("Update cnt >>>" + userDAO.update(user));
//	}
//
//	// 삭제 테스트
//	@Test
//	public void testDelete() {
//		log.info("Delete cnt>>>" + userDAO.delete("test"));
//	}


}
