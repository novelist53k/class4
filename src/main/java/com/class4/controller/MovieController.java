package com.class4.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.class4.command.CurrentFilmVO;
import com.class4.movieList.service.MovieListServiceImpl;
import com.class4.util.Criteria;
import com.class4.util.PageVO;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired
	@Qualifier("movieListService")
	private MovieListServiceImpl movieListSeriveImpl;
	
	//영화리스트
	@RequestMapping("/movieList")
	public String movieList(Model model, Criteria cri) {
		
		ArrayList<CurrentFilmVO> list = movieListSeriveImpl.movieList(cri);
		
		int total = movieListSeriveImpl.getTotal();
		PageVO pageVO = new PageVO(cri,total);
		model.addAttribute("pageVO", pageVO);
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
	
	//현재개봉작, 개봉예정작 입력받아서 리스트 바꿔서 보내주기
	@RequestMapping("/movieRelese")
	public void movieRelease(Criteria cri) {
		
	}
	
	
}
