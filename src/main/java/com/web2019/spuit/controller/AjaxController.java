package com.web2019.spuit.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web2019.spuit.dto.UserFavorite;
import com.web2019.spuit.dto.UserVO;
import com.web2019.spuit.service.UserService;

@RestController
@RequestMapping("/api")
public class AjaxController {
	
	@Inject
	private UserService service;

	private UserFavorite userfavorite = new UserFavorite("1");

	@PostMapping("/regist")
	public int regist(@RequestBody UserVO user) throws Exception {
		
		int result = service.registUser(user);
		
		return result;
	}
	
	@PostMapping("/login")
	public int login(@RequestBody UserVO user) {
  
		return 0;
	}
}
