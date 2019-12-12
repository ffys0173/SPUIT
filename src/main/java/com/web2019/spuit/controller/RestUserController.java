package com.web2019.spuit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web2019.spuit.dto.SessionVO;
import com.web2019.spuit.dto.UserVO;
import com.web2019.spuit.otherClasses.UserFavorite;
import com.web2019.spuit.service.UserService;

@RestController
@RequestMapping("/api/user")
public class RestUserController {
	
	@Inject
	private UserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(RestUserController.class);

	@GetMapping("/isLogin")
	public boolean isLogin(HttpServletRequest request) {
		
		HttpSession httpSession = request.getSession(true);
		SessionVO sessionInfo = (SessionVO)httpSession.getAttribute("sessionInfo");
		
		if(sessionInfo != null) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@PostMapping("/getName")
	public SessionVO getSession(HttpServletRequest request) {
		
		HttpSession httpSession = request.getSession(true);
		SessionVO sessionInfo = (SessionVO)httpSession.getAttribute("sessionInfo");
		SessionVO returnSession = new SessionVO();
		if(sessionInfo != null) {
			returnSession.setName(sessionInfo.getName());
			returnSession.setSession(true);
		}
		else {
			returnSession.setName(httpSession.getId().substring(0, 7));
			returnSession.setSession(false);
		}
		return returnSession;
	}
	
	@PostMapping("/login")
	public int login(@RequestBody UserVO user, HttpServletRequest request) {
		
        HttpSession httpSession = request.getSession(true);
        
        try {
        	
        	SessionVO sessionInfo = service.loginCheck(user);
        	
        	logger.info("logined - {}", sessionInfo.getIdno());

        	httpSession.setAttribute("login", "true");
        	httpSession.setAttribute("sessionInfo", sessionInfo);
        	
        	return 1;
        }
        catch (Exception e) {
        	
        	return 0;
        }
	}
	
	@PostMapping("/regist")
	public int regist(@RequestBody UserVO user, HttpServletRequest request) throws Exception {
		
		UserVO forLogin = new UserVO();
		forLogin.setId(user.getId());
		forLogin.setPw(user.getPw());
		int result = service.registUser(user);
		
		int test = login(forLogin, request);
		logger.info("{}", test);
		return result;
	}
	
	@GetMapping("/logout")
	public int logout(HttpServletRequest request) {
		
		HttpSession httpSession = request.getSession(true);
		httpSession.invalidate();
		
		return 1;
	}
	
	@PostMapping("/auth/modify")
	public int modify(@RequestBody UserVO user) {
		
		System.out.println(user.getEmail());
		return 0;
	}
	
	@PostMapping("/auth/setFavorites")
	public int setFavorites(@RequestBody  ArrayList<String> favorites, HttpServletRequest request) {
		
		HttpSession httpSession = request.getSession(true);
		SessionVO sessionInfo = (SessionVO)httpSession.getAttribute("sessionInfo");
		
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		for(String favorite : favorites) {
			hashmap.put(favorite, 100);
		}
		System.out.println(sessionInfo.getIdno());
		UserFavorite userFavorite = new UserFavorite(sessionInfo.getIdno());
		userFavorite.setFavoriteMap(hashmap);
		
		try {
			userFavorite.WriteFile();
			return 1;
		}
		catch(Exception e) {
			return 0;			
		}
	}
	
	@PostMapping("/auth/getFavorites")
	public ArrayList<String> getFavorites(HttpServletRequest request) throws Exception {
		
		HttpSession httpSession = request.getSession(true);
		SessionVO sessionInfo = (SessionVO)httpSession.getAttribute("sessionInfo");
		
		UserFavorite userFavorite = new UserFavorite(sessionInfo.getIdno());
		userFavorite.ReadFile();
		
		HashMap<String, Integer> ufmap = userFavorite.getFavoriteMap();
		ArrayList<String> array = new ArrayList<String>();
		
		for(Map.Entry<String, Integer> entry : ufmap.entrySet()) {
			array.add(entry.getKey()); 
		}
		
		return array;
	}
	
	@PostMapping("/auth/leave")//ȸ��Ż��
	public int leave(@RequestBody UserVO user, HttpServletRequest request) {
		
		try {
			if(service.loginCheck(user) != null) {
				service.userLeave(user);
				logout(request);		
			}
			
			return 1;
		}
		catch (Exception e) {
		
			return 0;
		}
	}
}
