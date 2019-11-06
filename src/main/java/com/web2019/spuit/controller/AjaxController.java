package com.web2019.spuit.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web2019.spuit.dto.UserVO;
import com.web2019.spuit.service.UserService;

@RestController
@RequestMapping("/api")
public class AjaxController {
	
	@Inject
	private UserService service;

	@PostMapping("/regist")
	public int test(@RequestBody UserVO user) throws Exception {
		
		int result = service.registUser(user);
		
		return result;
	}
	
	@PostMapping("/login")
	public int login_post(Locale locale, Model model) {
  
		return 0;
	}
}
