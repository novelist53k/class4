package com.class4.home.service;

import java.util.ArrayList;

import com.class4.command.MovieInfoVO;

public interface HomeService {
	
	// 비 로그인
	// 최신작 & 개봉작 8개 가져오기
	public ArrayList<MovieInfoVO> getRecentlyList();
	
	
	
	// 로그인
	// 유저가 선호하는 장르의 영화 가져오기
	public ArrayList<MovieInfoVO> getUserLikeGenre();
	
	// 유저가 선호하는 배우가 출연한 영화 가져오기
	public ArrayList<MovieInfoVO> getUserLikeActor();
	
	// 유저가 선호하는 감독으로 영화 가져오기
	public ArrayList<MovieInfoVO> getUserLikeDirector();
	
	
}
