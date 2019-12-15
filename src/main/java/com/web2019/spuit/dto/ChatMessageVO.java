package com.web2019.spuit.dto;

public class ChatMessageVO {
	private boolean session;
	private String chatRoomId;
	private String writer;
	private String message;

	public boolean isSession() {
		return session;
	}
	public void setSession(boolean session) {
		this.session = session;
	}
	public String getChatRoomId() {
		return chatRoomId;
	}
	public void setChatRoomId(String chatRoomId) {
		this.chatRoomId = chatRoomId;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}