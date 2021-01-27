package com.class4.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.class4.command.MovieInfoVO;
import com.class4.command.UserVO;
import com.class4.home.service.HomeService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	@Qualifier("HomeService")
	private HomeService homeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request, String id) {

		// 최신작, 개봉예정작을 model 객체로 attribute
		HashMap<String, ArrayList<MovieInfoVO>> mainMovieList = homeService.getMainMovieList();
		model.addAttribute("mainRecentlyList", mainMovieList.get("recent"));
		model.addAttribute("mainCommingSoonList", mainMovieList.get("commingSoon"));

		return "main";
	}
	
	
	// 유저가 선호하는 배우의 출연작 가져오기
	@GetMapping("/userLikeActor/{id}")
	@ResponseBody
	public ArrayList<MovieInfoVO> userLikeActor(@PathVariable String id) {
		ArrayList<MovieInfoVO> userLikeActorList = homeService.getUserActorML(id);
		System.out.println(userLikeActorList);
		System.out.println(userLikeActorList.size());
		return userLikeActorList;
	}
	
	// 유저가 선호하는 감독의 영화 가져오기
	@GetMapping("/userLikeDirector/{id}")
	@ResponseBody
	public ArrayList<MovieInfoVO> userLikeDirector(@PathVariable String id) {
		ArrayList<MovieInfoVO> userLikeDirectorList = homeService.getUserDirectorML(id);
		System.out.println(userLikeDirectorList);
		System.out.println(userLikeDirectorList.size());
		return userLikeDirectorList;
	}
	
	// 유저가 선호하는 감독의 영화 가져오기
	@GetMapping("/userLikeGenre/{id}")
	@ResponseBody
	public ArrayList<MovieInfoVO> userLikeGenre(@PathVariable String id) {
		ArrayList<MovieInfoVO> userLikeGenreList = homeService.getUserGenreML(id);
		System.out.println(userLikeGenreList);
		System.out.println(userLikeGenreList.size());
		return userLikeGenreList;
	}
	
	// 나이별 선호 영화 가져오기
	@GetMapping("/userLikeByAge/{age}")
	@ResponseBody
	public ArrayList<MovieInfoVO> userLikeByAge(@PathVariable String age) {
		ArrayList<MovieInfoVO> userLikeByAgeList = homeService.getUserByAgeML(age);
		System.out.println(userLikeByAgeList);
		System.out.println(userLikeByAgeList.size());
		return userLikeByAgeList;
	}
	
	
	// 성별별 선호 영화 가져오기
	@GetMapping("/userLikeByGender/{gender}")
	@ResponseBody
	public ArrayList<MovieInfoVO> userLikeByGender(@PathVariable String gender) {
		ArrayList<MovieInfoVO> userLikeByGenderList = homeService.getUserByGenderML(gender);
		System.out.println(userLikeByGenderList);
		System.out.println(userLikeByGenderList.size());
		return userLikeByGenderList;
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 검색
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(String keyword, Model model) {
		
		ArrayList<MovieInfoVO> result = homeService.searchMovie(keyword);
		// homeService.addSearchHistory(id, keyword);
		
		model.addAttribute("list", result);
		
		
		
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
