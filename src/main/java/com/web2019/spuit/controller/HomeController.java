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
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		HttpSession httpSession = request.getSession(true);
		
		logger.info("{}",httpSession.getAttribute("login"));
		if(httpSession.getAttribute("login") != null) {
			
			model.addAttribute("userInfo", httpSession.getAttribute("userNumber"));
		}
		else {
			
			model.addAttribute("userInfo", "not");
		}
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "home";
	}
	
	@GetMapping("/favorites")
	public String favorites() {
		
		return "favorites";
	}
}
