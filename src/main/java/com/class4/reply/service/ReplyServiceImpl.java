package com.class4.reply.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class4.command.ReplyVO;
import com.class4.reply.mapper.ReplyMapper;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	
	private ReplyMapper replyMapper;
	
	@Override
	public int replyRegist(ReplyVO rvo) {
		
		return replyMapper.replyRegist(rvo);
	}

}
