package com.class4.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.class4.command.MovieInfoVO;
import com.class4.command.ReviewBoardVO;
import com.class4.command.UserVO;
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
      for(ReviewBoardVO vo : list) {
         System.out.println(vo.toString());
      }
      
      int total = reviewBoardService.getTotal(cri);
      PageVO pageVO = new PageVO(cri, total);
      
      //화면으로 전달
      model.addAttribute("list", list);
      model.addAttribute("pageVO", pageVO);
      
      return "review/reviewList";
   }
   
   
   
   @RequestMapping("/reviewRegist")
   public String reviewRegist(@RequestParam("mno") String mno, Model model) {
      MovieInfoVO movieInfo = reviewBoardService.getMovieInfo(mno);
      System.out.println("영화 정보 : " + movieInfo.toString());
      model.addAttribute("movieInfo", movieInfo);
      return "review/reviewRegist";
   }
   
   //글 등록
   @RequestMapping(value="reviewRegistForm", method=RequestMethod.POST)
   public String reviewRegistForm(ReviewBoardVO vo, RedirectAttributes RA) {
      //System.out.println(1);
      reviewBoardService.regist(vo);
      
      RA.addFlashAttribute("msg", "리뷰가 등록 되었습니다.");
   
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
   public String reviewModify(ReviewBoardVO vo, RedirectAttributes RA) {
      System.out.println(vo);
      int result = reviewBoardService.modify(vo);
      System.out.println(result);
      
      if(result == 1) {
         RA.addFlashAttribute("msg", "수정이 완료 되었습니다.");
      }else {
         RA.addFlashAttribute("msg", "재수정 해주세요.");
      }
      
      return "redirect:/review/reviewContent?bno=" + vo.getBno();
   }
   
   @RequestMapping(value = "/delete", method = RequestMethod.GET)
   public String reviewDelete(@RequestParam("bno") int bno, RedirectAttributes RA) {
      int result = reviewBoardService.delete(bno);
      System.out.println(result);
      
      if(result == 1) {
         RA.addFlashAttribute("msg", "해당 리뷰 삭제 완료.");
      }else {
         RA.addFlashAttribute("msg", "삭제 실패.");
      }
      
      return "redirect:reviewList";
   }
   
   
   
}