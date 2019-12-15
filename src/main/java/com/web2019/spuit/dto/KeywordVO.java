package com.web2019.spuit.dto;

public class KeywordVO {

	private String keyword;
	private int value;
	
	public KeywordVO() {
		
	}
	
	public KeywordVO(String keyword, int value) {
		this.keyword = keyword;
		this.value = value;
	}

	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
}
