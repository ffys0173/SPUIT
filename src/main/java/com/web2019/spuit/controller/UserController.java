package com.web2019.spuit.controller;
  
import java.text.DateFormat; 
import java.util.Date; 
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger; 
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web2019.spuit.dto.UserVO;
import com.web2019.spuit.service.UserService;  
  
@Controller
@RequestMapping("/user") public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService service;
  
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login_get(Locale locale, Model model) {
  
		return "login";
	}
  
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login_post(Locale locale, Model model) {
  
		return "redirect:/";
	}
  
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String regist_get() throws Exception {
  
		service.selectUser();
		return "regist";
	}

	@ResponseBody
	@PostMapping("/regist")
	public void test(@RequestBody UserVO user) throws Exception {
		
//		System.out.println(user.getEmail());
		service.registUser(user);
		
	}
}
 