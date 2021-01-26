package com.class4.reviewboard.mapper;

import java.util.ArrayList;

import com.class4.command.ReviewBoardVO;
import com.class4.common.util.Criteria;

public interface ReviewBoardMapper {
	
	public ArrayList<ReviewBoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public ReviewBoardVO getContent(int bno);
	public int modify(ReviewBoardVO vo);

}