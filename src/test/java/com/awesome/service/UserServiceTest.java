package com.awesome.service;

import static org.junit.Assert.assertNotNull;

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
public class UserServiceTest {
	
	@Setter(onMethod_ = { @Autowired})
	private UsersService service;
	
	//@Test
	public void testExists() {
		log.info(service);
		assertNotNull(service);
	}
	
	//@Test
	public void testRegister() {
		UsersVO user = new UsersVO();
		user.setId("test2");
		user.setPassword("test1234");
		user.setName("홍길동");
		user.setNickname("테스터2");
		user.setJuminnum("990901-1544444");
		user.setEmail("aa@gmail.com");
		user.setPhonenum("010-1111-1111");
		user.setRole("ADMIN");
		
		service.register(user);
		
		log.info("등록" + user);
	}
	
	//@Test
	public void testGetList() {
		service.getList().forEach(user -> log.info(user));
	}
	
//	@Test
	public void testGet() {
		log.info(service.get("test"));
	}

	@Test
	public void testUpdate() {
		UsersVO user = service.get("test");	// id = test 인 user 객체 가져옴
		if(user == null) return;
		user.setEmail("test2@gmail.com");	// email 수정
		log.info("수정 결과:" + service.modify(user));
	}
	
	//@Test
	public void testDelete() {
		log.info("삭제 결과:" + service.remove("test"));
	}
	
}
 