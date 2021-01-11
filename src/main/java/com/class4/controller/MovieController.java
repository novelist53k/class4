package com.class4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@RequestMapping("/movieList")
	public String movieList() {
		return "movie/movieList";
	}
	
}
