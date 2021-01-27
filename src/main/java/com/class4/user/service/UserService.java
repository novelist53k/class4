package com.class4.user.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.class4.command.ActorVO;
import com.class4.command.DirectorVO;
import com.class4.command.GenreVO;
import com.class4.command.ReviewBoardVO;
import com.class4.command.UserVO;
import com.class4.command.mapping.UserActorVO;
import com.class4.command.mapping.UserDirectorVO;
import com.class4.command.mapping.UserGenreVO;


public interface UserService {
	
	public int JoinReq(UserVO vo);
	
	public UserVO Login(UserVO vo);
	public int idCheck(String userId);

	public int genreList(UserVO vo);
	public List<String> getGenreList();
	public int actorList(UserVO vo,String aco,String actorName);
	public int directorList(UserVO vo, String dco, String directorName);

	public UserVO mypage(UserVO vo);

	public boolean uploadProfile(UserVO userVO);

	public void delUser(String userId);

	public int update(UserVO vo);

	public List<UserActorVO> getActorInfo(String userId);

	public List<UserGenreVO> getGenreInfo(String userId);

	public List<UserDirectorVO> getDirectorInfo(String userId);

	
	
	public List<ActorVO> actorName(ActorVO actorvo);
	public List<DirectorVO> directorName(DirectorVO director);


	public List<ReviewBoardVO> getReview(String user);



	

	
	


	
}
