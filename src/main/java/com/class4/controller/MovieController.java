package com.class4.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.class4.command.MovieInfoVO;
import com.class4.command.MovieListVO;
import com.class4.movie.util.Criteria;
import com.class4.movie.util.PageVO;
import com.class4.movieList.service.MovieListServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired
	@Qualifier("movieListService")
	private MovieListServiceImpl movieListServieImpl;
	
	// api를 통하여 영화 목록 가져와서 DB에 저장
		@RequestMapping("/movieRegist")
		public String movieRegist(MovieListVO vo, Model model) {
			
			return "movie/movieCurrent";
		}
		
		
		
		
		
	//현재개봉작 리스트
	@RequestMapping("/movieCurrent")
	public String movieCurrent(Model model, Criteria cri, MovieListVO vo) {
		
		ArrayList<MovieInfoVO> list = movieListServieImpl.cMovieList();
		int total = movieListServieImpl.getTotalC();
		
		PageVO pageVO = new PageVO(cri,total);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);
		
		return "movie/movieCurrent";
		
	}
	
	//개봉예정작 리스트
	@RequestMapping("/movieExpected")
	public String movieExpected(Model model, Criteria cri) {
		String expected = cri.getEMovie();
		// ArrayList<MovieInfoVO> list = movieListServieImpl.eMovieList(cri);
		int total = movieListServieImpl.getTotalE();
		
		PageVO pageVO = new PageVO(cri,total);
		// model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);
		
		return "movie/movieExpected";
	}
	@RequestMapping("/movieContent")
	public String movieContent() {
		return "movie/movieContent";
	}
	
	
	@RequestMapping("/movieUpdate")
	public String movieUpdate() {
		return "movie/movieUpdate";
	}
	
	@RequestMapping(value="shoot",method = RequestMethod.POST )
	public String update(MovieInfoVO vo) {
		int result = movieListServieImpl.update(vo);
		return null;
	}
	
	
}