package com.class4.movieList.service;

import java.util.ArrayList;

import com.class4.command.ActorVO;
import com.class4.command.DirectorVO;
import com.class4.command.GenreVO;
import com.class4.command.MovieInfoVO;
import com.class4.command.MovieListVO;
import com.class4.command.RegistVO;
import com.class4.command.mapping.MovieActorVO;
import com.class4.command.mapping.MovieDirectorVO;
import com.class4.command.mapping.MovieGenreVO;
import com.class4.movie.util.Criteria;

public interface MovieListService {
	public ArrayList<MovieListVO> cMovieList(Criteria cri);
	public ArrayList<MovieListVO> eMovieList(Criteria cri);
	public int getTotalC();
	public int getTotalE();
	public void update(MovieInfoVO vo);
	public void regist(RegistVO vo);
	public void registP(RegistVO vo);
	
	public ArrayList<String> getGenreList();
	public ArrayList<String> getCodeList();
	public MovieInfoVO getMovieInfo(String cd);
	public ArrayList<String> getActorCodeList();
	public ArrayList<String> getDirectorCodeList();
	public ArrayList<String> getPeopleCodeList();
	public void ActorInsert(ActorVO vo);
	public void DirectorInsert(DirectorVO vo);
	public boolean postUpload(MovieInfoVO vo);

	public void GenreInsert(GenreVO vo);
	   public void registMovieGenre(MovieGenreVO vo);
	   
	   public ArrayList<String> getGenreByMno(String mno);
	   public ArrayList<String> getMnoByAno(String ano);
	   public ArrayList<String> getMnoByDno(String dno);
	   
	   public void registMovieActor(MovieActorVO vo);
	   public void registMovieDirector(MovieDirectorVO vo);
}