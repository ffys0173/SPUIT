package com.web2019.spuit.controller;

import org.slf4j.Logger; 
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
  
@Controller
@RequestMapping("/user") public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
  
	@GetMapping("/login")
	public String login_get() {
  
		return "login";
	}
  
	@GetMapping("/regist")
	public String regist_get() throws Exception {
		
		return "regist";
	}
	
	@GetMapping("/auth/setFavorites")
	public String setFavorites_get() throws Exception {
		
		return "setFavorites";
	}
}
 