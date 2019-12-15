package com.web2019.spuit.service;

import java.util.ArrayList;
import java.util.List;

import com.web2019.spuit.dto.KeywordVO;
import com.web2019.spuit.otherClasses.ArticleThread;

public interface ThreadService {

	public ArrayList<ArticleThread> getSearchResult(String keyword);
	public ArrayList<ArticleThread> getRecommend(String uid_no, int offset);
	public ArrayList<ArticleThread> getRecent(int offset);
	public List<KeywordVO> getKeys();
	public int updateKeyword(KeywordVO key);
}
