package com.class4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping("/join")
	public String join() {
		return "user/join";
	}
	
	@RequestMapping("/joinForm")
	public String joinForm() {
		return "user/login";
	}
	
	@RequestMapping("/login")
	public String login() {
		System.out.println(1);
		return "user/login";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "redirect:/user/mypage";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "user/mypage";
	}
	
	@RequestMapping("/userInfo")
	public String userInfo() {
		return "user/userInfo";
	}
	
}
