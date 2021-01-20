package com.class4.reviewboard.mapper;

import java.util.ArrayList;

import com.class4.command.reviewBoardVO;
import com.class4.common.util.Criteria;

public interface ReviewBoardMapper {
	
	public ArrayList<reviewBoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public reviewBoardVO getContent(int bno);
}