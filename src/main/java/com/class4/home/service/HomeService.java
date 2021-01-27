package com.class4.home.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.class4.command.MovieInfoVO;

public interface HomeService {
	
	// 비 로그인
	// 최신작 & 개봉작 8개 가져오기
	public HashMap<String, ArrayList<MovieInfoVO>> getMainMovieList();
	
	
	
	// 로그인
	
	// 선호하는 배우 등록 여부
	public int getWhetherToRegistActor(String id);
	
	// 선호하는 감독 등록 여부
	public int getWhetherToRegistDirector(String id);
	
	// 선호하는 장르 등록 여부
	public int getWhetherToRegistGenre(String id);
	
	// 유저가 선호하는 배우의 출연작 가져오기
	public ArrayList<MovieInfoVO> getUserActorML(String id);
	
	// 유저가 선호하는 감독의 영화 가져오기
	public ArrayList<MovieInfoVO> getUserDirectorML(String id);
	
	// 유저가 선호하는 장르의 영화 가져오기
	public ArrayList<MovieInfoVO> getUserGenreML(String id);
	
	// 나이별 선호 영화 가져오기
	public ArrayList<MovieInfoVO> getUserByAgeML(int age);
	
	// 성별별 선호 영화 가져오기
	public ArrayList<MovieInfoVO> getUserByGenderML(String gender);
	
	
	
	
	// 검색 기록으로 영화 가져오기
	public ArrayList<MovieInfoVO> getSearchHistoryMovieList(String id);
	
	
	// 검색
	public ArrayList<MovieInfoVO> searchMovie(String keyword);
	
	// 검색 기록 추가
	public void addSearchHistory(String id, String keyword);
}
