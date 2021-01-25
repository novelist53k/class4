package com.class4.home.mapper;

import java.util.ArrayList;

import com.class4.command.MovieInfoVO;

public interface HomeMapper {
	
	// 비 로그인
	// 최신작 18개 가져오기
	public ArrayList<MovieInfoVO> getRecentlyList(int movieMaxCnt);
	
	// 개봉예정작 18개 가져오기
	public ArrayList<MovieInfoVO> getCommingSoonList(int movieMaxCnt);
	
	// 영화 코드로 영화 가져오기
	public MovieInfoVO getMovie(String movieCd);
		
		
	// 로그인
	// 유저가 선호하는 배우의 코드 가져오기
	public ArrayList<String> getActorCodeList(String id);
	
	// 유저가 선호하는 배우 코드로 영화 코드 가져오가
	public ArrayList<String> getCodeListByActor(String ano);

	// 유저가 선호하는 감독의 영화 코드 가져오기
	public ArrayList<String> getDirectorCodeList(String id);
	
	// 유저가 선호하는 감독 코드로 영화 코드 가져오기
	public ArrayList<String> getCodeListByDirector(String dno);
	
	// 유저가 선호하는 장르 가져오기
	public ArrayList<String> getGenreCodeList(String id);
	
	// 유저가 선호하는 장르로 영화 코드 가져오기
	public ArrayList<String> getCodeListByGenre(String genre);
	
	
	// 검색
	public ArrayList<MovieInfoVO> searchMovie(String keyword);
	
	// 사용자 검색기록 가져오기
	public ArrayList<String> getSearchHistory(String id);
	
	// 사용자 검색횟수 가져오기
	public int getSearchCnt(String id);
	
	// 사용자 검색기록을 앞에서부터 새로운 걸로 교체
	public void replaceSearchHistory(String id, String keyword, int searchCnt);
	
	// 사용자 검색기록 추가
	public void addSearchHistory(String id, String keyword);
}
