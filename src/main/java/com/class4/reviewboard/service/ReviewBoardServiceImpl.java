package com.class4.reviewboard.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class4.command.reviewBoardVO;
import com.class4.common.util.Criteria;
import com.class4.reviewboard.mapper.ReviewBoardMapper;

@Service("reviewBoardService") //이 패키지가 읽히는지 확인(컴포넌트스캔)
public class ReviewBoardServiceImpl implements ReviewBoardService{
	
	@Autowired
	private ReviewBoardMapper reviewBoardMapper;
	
	@Override
	public ArrayList<reviewBoardVO> getList(Criteria cri) {
		
		return reviewBoardMapper.getList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return reviewBoardMapper.getTotal(cri);
	}
	
	
}