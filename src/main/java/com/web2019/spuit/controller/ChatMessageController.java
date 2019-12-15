package com.web2019.spuit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.RestController;

import com.web2019.spuit.dto.ChatMessageVO;


@RestController
public class ChatMessageController {
    
	private final SimpMessagingTemplate template;

    @Autowired
    public ChatMessageController(SimpMessagingTemplate template) {
        this.template = template;
    }

    @MessageMapping("/chat/message")
    public void message(ChatMessageVO message) {
        template.convertAndSend("/subscribe/chat/room/" + message.getChatRoomId(), message);
    }
}