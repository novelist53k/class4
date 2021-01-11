package com.class4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@RequestMapping("/reviewRegist")
	public String reviewRegist() {
		return "review/reviewRegist";
	}
	
	@RequestMapping("/reviewRegistForm")
	public String reviewRegistForm() {
		return "redirect:/review/reviewList";
	}
	
	@RequestMapping("/reviewList")
	public String reviewList() {
		return "review/reviewList";
	}
	
	@RequestMapping("/reviewContent")
	public String reviewContent() {
		return "review/reviewContent";
	}
	
	@RequestMapping("/reviewUpdate")
	public String reviewUpdate() {
		return "review/reviewUpdate";
	}
	
	@RequestMapping("/reviewUpdateForm")
	public String reviewUpdateForm() {
		return "review/reviewContent";
	}
	
	
}
