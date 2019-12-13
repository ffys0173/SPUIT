package com.web2019.spuit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/app")
public class AppController {
	
	@GetMapping("/home")
	public String home(HttpServletRequest request, Model model) {

		HttpSession httpSession = request.getSession(true);
		
		if(httpSession.getAttribute("login") == null) {
		
			httpSession.setAttribute("login", false);			
		}
		
		model.addAttribute("path", "/app/home");
		model.addAttribute("chat", "true");
		
		return "main";
	}
	
	@GetMapping("/search")
	public String search(HttpServletRequest request, @RequestParam("query") String query, Model model) {
		
		model.addAttribute("path", "/app/search?query=" + query); // + Äõ¸®
		model.addAttribute("chat", "true");
		
		return "main";
	}
	
	@GetMapping("/regist")
	public String regist(HttpServletRequest request, Model model) {
		
		model.addAttribute("path", "/app/regist");
		model.addAttribute("chat", "false");
		
		return "main";
	}
	
	@GetMapping("/article")
	public String article(HttpServletRequest request, Model model) {
		
		model.addAttribute("path", "/app/article");
		model.addAttribute("chat", "true");
		
		return "main";
	}
	
	@GetMapping("/auth/mypage")
	public String mypage(HttpServletRequest request, Model model) {
		
		model.addAttribute("path", "/app/auth/mypage");
		model.addAttribute("chat", "false");
		return "main";
	}
	
	@GetMapping("/auth/setFavorites")
	public String setFavorites(HttpServletRequest request, Model model) {
		
		model.addAttribute("path", "/app/auth/setFavorites");
		model.addAttribute("chat", "false");
		
		return "main";
	}
}
