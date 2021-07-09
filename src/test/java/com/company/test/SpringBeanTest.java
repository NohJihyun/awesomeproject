package com.company.test;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.awesome.service.UsersService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * 
 * 스프링을 실행하여 테스트 대상의 클래스가 스프링 컨테이너에 빈객체 생성유무와 주입유무를 테스트
 * 사전 Spring-test 라이브러리, Junit 라이브러리 등록 --> Junit은 반드시 4.10 이상 버전 사용권장
 */

@RunWith(SpringJUnit4ClassRunner.class)		//현재 테스트 코드가 스프링을 실행하는 역할을 할것이라는 의미 
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")	//지정된 위치의 설정파일을 이용해서 필요한 객체들을 스프링 내에 객체로 등록(즉 스프링의 빈으로 등록)
@Log4j	//Lombok을 이용해서 로그를 기록하는 Logger를 변수로 생성  별도 Logger객체선언 없이도 Log4j 라이브러리와 설정이 존재하면 바로 사용할수 있음
public class SpringBeanTest {
	
	@Setter(onMethod_ = { @Autowired })		//해당 객체를 스프링으로부터 자동으로 주입해 달라
	private UsersService user;
	
	@Test	// JUnit에서 테스트 대상을 표시하는 어노테이션
	public void testBean() {
		
		assertNotNull(user);	//객체가 null이 아니어야만 테스트가 성공한다는 것을 의미
		
		log.info(user);
		
	}
	
	
}
