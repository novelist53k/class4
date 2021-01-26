package com.class4.movieList.mapper;

import java.util.ArrayList;

import com.class4.command.ActorVO;
import com.class4.command.DirectorVO;
import com.class4.command.GenreVO;
import com.class4.command.MovieInfoVO;
import com.class4.command.MovieListVO;
import com.class4.movie.util.Criteria;

public interface MovieListMapper {
	public ArrayList<MovieListVO> cMovieList(Criteria cri);
	public ArrayList<MovieListVO> eMovieList(Criteria cri);
	public int getTotalC();
	public int getTotalE();
	public int update(MovieInfoVO vo);
	public ArrayList<String> getGenreList();
	
	public void regist(MovieInfoVO vo);
	public ArrayList<String> getCodeList();
	public MovieInfoVO getMovieInfo(String cd);
	public ArrayList<String> getActorCodeList();
	public ArrayList<String> getDirectorCodeList();
	public ArrayList<String> getPeopleCodeList();
	public void ActorInsert(ActorVO vo);
	public void DirectorInsert(DirectorVO vo);

	public void GenreInsert(GenreVO vo);
}