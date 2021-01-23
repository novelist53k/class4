package com.class4.movieList.service;

import java.util.ArrayList;

import com.class4.command.ActorVO;
import com.class4.command.DirectorVO;
import com.class4.command.MovieInfoVO;

public interface MovieListService {
	public ArrayList<MovieInfoVO> cMovieList();
	public ArrayList<MovieInfoVO> eMovieList();
	public int getTotalC();
	public int getTotalE();
	public int update(MovieInfoVO vo);
	
	public ArrayList<String> getCodeList();
	public void testInsert(MovieInfoVO vo);
	public ArrayList<String> getPeopleCodeList();
	public void testActorInsert(ActorVO actorVO);
	public void testDirectorInsert(DirectorVO directorVO);
}