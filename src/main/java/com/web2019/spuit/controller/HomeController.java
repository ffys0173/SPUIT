package com.web2019.spuit.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")
	public String defaultRequest() {
		
		return "redirect:main";
	}
	
	@RequestMapping("/main")
	public String main(Locale locale, Model model, HttpServletRequest request) {
		
		logger.info("Welcome home! The client locale is {}.", locale);

		HttpSession httpSession = request.getSession(true);
		
		logger.info("{}",httpSession.getAttribute("login"));
		
		if(httpSession.getAttribute("login") != null) {
			
		}
		else {
			
			httpSession.setAttribute("login", false);
		}
		
		return "main";
	}
	
	@GetMapping("/favicon.ico")
	public String favicon() {
		
		return "redirect:resources/img/favicon.ico";
	}
	
	@GetMapping("/search")
	public String search() {
		
		return "search";
	}
	
	@GetMapping("/chat")
	public String chat() {
		
		return "chat";
	}
	
	@GetMapping("/accessDenied")
	public String accessDenied() {
		
		return "accessDenied";
	}
}
