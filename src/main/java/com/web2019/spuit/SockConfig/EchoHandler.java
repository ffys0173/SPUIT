package com.web2019.spuit.SockConfig;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.web2019.spuit.dto.SessionVO;

public class EchoHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		SessionVO sessionInfo = (SessionVO)session.getAttributes().get("sessionInfo");
		for(WebSocketSession sess: sessionList) {
			if(sessionInfo != null) {
				sess.sendMessage(new TextMessage("<strong>" + sessionInfo.getId() + "</strong>" + " : "+message.getPayload()));
			}
			else {
				
				sess.sendMessage(new TextMessage(session.getId() + " : "+message.getPayload()));
			}
				
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}
}

