package com.class4.reviewboard.service;

import java.util.ArrayList;

import com.class4.command.ReplyVO;
import com.class4.command.reviewBoardVO;
import com.class4.common.util.Criteria;


public interface ReviewBoardService {
	
	//추상메서드 //페이징조회
	public ArrayList<reviewBoardVO> getList(Criteria cri);
	public ArrayList<ReplyVO> replyList(Criteria cri);
	public int getTotal(Criteria cri);
	public reviewBoardVO getContent(int bno);
	
}
