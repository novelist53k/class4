package com.class4.controller;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String home(Model model, HttpSession session) {
		UserVO vo = (UserVO)session.getAttribute("login");

		// 최신작, 개봉예정작을 model 객체로 attribute
		HashMap<String, ArrayList<MovieInfoVO>> mainMovieList = homeService.getMainMovieList();
		model.addAttribute("mainRecentlyList", mainMovieList.get("recent"));
		model.addAttribute("mainCommingSoonList", mainMovieList.get("commingSoon"));
		
		// 로그인 시 선호 배우, 감독, 장르에 관해 등록했는지 확인해서 돌려준다
		int wTRActor = 0;
		int wTRDirector = 0;
		int wTRGenre = 0;
		
		// 로그인시 선호 목록에 배우나 감독, 장르가 등록되었는지 확인하여 등록되었으면 0이 아닌 수를 반환
		if(vo != null) {
			wTRActor = homeService.getWhetherToRegistActor(vo.getUserId());
			wTRDirector = homeService.getWhetherToRegistDirector(vo.getUserId());
			wTRGenre = homeService.getWhetherToRegistGenre(vo.getUserId());
			
			// 사용자 성별에 따른 추천
			ArrayList<MovieInfoVO> userLikeByGenderList = homeService.getUserByGenderML(vo.getUserGender());
			model.addAttribute("listByGender", userLikeByGenderList);
			
			// 사용자 나이에 따른 추천
			

			ArrayList<MovieInfoVO> userLikeByAgeList = homeService.getUserByAgeML(20);
			model.addAttribute("listByAge", userLikeByAgeList);
		}
		System.out.println(wTRActor);
		
		// 선호 배우가 존재시 이를 화면에 전달
		if(wTRActor != 0) {
			ArrayList<MovieInfoVO> userLikeActorList = homeService.getUserActorML(vo.getUserId());
			model.addAttribute("userLikeActorList", userLikeActorList);
		}
		// 선호 감독이 존재시 이를 화면에 전달
		if(wTRDirector != 0) {
			ArrayList<MovieInfoVO> userLikeDirectorList = homeService.getUserDirectorML(vo.getUserId());
			model.addAttribute("userLikeDirectorList", userLikeDirectorList);
		}
		// 선호 장르가 존재시 이를 화면에 전달
		if(wTRGenre != 0) {
			ArrayList<MovieInfoVO> userLikeGenreList = homeService.getUserGenreML(vo.getUserId());
			model.addAttribute("userLikeGenreList", userLikeGenreList);
		}
		
		
		
	
		model.addAttribute("wTRActor", wTRActor);
		model.addAttribute("wTRDirector", wTRDirector);
		model.addAttribute("wTRGenre", wTRGenre);
		
		return "main";
	}
	
	
	// 유저가 선호하는 배우의 출연작 가져오기
	@GetMapping("/userLikeActor")
	@ResponseBody
	public ArrayList<MovieInfoVO> userLikeActor(HttpSession session) {
		UserVO vo = (UserVO)session.getAttribute("login");

		if(vo == null) {
			return new ArrayList<MovieInfoVO>();
		}

		ArrayList<MovieInfoVO> userLikeActorList = homeService.getUserActorML(vo.getUserId());
		
		return userLikeActorList;
	}
	
	// 유저가 선호하는 감독의 영화 가져오기
	@GetMapping("/userLikeDirector")
	@ResponseBody
	public ArrayList<MovieInfoVO> userLikeDirector(HttpSession session) {
		UserVO vo = (UserVO)session.getAttribute("login");

		if(vo == null) {
			return new ArrayList<MovieInfoVO>();
		}
		
		ArrayList<MovieInfoVO> userLikeDirectorList = homeService.getUserDirectorML(vo.getUserId());
		System.out.println(userLikeDirectorList);
		System.out.println(userLikeDirectorList.size());
		return userLikeDirectorList;
	}
	
	// 유저가 선호하는 감독의 영화 가져오기
	@GetMapping("/userLikeGenre")
	@ResponseBody
	public ArrayList<MovieInfoVO> userLikeGenre(HttpSession session) {
		UserVO vo = (UserVO)session.getAttribute("login");

		if(vo == null) {
			return new ArrayList<MovieInfoVO>();
		}
		
		ArrayList<MovieInfoVO> userLikeGenreList = homeService.getUserGenreML(vo.getUserId());
		System.out.println(userLikeGenreList);
		System.out.println(userLikeGenreList.size());
		return userLikeGenreList;
	}
	
	// 나이별 선호 영화 가져오기
	@GetMapping("/userLikeByAge/{age}")
	@ResponseBody
	public ArrayList<MovieInfoVO> userLikeByAge(@PathVariable String age) {
		ArrayList<MovieInfoVO> userLikeByAgeList = homeService.getUserByAgeML(Integer.parseInt(age));
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
	public String search(String keyword, Model model, HttpSession session) {
		UserVO vo = (UserVO)session.getAttribute("login");
		System.out.println(vo);
		if(vo != null) {
			System.out.println(vo.getUserId());
			homeService.addSearchHistory(vo.getUserId(), keyword);
		}
		System.out.println(1);
		
		ArrayList<MovieInfoVO> result = homeService.searchMovie(keyword);
		
		model.addAttribute("list", result);
		
		
		
		return "movieSearch";
	}
	
	// 이런 영화는 어떠세요 버튼 누를 시 작동
	// 검색 기록에서 많이 사용된 단어로 영화 검색
	@RequestMapping(value = "/searchHistory", method = RequestMethod.GET)
	public String searchHistory(HttpSession session) {
		UserVO vo = (UserVO)session.getAttribute("login");
		
		if(vo == null) {
			return "";
		}
		
		
		// 검색기록 쿠키에 따른 텍스트마이닝
		String searchHistory = homeService.getSearchKeyword(vo.getUserId());

		
		return "search?=" + searchHistory;
	}
	
	
	public String test() {
		homeService.test();
		
		
		return "";
	}
	
	
	
	
	
	
	
	
	
}
