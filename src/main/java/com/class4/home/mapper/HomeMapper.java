package com.class4.home.mapper;

import java.util.ArrayList;

import com.class4.command.CurrentFilmVO;

public interface HomeMapper {
	
	// 비 로그인
	// 최신작 & 개봉작 8개 가져오기
	public ArrayList<CurrentFilmVO> getRecentlyList();
		
		
		
	// 로그인
	// 유저가 선호하는 장르의 영화 가져오기
	public ArrayList<CurrentFilmVO> getUserLikeGenre();

	// 유저가 선호하는 배우가 출연한 영화 가져오기
	public ArrayList<CurrentFilmVO> getUserLikeActor();

	// 유저가 선호하는 감독으로 영화 가져오기
	public ArrayList<CurrentFilmVO> getUserLikeDirector();	
}
