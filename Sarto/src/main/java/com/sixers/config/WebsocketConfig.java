package com.sixers.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.sixers.model.MyMessageHandler;

@Configuration
@EnableWebSocket
public class WebsocketConfig implements WebSocketConfigurer {
 
    @Bean
    public WebSocketHandler myMessageHandler() {
        return new MyMessageHandler();
    }
 
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(myMessageHandler(), "/my-websocket-endpoint");
    }
 
}