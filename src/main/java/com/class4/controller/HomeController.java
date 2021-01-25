package com.class4.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class4.command.MovieInfoVO;
import com.class4.home.service.HomeService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	@Qualifier("HomeService")
	private HomeService homeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request, String id) {
		
		// 로그인 여부 확인
		
		// 비로그인시 최신작, 개봉예정작을 model 객체로 attribute
		HashMap<String, ArrayList<MovieInfoVO>> mainMovieList = homeService.getMainMovieList();
		model.addAttribute("mainRecentlyList", mainMovieList.get("recent"));
		model.addAttribute("mainCommingSoonList", mainMovieList.get("commingSoon"));
		
		
		
		
		// 로그인 시 사용자가 설정한 선호 배우, 감독, 장르에 따른 영화를 model 객체로 attribute
		HashMap<String, ArrayList<MovieInfoVO>> userLikeList = homeService.getUserLikeList(id);
		// 선호하는 배우 attribute
		model.addAttribute("userLikeActorList", userLikeList.get("userActor"));
		// 선호하는 감독 attribute
		model.addAttribute("userLikeDirectorList", userLikeList.get("userDirector"));
		// 선호하는 장르 attribute
		model.addAttribute("userLikeGenreList", userLikeList.get("userGenre"));

		return "main";
	}
	
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(String keyword, Model model) {
		
		ArrayList<MovieInfoVO> result = homeService.searchMovie(keyword);
		// homeService.addSearchHistory(id, keyword);
		
		model.addAttribute("searchResult", result);
		
		
		
		return "movieSearch";
	}
	
	// 이런 영화는 어떠세요 버튼 누를 시 작동
	// 검색 기록에서 많이 사용된 단어로 영화 검색
	@RequestMapping(value = "/searchHistory", method = RequestMethod.GET)
	public String searchHistory(String id, Model model) {
		
		// 검색기록 쿠키에 따른 텍스트마이닝
		ArrayList<MovieInfoVO> searchHistoryList = homeService.getSearchHistoryMovieList(id);
		model.addAttribute("searchHistoryList", searchHistoryList);
		
		return "movieSearch";
	}
	
	
	
	
	
	
	
}
