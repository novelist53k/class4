package com.class4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/theater")
public class TheaterController {
	
	@RequestMapping("/theater")
	public String theater() {
		return "theater/theater";
	}
	
}
