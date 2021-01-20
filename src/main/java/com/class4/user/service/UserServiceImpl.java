package com.class4.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class4.command.UserVO;
import com.class4.user.mapper.UserMapper;

@Service("UserService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int JoinReq(UserVO vo) {
		
		return userMapper.JoinReq(vo);
	}

	@Override
	public int idCheck(String userId) {
		
		return userMapper.idCheck(userId);
	}

	@Override
	public UserVO Login(UserVO vo) {
		return userMapper.Login(vo);
	}

}
