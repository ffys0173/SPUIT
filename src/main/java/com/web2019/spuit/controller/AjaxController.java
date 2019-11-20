package com.web2019.spuit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
@RequestMapping("/api")
public class AjaxController {
	
	@Inject
	private UserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);

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
	
	@PostMapping("/setFavorites")//HashMap<String, Integer>
	public int setFavorites(@RequestBody  ArrayList<String> favorites, HttpServletRequest request) {
		
		HttpSession httpSession = request.getSession(true);
		SessionVO sessionInfo = (SessionVO)httpSession.getAttribute("SessionInfo");
		
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		for(String favorite : favorites) {
			System.out.println(favorite);
			hashmap.put(favorite, 0);
		}
		
		UserFavorite userFavorite = new UserFavorite("1");//sessionInfo.getIdno()
		userFavorite.setFavoriteMap(hashmap);
		
		//userFavorite.WriteFile();
		
		return 1;
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
	
	@GetMapping("/logout")
	public int logout(HttpServletRequest request) {
		
		HttpSession httpSession = request.getSession(true);
		httpSession.invalidate();
		
		return 1;
	}
	
	@PostMapping("/secession")//회원탈퇴
	public int secession() {
		
		return 0;
	}
	
	@PostMapping("/usermodify")//회원정보수정
	public int usermodify() {
		
		return 0;
	}
	
	@GetMapping("/threadsearch")
	public int threadsearch() {
		
		return 0;
	}
	
	@GetMapping("/loadNew")
	public String loadNew() {
		
		return "불러오기 성공!";
	}
	
	@GetMapping("/thread")
	public int thread() {
		
		return 0;
	}
}
