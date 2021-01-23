package com.class4.movieList.mapper;

import java.util.ArrayList;

import com.class4.command.ActorVO;
import com.class4.command.DirectorVO;
import com.class4.command.MovieInfoVO;

public interface MovieListMapper {
	public ArrayList<MovieInfoVO> cMovieList();
	public ArrayList<MovieInfoVO> eMovieList();
	public int getTotalC();
	public int getTotalE();
	public int update(MovieInfoVO vo);
	
	public ArrayList<String> getCodeList();
	public void testInsert(MovieInfoVO vo);
	public ArrayList<String> getActorCodeList();
	public ArrayList<String> getDirectorCodeList();
	public void testActorInsert(ActorVO vo);
	public void testDirectorInsert(DirectorVO vo);
}