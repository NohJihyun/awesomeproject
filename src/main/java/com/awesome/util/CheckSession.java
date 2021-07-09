package com.awesome.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sun.tools.javac.util.Log;

import lombok.extern.log4j.Log4j;

@Log4j
public class CheckSession {

	public static int checkUserSession(HttpSession session) {
		String id = (String) session.getAttribute("id");
		String role = (String) session.getAttribute("role");
		String photo = (String) session.getAttribute("photo");
		log.info("checkUserSession()>>>>>> " + "id: " + id + "role: " + role + "photo: " + photo);
		if (id != null && role.equals("USER")) {
			log.info("role" + role);
			return 1;
		} else {
			return 0;
		}
	}

	public static int checkMgrSession(HttpSession session) {
		String id = (String) session.getAttribute("id");
		String role = (String) session.getAttribute("role");
		log.info("checkMgrSession()>>>>>> " + "id: " + id + "role: " + role);
		if (id != null && role.equals("MGR")) {
			log.info("role" + role);
			return 1;
		} else {
			return 0;
		}
	}

	public static int checkProSession(HttpSession session) {
		String id = (String) session.getAttribute("id");
		String role = (String) session.getAttribute("role");
		log.info("checkProSession()>>>>>> " + "id: " + id + "role: " + role);
		if (id != null && role.equals("PRO")) {
			log.info("role" + role);
			return 1;
		} else {
			return 0;
		}
	}

	public static int checkAdminSession(HttpSession session) {
		String id = (String) session.getAttribute("id");
		String role = (String) session.getAttribute("role");
		log.info("checkAdminSession()>>>>>> " + "id: " + id + "role: " + role);
		if (id != null && (role.equals("ADMIN") || role.equals("PRO"))) {
			log.info("role" + role);
			return 1;
		} else {
			return 0;
		}
	}
	public static String getSession(HttpServletRequest request) {
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("id");
		return id;
	}
	
}
