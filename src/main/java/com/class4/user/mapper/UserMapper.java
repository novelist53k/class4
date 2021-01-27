package com.class4.user.mapper;



import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.class4.command.ActorVO;
import com.class4.command.DirectorVO;
import com.class4.command.GenreVO;
import com.class4.command.ReviewBoardVO;
import com.class4.command.UserVO;
import com.class4.command.mapping.UserActorVO;
import com.class4.command.mapping.UserDirectorVO;
import com.class4.command.mapping.UserGenreVO;


public interface UserMapper {
	public int JoinReq(UserVO vo);
	public UserVO Login(UserVO vo);
	public int idCheck(String userId);
	public int genreList(UserGenreVO vo);
	public int actorList(UserActorVO avo);
	public int directorList(UserDirectorVO dvo);
	public boolean uploadProfile(UserVO userVO);
	public void delUser(String userId);
	public int checkPw(String vo, UserVO checkPw);
	
	public void delUD(String userId);
	public void delUA(String userId);
	public void delUG(String userId);
	public int update(UserVO vo);
	
	public UserVO mypage(UserVO vo);
	public List<UserActorVO> getActorInfo(String userId);
	public List<UserDirectorVO> getDirectorInfo(String userId);
	public List<UserGenreVO> getGenreInfo(String userId);
	public ArrayList<String> listAll2(String result);
	public List<String> getGenreList();
	public List<ActorVO> actorName(ActorVO actorvo);
	public List<DirectorVO> directorName(DirectorVO director);	
	public List<ReviewBoardVO> getReview(String user);
	
	
}