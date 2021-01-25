package com.class4.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.class4.command.ReplyVO;
import com.class4.command.ReviewBoardVO;
import com.class4.common.util.Criteria;
import com.class4.common.util.PageVO;
import com.class4.reviewboard.service.ReviewBoardService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	@Qualifier("reviewBoardService")
	private ReviewBoardService reviewBoardService;
	
	//검색, 페이지
	@RequestMapping("/reviewList")
	public String reviewList(Model model, Criteria cri) {
		//화면으로 넘어갈 때 글정보를 가지고 갈수 있도록 처리 getList()로 조회한 결과를 리스트화면에 출력.
		//3. 검색과 페이지
		ArrayList<ReviewBoardVO> list = reviewBoardService.getList(cri);
		
		int total = reviewBoardService.getTotal(cri);
		PageVO pageVO = new PageVO(cri, total);
		System.out.println(pageVO.toString());
		System.out.println(cri.toString());
		
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
	
	//상세화면
	@RequestMapping(value= {"/reviewContent","/reviewUpdate"}, method = RequestMethod.GET)
	public void reviewContent(@RequestParam("bno") int bno, Model model) {
		
		//화면으로 넘어갈때 bno기반의 데이터를 가지고 상세화면으로 가도록 getContent()로 처리
		ReviewBoardVO vo = reviewBoardService.getContent(bno);
		model.addAttribute("vo", vo); //bno게시글에 대한 정보
		
		/*
		replylist는 bno를 매개변수로 where 절에서 해당 bno에 대한 list를 반환받는 형식입니다.
		/reviewList에 매핑되게 잡아놓으면 같은 주소로 매핑 두 개 되서 오류나서 옮겼습니다
		여기에서 처리하시면 됩니다.
		
		ArrayList<ReplyVO> listR = reviewBoardService.replyList(cri);	
		//화면으로 전달
		model.addAttribute("list", listR);
		*/
		
	}
	
	@RequestMapping(value = "/reviewModify", method = RequestMethod.POST)
	public String reviewUpdate(ReviewBoardVO vo, RedirectAttributes RA) {
		
		int result = reviewBoardService.reviewModify(vo);
		
		if(result == 1) {
			RA.addFlashAttribute("msg", "수정이 완료 되었습니다.");
		}else {
			RA.addFlashAttribute("msg", "재수정 해주세요.");
		}
		
		return "redirect:reviewList";
	}
	
	
	
	
}
