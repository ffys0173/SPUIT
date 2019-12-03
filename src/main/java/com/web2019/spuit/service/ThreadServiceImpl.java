package com.web2019.spuit.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.web2019.spuit.otherClasses.ArticleCrawler;
import com.web2019.spuit.otherClasses.ArticleThread;

@Service
public class ThreadServiceImpl implements ThreadService {

	public ArticleCrawler ac;
	
	@Override
	public ArrayList<ArticleThread> getSearchResult(String keyword) {
		
		return ac.getByKey(keyword);
	}

	@Override
	public ArrayList<ArticleThread> getRecommend(String uid_no) {
		
		try {
			return ac.getRecommend(uid_no);
			
		}
		catch(Exception e) {
			
			return null;
		}
	}

	@Override
	public ArrayList<ArticleThread> getRecent() {
		
		try {
			return ac.getRecent();
		}
		catch(Exception e) {
			
			return null;
		}
	}
}
