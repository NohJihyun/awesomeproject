package com.company.test;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

/**
 * 
 * JDBC 테스트 코드 
 *
 */


@Log4j
public class JDBCTest {
	static {
		try {
			//Class.forName("oracle.jdbc.driver.OracleDriver");
			Class.forName("org.mariadb.jdbc.Driver");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {
		//For MariaDB
		try(Connection conn = DriverManager.getConnection("jdbc:mariadb://54.180.125.56:3306/awesome?user=testdb&password=testdb1234")) {
				log.info("Connection: " + conn + " - 연결 성공");
		} catch (Exception e) {
			fail(e.getMessage());
		}
		
		//For Oracle18c
//		try(Connection conn =
//				DriverManager.getConnection(
//						"jdbc:oracle:thin:@localhost:1521:XE",
//						"c##testdb",
//						"testdb1234")) {
//				log.info(conn);
//		} catch (Exception e) {
//			fail(e.getMessage());
//		}
		
	}
	
}
