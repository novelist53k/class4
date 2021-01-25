package com.class4.movieList.service;

import java.util.ArrayList;

import com.class4.command.ActorVO;
import com.class4.command.DirectorVO;
import com.class4.command.MovieInfoVO;
import com.class4.command.MovieListVO;
import com.class4.movie.util.Criteria;

public interface MovieListService {
	public ArrayList<MovieListVO> cMovieList(Criteria cri);
	public ArrayList<MovieListVO> eMovieList(Criteria cri);
	public int getTotalC();
	public int getTotalE();
	public int update(MovieInfoVO vo);
	
	public void regist(MovieInfoVO vo);
	public ArrayList<String> getCodeList();
	public MovieInfoVO getMovieInfo(String cd);
//	public ArrayList<String> getActorCodeList();
//	public ArrayList<String> getDirectorCodeList();
//	public void testActorInsert(ActorVO vo);
//	public void testDirectorInsert(DirectorVO vo);
}