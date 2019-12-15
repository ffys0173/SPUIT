package com.web2019.spuit.controller;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Date;

import javax.inject.Inject;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web2019.spuit.dto.KeywordVO;
import com.web2019.spuit.dto.SessionVO;
import com.web2019.spuit.otherClasses.ArticleCrawler;
import com.web2019.spuit.otherClasses.ArticleThread;
import com.web2019.spuit.otherClasses.UserFavorite;
import com.web2019.spuit.service.ThreadService;

@RestController
@RequestMapping("/api/thread")
public class RestThreadController {
	
	@Inject
	private ThreadService threadService;
	
	private static final Logger logger = LoggerFactory.getLogger(RestUserController.class);

	@PostMapping("/search")
	public ArrayList<ArticleThread> threadsearch(@RequestBody String param, HttpServletRequest request) throws ClassNotFoundException, IOException {
		
		String query = param.split("\"")[3];//{"query":"key"}와 같은 형식으로 전달되므로...
		
		HttpSession httpSession = request.getSession(true);
		SessionVO sessionInfo = (SessionVO)httpSession.getAttribute("sessionInfo");
		
		if(sessionInfo != null) {
			UserFavorite uf = new UserFavorite(sessionInfo.getIdno());
			uf.ReadFile();
			uf.addFavorite(query, 1);
			uf.WriteFile();
		}
		
		return threadService.getSearchResult(query);
	}
	
	@PostMapping("/getArticle")
	public ArticleThread getArticle(@RequestBody String param) {
		String url = param.split("\"")[3];
		System.out.println(url);
		ArticleThread at=threadService.getContext(url);
		
		at.setArticleSource("한겨례");
		
		return at;
			
	}
	
	@PostMapping("/getRecent")
	public ArrayList<ArticleThread> getRecent(@RequestBody String param, HttpServletRequest request) throws Exception {
		
		int offset = Integer.parseInt(param.split(":")[1].replace("}", ""));
		
		return threadService.getRecent(offset);
	}
	
	@PostMapping("/getRecommend")
	public ArrayList<ArticleThread> getRecommend(@RequestBody String param, HttpServletRequest request) throws Exception {
		
		HttpSession httpSession = request.getSession(true);
		SessionVO sessionInfo = (SessionVO)httpSession.getAttribute("sessionInfo");
		String id_no = "default";
		int offset = Integer.parseInt(param.split(":")[1].replace("}", ""));
		
		if(sessionInfo != null) {
			id_no = sessionInfo.getIdno();
		}
		
		return threadService.getRecommend(id_no, offset);
	}
	
	@GetMapping("/getKeys")
	public int getKeys() {
		
		threadService.getKeys();
		
		return 1;
	}
}
