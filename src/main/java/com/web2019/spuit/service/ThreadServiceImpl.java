package com.web2019.spuit.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.web2019.spuit.otherClasses.ArticleCrawler;
import com.web2019.spuit.otherClasses.ArticleThread;

@Service
public class ThreadServiceImpl implements ThreadService {

	private ArticleCrawler ac;
	
	public ThreadServiceImpl() {
		
		ac = new ArticleCrawler();
	}
	
	@Override
	public ArrayList<ArticleThread> getSearchResult(String keyword) {
		
		return ac.getByKey(keyword);
	}

	@Override
	public ArrayList<ArticleThread> getRecommend(String uid_no, int offset) {
		
		try {
			return ac.getRecommend(uid_no, offset);
			
		}
		catch(Exception e) {
			
			return null;
		}
	}

	@Override
	public ArrayList<ArticleThread> getRecent(int offset) {
		
		try {
			return ac.getRecent(offset);
		}
		catch(Exception e) {
			
			return null;
		}
	}
}
