package com.class4.movieList.mapper;

import java.util.ArrayList;

import com.class4.command.CurrentFilmVO;
import com.class4.movie.util.Criteria;

public interface MovieListMapper {
	public ArrayList<CurrentFilmVO> cMovieList(Criteria cri);
	public int getTotal();

}
