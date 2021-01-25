package com.class4.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import com.class4.command.user.UserVO;


public interface UserService {
	
	public int JoinReq(UserVO vo);
	
	public UserVO Login(UserVO vo);
	public int idCheck(String userId);

	public int genreList(UserVO vo);

	public int actorList(UserVO vo);

	public int directorList(UserVO vo);

	public boolean uploadProfile(UserVO userVO);

	public void delUser(String userId);

	public int update(UserVO vo);

	public UserVO getActorInfo(String userId);

	public UserVO getGenreInfo(String userId);

	public UserVO getDirectorInfo(String userId);

	
	


	
}
