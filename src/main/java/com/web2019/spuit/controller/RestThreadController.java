package com.web2019.spuit.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.web2019.spuit.otherClasses.ArticleCrawler;
import com.web2019.spuit.otherClasses.ArticleThread;

@RestController
@RequestMapping("/api/thread")
public class RestThreadController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestUserController.class);

	@GetMapping("/threadsearch")
	public int threadsearch() {
		
		return 0;
	}
	
	@GetMapping("/loadNew")
	public String loadNew() {
		
		return "�ҷ����� ����!";
	}
	
	@GetMapping("/get")
	public ArrayList<ArticleThread> get() {
		
		//favorites = getFavorites()
		//getListofArticle(favorites)
		ArticleCrawler ac = new ArticleCrawler();
		
		ArrayList<ArticleThread> loat = ac.getListofArticle(null);
		
		return loat;
	}
}
