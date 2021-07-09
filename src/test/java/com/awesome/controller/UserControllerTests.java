package com.awesome.controller;


import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * 
 * UserController용  Test 코드
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration	//Test for Controller
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/servlet-context.xml"
})
@Log4j
public class UserControllerTests {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext context;	//Servlet의 ServletContext 사용
	
	/* 가짜로 URL과 파라미터등을 브라우저에서 사용하는 것처럼 만들어서 Controller를 실행해 볼수 있다
	 * MockMvcRequestBuilder를 이용해서 HTTP 메서드를 호출한다.
	*/
	private MockMvc mockMvc;	
	
	@Before	//Junit 이용 모든 테스트 전에 매번 실행되는 매서드 지정
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	//@Test
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/user/list"))	 // get 방식 호출
					   .andReturn()
					   .getModelAndView()
					   .getModelMap());
	}
	
	//@Test
	public void testRegister() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/user/register")
								   .param("id", "test2")
								   .param("password", "test1234")
								   .param("name", "cloude")
								   .param("nickname", "tester")
								   .param("juminnum", "990901-15444444")
								   .param("email", "bbb@gmail.com")
								   .param("phonenum", "010-2222-2222")
								   .param("role", "user")
									)
									.andReturn()
									.getModelAndView()
									.getViewName();
		log.info(resultPage);
				
	}
	
	//@Test
	public void testGet() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
						.get("/user/get")
						.param("id", "test"))
						.andReturn()
						.getModelAndView()
						.getModelMap()
				);
	}
	
	//@Test
	public void testModify() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/user/modify")
								   .param("id", "test")
								   .param("password", "test1234")
								   .param("nickname", "관리자")
								   .param("email", "cc@gmail.com"))
								   .andReturn()
								   .getModelAndView()
								   .getViewName();
		log.info(resultPage);
				
	}
	
	@Test
	public void testRemove() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/user/remove")
								   .param("id", "aa"))
								   .andReturn()
								   .getModelAndView()
								   .getViewName();
		
		log.info(resultPage);
	}
}
