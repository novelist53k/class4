package com.class4.user.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class4.command.ActorVO;
import com.class4.command.DirectorVO;
import com.class4.command.GenreVO;
import com.class4.command.ReviewBoardVO;
import com.class4.command.UserVO;
import com.class4.command.mapping.UserActorVO;
import com.class4.command.mapping.UserDirectorVO;
import com.class4.command.mapping.UserGenreVO;
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

	@Override
	public int genreList(UserVO vo) {
		UserGenreVO genreVO = new UserGenreVO();
		genreVO.setUgId(vo.getUserId());
		genreVO.setGenre(vo.getGenre());
		
		
		return userMapper.genreList(genreVO);
		
	}
	

	
	@Override
	public boolean uploadProfile(UserVO userVO) {
		
		return userMapper.uploadProfile(userVO);
	}

	@Override
	
	public void delUser(String userId) {
		
		
		userMapper.delUD(userId);
		userMapper.delUA(userId);
		userMapper.delUG(userId);
		userMapper.delUser(userId);
		
	
	}

	@Override
	public int update(UserVO vo) {
		userMapper.delUD(vo.getUserId());
		userMapper.delUA(vo.getUserId());
		userMapper.delUG(vo.getUserId());

		
		return userMapper.update(vo);
	}

	@Override
	public List<UserActorVO> getActorInfo(String userId) {
		// TODO Auto-generated method stub
		return userMapper.getActorInfo(userId);
	}

	@Override
	public List<UserGenreVO> getGenreInfo(String userId) {
		// TODO Auto-generated method stub
		return userMapper.getGenreInfo(userId);
	}

	@Override
	public List<UserDirectorVO> getDirectorInfo(String userId) {
		// TODO Auto-generated method stub
		return userMapper.getDirectorInfo(userId);
	}

	

	@Override
	public List<ActorVO> actorName(ActorVO actorvo) {
		// TODO Auto-generated method stub
		return userMapper.actorName(actorvo);
	}

	
	@Override
	public List<DirectorVO> directorName(DirectorVO director) {
		// TODO Auto-generated method stub
		return userMapper.directorName(director);
	}

	
	@Override
	public List<ReviewBoardVO> getReview(String user) {
		// TODO Auto-generated method stub
		return userMapper.getReview(user);
	}

	@Override
	public int actorList(UserVO vo, String aco ,String actorName) {
		UserActorVO avo = new UserActorVO();
		avo.setUaId(vo.getUserId());
		avo.setAno(aco);
		avo.setUaAge(vo.getUserAge());
		avo.setUaGender(vo.getUserGender());
		avo.setActorName(actorName);
		
		
		
		return userMapper.actorList(avo);
	}
	@Override
	public int directorList(UserVO vo, String dco, String directorName) {
		UserDirectorVO dvo = new UserDirectorVO();
		dvo.setUdAge(vo.getUserAge());
		dvo.setUdGender(vo.getUserGender());
		dvo.setUdId(vo.getUserId());
		dvo.setDno(dco);
		dvo.setDirectorName(directorName);
		return userMapper.directorList(dvo);
	}

	@Override
	public UserVO mypage(UserVO vo) {
		// TODO Auto-generated method stub
		return userMapper.mypage(vo);
	}

	@Override
	public List<String> getGenreList() {
		System.out.println("2번");
		// TODO Auto-generated method stub
		return userMapper.getGenreList();
	}

	

	

	

	

	

	
	
	
	

	

	

}
