package com.class4.reviewboard.service;

import java.util.ArrayList;

import com.class4.command.ReplyVO;
import com.class4.command.ReviewBoardVO;
import com.class4.common.util.Criteria;


public interface ReviewBoardService {
	
	//추상메서드 //페이징조회
	public ArrayList<ReviewBoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public ReviewBoardVO getContent(int bno);
	public int modify(ReviewBoardVO vo);
	
}
