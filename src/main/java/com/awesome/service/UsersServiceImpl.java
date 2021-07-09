package com.awesome.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import org.springframework.stereotype.Service;
import com.awesome.domain.UsersVO;
import com.awesome.mapper.UsersDAO;
import com.awesome.util.EncryptUtil;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Service 클래스 /  비지니스 영역을 담당
 */

@Log4j
@Service
@AllArgsConstructor
public class UsersServiceImpl implements UsersService {

	//spring 4.3 이상에서 자동 주입(묵시적 생성)
	private UsersDAO usersDAO;
	
	@Override
	public void register(UsersVO usersVO) {
		log.info("register() ................" + usersVO);
		// 비번 암호화 처리후 저장
		EncryptUtil encryptUtil = new EncryptUtil();
		String password = usersVO.getPassword();
		try {
			String encryptPassword = encryptUtil.encryptSHA256(password);
			log.info(encryptPassword);
			usersVO.setPassword(encryptPassword);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		usersDAO.register(usersVO);
	}

	@Override
	public boolean modify(UsersVO usersVO) {
		log.info("modify() ............" + usersVO);
		return usersDAO.update(usersVO) == 1;	//정상적인 처리시 1 반환  == 연산자를 통해 true/false 처리
	}

	@Override
	public boolean remove(String id) {
		log.info("delete()............" + id);
		return usersDAO.delete(id) == 1;
	}

	@Override
	public List<UsersVO> getUsersList() {
		log.info("getUsersList() ..........." );
		return usersDAO.getUsersList();
	}

	//로그인 처리
	@Override
	public UsersVO login(String id, String password){
		log.info("login() ..........." );
		
		//입력한 패스워드를 암호화시켜서 비교 처리
		EncryptUtil encryptUtil = new EncryptUtil();
		String encryptPassword = "";
		try {
			encryptPassword = encryptUtil.encryptSHA256(password);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.info("encryptPassword" + encryptPassword);
		return usersDAO.login(id, encryptPassword);
	}
	
	//계정찾기
	@Override
	public UsersVO find_account(String id, String name, String email) {
		log.info("find_account().........." + name +","+ email+","+id);
		return usersDAO.find_account(id, name, email);
	}

	//비번병경 처리
	@Override
	public int updatePassword(String id, String password) {
		
		EncryptUtil encrypt = new EncryptUtil();
		
		String pwresult = "";
		try {
			pwresult = encrypt.encryptSHA256(password);
			log.info("updatePassword()............"+pwresult);
			
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return usersDAO.updatePassword(id, pwresult);
		
	}

	@Override
	public int idCheck(String id) {
		log.info("idCheck()............"+id);
		return usersDAO.idCheck(id);
	}

	@Override
	public void deleteShop(int rscode) {
		// TODO Auto-generated method stub
		
	}

}
