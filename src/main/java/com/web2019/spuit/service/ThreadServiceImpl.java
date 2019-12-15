package com.web2019.spuit.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web2019.spuit.dao.KeywordDAO;
import com.web2019.spuit.dto.KeywordVO;
import com.web2019.spuit.otherClasses.ArticleCrawler;
import com.web2019.spuit.otherClasses.ArticleThread;

@Service
public class ThreadServiceImpl implements ThreadService {

	@Inject
	private KeywordDAO dao;

	private ArticleCrawler ac;
	
	public ThreadServiceImpl() {
		
		ac = new ArticleCrawler();
	}
	
	@Override
	public ArrayList<ArticleThread> getSearchResult(String keyword) {
		
		dao.updateKeyword(new KeywordVO(keyword, 0));
		return ac.getByKey(keyword);
	}

	@Override
	public ArrayList<ArticleThread> getRecommend(String uid_no, int offset) {
		
		try {
			
			if(uid_no != "default") {
				
				return ac.getRecommend(uid_no, offset);
			}
			else {
				
				ArrayList<KeywordVO> lok = new ArrayList<KeywordVO>(dao.getAllKeywords());
				
				return ac.getRecommend(lok, offset);
			}
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

	@Override
	public int updateKeyword(KeywordVO key) {
		
		dao.updateKeyword(key);
		
		return 1;
	}
	
	@Override
	public List<KeywordVO> getKeys() {
		
		return dao.getAllKeywords();
	}
}
