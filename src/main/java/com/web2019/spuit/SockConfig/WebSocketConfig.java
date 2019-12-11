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
         
        //메시지 브로커가 /topic/이 들어가는 구독자들에게 메시지를 전달해준다
        config.enableSimpleBroker("/subscribe");
         
        //클라이언트가 서버에게 /app 을 붙이고 메시지를 전달할 주소
        config.setApplicationDestinationPrefixes("/publish");
    }
 
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        //클라이언트가 서버에 접속할 Endpoint를설정한다.엔드포인트는 여러개 추가가능하다 .
        //client에서 Websocket대신 향상된 SockJS로 접속하려면 .withSockJS.()를 붙여준다.!
        registry.addEndpoint("/stomp-chat").setAllowedOrigins("*").withSockJS();
        logger.info("{}","세션접속");
    }
}