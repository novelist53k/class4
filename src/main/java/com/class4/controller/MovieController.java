package com.class4.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.class4.command.CurrentFilmVO;
import com.class4.common.util.Criteria;
import com.class4.common.util.PageVO;
import com.class4.movieList.service.MovieListServiceImpl;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired
	@Qualifier("movieListService")
	private MovieListServiceImpl movieListServieImpl;
	
	//�쁽�옱媛쒕큺�옉 由ъ뒪�듃
	@RequestMapping("/movieCurrent")
	public String movieCurrent(Model model, Criteria cri) {
		ArrayList<CurrentFilmVO> list = movieListServieImpl.cMovieList(cri);
		int total = movieListServieImpl.getTotal();
		
		PageVO pageVO = new PageVO(cri,total);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);
		
		return "movie/movieCurrent";
	}
	
	//媛쒕큺�삁�젙�옉 由ъ뒪�듃
	@RequestMapping("/movieExpected")
	public String movieExpected(Model model, Criteria cri) {
		ArrayList<CurrentFilmVO> list = movieListServieImpl.cMovieList(cri);
		int total = movieListServieImpl.getTotal();
		
		PageVO pageVO = new PageVO(cri,total);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);
		
		return "movie/movieExpected";
	}
	@RequestMapping("/movieContent")
	public String movieContent() {
		return "movie/movieContent";
	}
	
	@RequestMapping("/movieRegist")
	public String movieRegist() {
		return "movie/movieRegist";
	}
	
	@RequestMapping("/movieUpdate")
	public String movieUpdate() {
		return "movie/movieUpdate";
	}
	
	
	
}
