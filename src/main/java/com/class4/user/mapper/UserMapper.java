package com.class4.user.mapper;



import java.util.List;
import java.util.Map;


import com.class4.command.user.UserVO;


public interface UserMapper {
	public int JoinReq(UserVO vo);
	public UserVO Login(UserVO vo);
	public int idCheck(String userId);
	public int genreList(UserVO vo);
	public int actorList(UserVO vo);
	public int directorList(UserVO vo);
	public boolean uploadProfile(UserVO userVO);
	public void delUser(String userId);
	public int checkPw(String vo, UserVO checkPw);
	public void delUD(String userId);
	public void delUA(String userId);
	public void delUG(String userId);
	public int update(UserVO vo);
	public UserVO getActorInfo(String userId);
	public UserVO getGenreInfo(String userId);
	public UserVO getDirectorInfo(String userId);
	
	
}