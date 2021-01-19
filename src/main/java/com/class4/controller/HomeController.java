package com.class4.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		// 로그인 여부 확인
		
		
		
		// 비로그인시 최신작, 개봉예정작을 model 객체로 attribute
		
		
		
		// 로그인 시 사용자가 설정한 선호 장르, 감독, 배우에 따른 영화를 model 객체로 attribute
		
		
		
		// 검색기록 쿠키에 따른 텍스트마이닝
		
		
		
		return "main";
	}
	
}
