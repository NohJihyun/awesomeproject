package com.company.test;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * 
 * Hikari dataSource 테스트
 * 
 * 사전 pom.xml에 HikariCP 추가
 *      root-context.xml에 HikariConfig, HikariDataSource  객체 추가
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)		//현재 테스트 코드가 스프링을 실행하는 역할을 할것이라는 의미 
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")	//지정된 위치의 설정파일을 이용해서 필요한 객체들을 스프링 내에 객체로 등록(즉 스프링의 빈으로 등록)
@Log4j	//Lombok을 이용해서 로그를 기록하는 Logger를 변수로 생성  별도 Logger객체선언 없이도 Log4j 라이브러리와 설정이 존재하면 바로 사용할수 있음
public class DataSourceTest {

	@Setter(onMethod_ = { @Autowired })
	private DataSource datasource;
	
	@Setter(onMethod_ = { @Autowired })
	private SqlSessionFactory sqlSessionFactory;
	
	
	@Test
	public void testConnection() {
		
		try (Connection conn = datasource.getConnection()) {
			
			log.info("Connection 객체:" + conn);
			
		} catch(Exception e) {
			fail(e.getMessage());
		}
	}
	
	//Mybatis SqlSession 테스트
//	@Test
//	public void testMybatis() {
//		
//		try (SqlSession session = sqlSessionFactory.openSession();
//			Connection conn = session.getConnection();) {
//			
//			log.info("Session 객체:" +session);
//			log.info("Connection 객체:" +conn);
//			
//		} catch (Exception e) {
//			fail(e.getMessage());
//		}
//	}
//	
	
}
