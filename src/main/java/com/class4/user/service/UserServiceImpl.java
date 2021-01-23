package com.class4.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class4.command.user.GenreListVO;
import com.class4.command.user.UserVO;
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
		return userMapper.genreList(vo);
		
	}
	@Override
	public int actorList(UserVO vo) {
		return userMapper.actorList(vo);
		
	}

	@Override
	public int directorList(UserVO vo) {
		
		return userMapper.directorList(vo);
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
		userMapper.update(vo);
		return 0;
	}

	@Override
	public UserVO getActorInfo(String userId) {
		// TODO Auto-generated method stub
		return userMapper.getActorInfo(userId);
	}

	@Override
	public UserVO getGenreInfo(String userId) {
		// TODO Auto-generated method stub
		return userMapper.getGenreInfo(userId);
	}

	@Override
	public UserVO getDirectorInfo(String userId) {
		// TODO Auto-generated method stub
		return userMapper.getDirectorInfo(userId);
	}

	@Override
	public List<Map<Integer, String>> genrelist() {
		
		return userMapper.genrelist();
	}

	

	

	
	
	
	

	

	

}
