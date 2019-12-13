package com.web2019.spuit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String defaultRequest() {
		
		return "redirect:app/home";
	}
	
	@GetMapping("/favicon.ico")
	public String favicon() {
		
		return "redirect:resources/img/favicon.ico";
	}
	
	@GetMapping("/accessDenied")
	public String accessDenied() {
		
		return "accessDenied";
	}
}
