package com.class4.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


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
	
		
	@RequestMapping("/mypage")
	public String mypage() {
		return "user/mypage";
	}
	@ResponseBody
	@RequestMapping(value="idCheck", method=RequestMethod.POST)
	public int idCheck(@RequestBody UserVO vo) {
		System.out.println(vo.getUserId());
		int result = userService.idCheck(vo.getUserId());
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="login", method=RequestMethod.POST)
	public ModelAndView login(@RequestBody UserVO vo, Model model, HttpSession session) {
		
		UserVO result = userService.Login(vo);
		
		
		ModelAndView mv = new ModelAndView();//뷰와model정보를 동시에 저장
		mv.setViewName("user/userLogin");
		
		if(result != null) {//로그인			
			mv.addObject("login", result);
			
		}else {//로그인 실패
			mv.addObject("msg","아이디 비밀번호를 확인하세요");
		}
		
		return mv;
	}
	@RequestMapping(value="JoinReq", method=RequestMethod.POST)
	@ResponseBody
	public int JoinReq(UserVO vo , 
			@RequestParam (value="genreList[]") List<String> genreList,
			@RequestParam (value="actorList[]") List<String> actorList,
			@RequestParam (value="directorList[]") List<String> directorList) {
		
		System.out.println(vo.toString());
		System.out.println("넘어옴");
		for(String genre : genreList) {
		System.out.println(genre);}
		
		int result = userService.JoinReq(vo);
		
		return result;		
	}
}
