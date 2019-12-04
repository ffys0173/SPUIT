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
import com.web2019.spuit.otherClasses.ArticleCrawler;
import com.web2019.spuit.otherClasses.ArticleThread;
import com.web2019.spuit.service.ThreadService;

@RestController
@RequestMapping("/api/thread")
public class RestThreadController {
	
	@Inject
	private ThreadService threadService;
	
	private static final Logger logger = LoggerFactory.getLogger(RestUserController.class);

	@PostMapping("/search")
	public ArrayList<ArticleThread> threadsearch(@RequestBody String param) {
		
		String query = param.split("\"")[3];
		
		return threadService.getSearchResult(query);
	}
	
	@GetMapping("/loadNew")
	public String loadNew() {
		
		return "불러오기 성공!";
	}
	
	@PostMapping("/getRecent")
	public ArrayList<ArticleThread> getRecent(HttpServletRequest request) throws Exception {
		
		return threadService.getRecent();
	}
	
	@PostMapping("/getRecommend")
	public ArrayList<ArticleThread> getRecommend(HttpServletRequest request) throws Exception {
		
		HttpSession httpSession = request.getSession(true);
		SessionVO sessionInfo = (SessionVO)httpSession.getAttribute("sessionInfo");
		String id_no = null;
		
		if(sessionInfo != null) {			
			id_no = sessionInfo.getIdno();
		}
		
		return threadService.getRecommend(id_no);
	}
}
