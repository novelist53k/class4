package com.class4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class4.command.UserVO;
import com.class4.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	@Qualifier("UserService")
	private UserService userService;
	
	@RequestMapping("/join")
	public String join() {
		return "user/join";
	}
	
	@RequestMapping("/joinForm")
	public String joinForm() {
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
	
	@ResponseBody
	@RequestMapping(value="login", method=RequestMethod.POST)
	public int login(@RequestBody UserVO vo) {
		System.out.println("로그인");
		System.out.println(vo.toString());
		return 1;
	}
	@ResponseBody
	@RequestMapping(value="JoinReq", method=RequestMethod.POST)
	public int JoinReq(UserVO vo) {
		System.out.println("가입");
		System.out.println(vo.toString());
		int result = userService.JoinReq(vo);
		return result;		
	}
}
