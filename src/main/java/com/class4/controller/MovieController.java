package com.class4.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.class4.command.CurrentFilmVO;
import com.class4.movieList.service.MovieListServiceImpl;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired
	@Qualifier("movieListService")
	private MovieListServiceImpl movieListSeriveImpl;
	
	//영화리스트
	@RequestMapping("/movieList")
	public String movieList(Model model) {
		ArrayList<CurrentFilmVO> list = movieListSeriveImpl.movieList();
		model.addAttribute("list", list);
		return "movie/movieList";
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
