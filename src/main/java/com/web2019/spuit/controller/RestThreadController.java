package com.web2019.spuit.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web2019.spuit.dto.SessionVO;
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
		
		return "불러오기 성공!";
	}
	
	@GetMapping("/get")
	public ArrayList<ArticleThread> get(HttpServletRequest request) throws Exception {
		
		HttpSession httpSession = request.getSession(true);
		SessionVO sessionInfo = (SessionVO)httpSession.getAttribute("sessionInfo");
		String id_no = null;
		
		if(sessionInfo != null) {			
			id_no = sessionInfo.getIdno();
		}
		
		ArticleCrawler ac = new ArticleCrawler();
		ArrayList<ArticleThread> loat = ac.getListofArticle(id_no);
		
		return loat;
	}
}
