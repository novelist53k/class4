package com.class4.controller;

import java.util.ArrayList;
import java.util.Iterator;
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
import com.class4.command.UserlistVO;
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
	public int login(@RequestBody UserVO vo, Model model, HttpSession session) {
		
		UserVO result = userService.Login(vo);
		
		if(result == null) {
			
			return 0;
		}else {
			session.setAttribute("userVO", result);
			return 1;
		}
		
		
	}
	@RequestMapping(value="JoinReq", method=RequestMethod.POST)	
	public String Join(UserVO vo) {
		int result1 = 0;
		for (int i = 0; i < vo.getGenreLike().length; i++) {			
			vo.setGenre(vo.getGenreLike()[i]);
			result1 = userService.genreList(vo);
			
		}
		System.out.println(result1);
		for (int i = 0; i < vo.getLikeActor().length; i++) {
			vo.setActor(vo.getLikeActor()[i]);
			userService.actorList(vo);
		}
		for (int i = 0; i < vo.getLikeDirector().length; i++) {
			vo.setDirector(vo.getLikeDirector()[i]);
			userService.directorList(vo);
		}
			
		int result = userService.JoinReq(vo);
		if(result ==1) {
			
			return "redirect:/";
		}else {
			
			return "/join";		
			
		}
		
	}
	
	
}
