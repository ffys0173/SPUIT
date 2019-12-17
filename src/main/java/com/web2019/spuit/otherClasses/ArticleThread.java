package com.web2019.spuit.otherClasses;

import java.util.Calendar;
import java.util.Date;

public class ArticleThread {
	
	private String ArticleTitle;
	private String ArticleContent;
	private String ArticleSource;
	private String ArticleUrl;
	private String ArticleCategory;
	private String ArticleTag;
	private Calendar ArticleRegisted;
	private String ArticleThumbnail;
	
	public String getArticleTag() {
		return ArticleTag;
	}
	public void setArticleTag(String articleTag) {
		ArticleTag = articleTag;
	}
	public String getArticleCategory() {
		return ArticleCategory;
	}
	public void setArticleCategory(String articleCategory) {
		ArticleCategory = articleCategory;
	}
	public String getArticleUrl() {
		return ArticleUrl;
	}
	public void setArticleUrl(String articleUrl) {
		ArticleUrl = articleUrl;
	}
	public String getArticleThumbnail() {
		return ArticleThumbnail;
	}
	public void setArticleThumbnail(String articleThumbnail) {
		ArticleThumbnail = articleThumbnail;
	}
	
	public String getArticleTitle() {
		return ArticleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		ArticleTitle = articleTitle;
	}
	public String getArticleContent() {
		return ArticleContent;
	}
	public void setArticleContent(String articleContent) {
		ArticleContent = articleContent;
	}
	public String getArticleSource() {
		return ArticleSource;
	}
	public void setArticleSource(String articleSource) {
		ArticleSource = articleSource;
	}
	public Calendar getArticleRegisted() {
		return ArticleRegisted;
	}
	public void setArticleRegisted(Calendar articleRegisted) {
		ArticleRegisted = articleRegisted;
	}
	
	@Override
	public int hashCode(){
	return this.ArticleUrl.hashCode();
	}

	@Override
	public boolean equals(Object obj){
		if(obj instanceof ArticleThread){
			ArticleThread temp = (ArticleThread) obj;
			if(this.ArticleUrl.equals(temp.ArticleUrl)){
				return true;
			}
		}
		return false;
	}
}
