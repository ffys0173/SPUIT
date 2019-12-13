package com.web2019.spuit.controller;

import java.util.ArrayList;

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
		
		String query = param.split("\"")[3];//{"query":"key"}�� ���� �������� ���޵ǹǷ�...
		
		return threadService.getSearchResult(query);
	}
	
	@PostMapping("/getArticle")
	public ArticleThread getArticle(@RequestBody String param) {
		
		String url = param.split("\"")[3];
		System.out.println(url);
		
		ArticleThread at = new ArticleThread();
		at.setArticleTitle("��� ����");
		at.setArticleContent("��� ����");
		at.setArticleCategory("����");
		at.setArticleRegisted("����");
		at.setArticleSource("�����𳪴´���");
		at.setArticleTag("�±�");
		at.setArticleThumbnail("�̹���");
		at.setArticleUrl("�������ΰ��±�");
		return at;
	}
	
	@PostMapping("/getRecent")
	public ArrayList<ArticleThread> getRecent(@RequestBody String param, HttpServletRequest request) throws Exception {
		
		int offset = Integer.parseInt(param.split(":")[1].replace("}", ""));
		
		return threadService.getRecent(offset);
	}
	
	@PostMapping("/getRecommend")
	public ArrayList<ArticleThread> getRecommend(@RequestBody String param, HttpServletRequest request) throws Exception {
		
		int offset = 0;
		
		HttpSession httpSession = request.getSession(true);
		SessionVO sessionInfo = (SessionVO)httpSession.getAttribute("sessionInfo");
		String id_no = null;
		
		if(sessionInfo != null) {
			offset = Integer.parseInt(param.split(":")[1].replace("}", ""));
			id_no = sessionInfo.getIdno();
			return threadService.getRecommend(id_no, offset);
		}
		else {
			return null;
		}
	}
}
