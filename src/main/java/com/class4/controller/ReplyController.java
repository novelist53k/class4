package com.class4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.class4.command.ReplyVO;
import com.class4.reply.service.ReplyService;

@RestController //@ResposeBody 자동 생략
@RequestMapping("/reply")
public class ReplyController {	
	
	@Autowired
	@Qualifier("replyService")
	private ReplyService replyService;
	
	//등록
	@PostMapping(value = "/replyRegist")
	public int replyRegist(@RequestBody ReplyVO rvo) {
		
		System.out.println(rvo.toString());
		
		int result = replyService.replyRegist(rvo);
		return result;
	}
	
	
}
