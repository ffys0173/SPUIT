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
import com.web2019.spuit.otherClasses.ArticleCrawler;
import com.web2019.spuit.otherClasses.ArticleThread;
import com.web2019.spuit.otherClasses.UserFavorite;
import com.web2019.spuit.service.UserService;

@RestController
@RequestMapping("/api/thread")
public class RestThreadController {
	
	@Inject
	private UserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(RestUserController.class);

	@GetMapping("/threadsearch")
	public int threadsearch() {
		
		return 0;
	}
	
	@GetMapping("/loadNew")
	public String loadNew() {
		
		return "불러오기 성공!";
	}
	
	@GetMapping("/get")
	public ArticleThread get() {
		
		//favorites = getFavorites()
		//getListofArticle(favorites)
		ArticleCrawler ac = new ArticleCrawler();
		
		ArticleThread at = ac.getArticle(" ");
		
		return at;
	}
}
