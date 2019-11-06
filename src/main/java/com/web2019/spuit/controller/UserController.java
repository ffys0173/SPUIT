package com.web2019.spuit.controller;
  
import java.util.Locale;

import org.slf4j.Logger; 
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
  
@Controller
@RequestMapping("/user") public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
  
	@GetMapping("/login")
	public String login_get(Locale locale, Model model) {
  
		return "login";
	}
  
	@GetMapping("/regist")
	public String regist_get() throws Exception {
		
		return "regist";
	}
}
 