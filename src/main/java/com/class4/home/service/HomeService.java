package com.class4.home.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.class4.command.MovieInfoVO;

public interface HomeService {
	
	// 비 로그인
	// 최신작 & 개봉작 8개 가져오기
	public HashMap<String, ArrayList<MovieInfoVO>> getMainMovieList();
	
	
	
	// 로그인
	// 유저가 선호하는 장르, 배우, 감독의 영화 가져오기
	public HashMap<String, ArrayList<MovieInfoVO>> getUserLikeList(String id);
	
	
	// 검색 기록으로 영화 가져오기
	public ArrayList<MovieInfoVO> getSearchHistoryMovieList(String id);
	
	
	// 검색
	public ArrayList<MovieInfoVO> searchMovie(String keyword);
	
	// 검색 기록 추가
	public void addSearchHistory(String id, String keyword);
}
