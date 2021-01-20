package com.class4.home.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class4.command.CurrentFilmVO;
import com.class4.home.mapper.HomeMapper;

@Service("HomeService")
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	private HomeMapper mapper;

	// 비 로그인
	// 최신작 & 개봉작 18개 가져오기
	@Override
	public ArrayList<CurrentFilmVO> getRecentlyList() {
		return mapper.getRecentlyList();
	}

	
	
	// 로그인
	// 유저가 선호하는 장르의 영화 가져오기
	@Override
	public ArrayList<CurrentFilmVO> getUserLikeGenre() {
		// TODO Auto-generated method stub
		return null;
	}

	// 유저가 선호하는 배우가 출연한 영화 가져오기
	@Override
	public ArrayList<CurrentFilmVO> getUserLikeActor() {
		// TODO Auto-generated method stub
		return null;
	}

	// 유저가 선호하는 감독으로 영화 가져오기
	@Override
	public ArrayList<CurrentFilmVO> getUserLikeDirector() {
		// TODO Auto-generated method stub
		return null;
	}
	

	
	
	
	
	
	
	
}
