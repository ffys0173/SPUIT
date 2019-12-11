package com.web2019.spuit.SockConfig;

import org.springframework.context.annotation.ComponentScan;

/*
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.context.annotation.Configuration; import
 * org.springframework.web.socket.config.annotation.EnableWebSocket; import
 * org.springframework.web.socket.config.annotation.WebSocketConfigurer; import
 * org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
 * 
 * @Configuration
 * 
 * @EnableWebSocket public class WebSocketConfig implements WebSocketConfigurer{
 * 
 * @Autowired private EchoHandler echoHandler;
 * 
 * @Override public void registerWebSocketHandlers(WebSocketHandlerRegistry
 * registry) { registry.addHandler(echoHandler, "/echo"); } }
 */

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Configuration
@EnableWebSocketMessageBroker
@ComponentScan(basePackages = { "com.web2019.spuit.controller" })
public class WebSocketConfig extends AbstractWebSocketMessageBrokerConfigurer {
 
    private static Logger logger = LoggerFactory.getLogger(WebSocketConfig.class);
 
    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
         
        //�޽��� ���Ŀ�� /topic/�� ���� �����ڵ鿡�� �޽����� �������ش�
        config.enableSimpleBroker("/subscribe");
         
        //Ŭ���̾�Ʈ�� �������� /app �� ���̰� �޽����� ������ �ּ�
        config.setApplicationDestinationPrefixes("/publish");
    }
 
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        //Ŭ���̾�Ʈ�� ������ ������ Endpoint�������Ѵ�.��������Ʈ�� ������ �߰������ϴ� .
        //client���� Websocket��� ���� SockJS�� �����Ϸ��� .withSockJS.()�� �ٿ��ش�.!
        registry.addEndpoint("/stomp-chat").setAllowedOrigins("*").withSockJS();
        logger.info("{}","��������");
    }
}