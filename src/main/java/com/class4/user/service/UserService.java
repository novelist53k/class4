package com.class4.user.service;

import com.class4.command.UserVO;

public interface UserService {
	
	public int JoinReq(UserVO vo);
	public UserVO Login(UserVO vo);
	public int idCheck(String userId);
}
