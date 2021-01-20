package com.class4.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.class4.command.reviewBoardVO;
import com.class4.common.util.Criteria;
import com.class4.common.util.PageVO;
import com.class4.reviewboard.service.ReviewBoardService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	@Qualifier("reviewBoardService")
	private ReviewBoardService reviewBoardService;
	
	
	@RequestMapping("/reviewList")
	public String reviewList(Model model, Criteria cri) {
		//화면으로 넘어갈 때 글정보를 가지고 갈수 있도록 처리 getList()로 조회한 결과를 리스트화면에 출력.
		//3. 검색과 페이지
		ArrayList<reviewBoardVO> list = reviewBoardService.getList(cri);
		int total = reviewBoardService.getTotal(cri);
		PageVO pageVO = new PageVO(cri, total);
		
		//화면으로 전달
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);

		return "review/reviewList";
	}
	
	
	@RequestMapping("/reviewRegist")
	public String reviewRegist() {
		return "review/reviewRegist";
	}
	
	@RequestMapping("/reviewRegistForm")
	public String reviewRegistForm() {
		return "redirect:/review/reviewList";
	}
	
	
	@RequestMapping("/reviewContent")
	public String reviewContent() {
		return "review/reviewContent";
	}
	
	@RequestMapping("/reviewUpdate")
	public String reviewUpdate() {
		return "review/reviewUpdate";
	}
	
	@RequestMapping("/reviewUpdateForm")
	public String reviewUpdateForm() {
		return "review/reviewContent";
	}
	
	
}
