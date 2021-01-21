package com.class4.user.mapper;

import com.class4.command.UserVO;
import com.class4.command.UserlistVO;

public interface UserMapper {
	public int JoinReq(UserVO vo);
	public UserVO Login(UserVO vo);
	public int idCheck(String userId);
	public int genreList(UserVO vo);
	public int actorList(UserVO vo);
	public int directorList(UserVO vo);
	public boolean uploadProfile(UserVO userVO);
	
}
