package com.class4.movieList.service;

import java.util.ArrayList;

import com.class4.command.CurrentFilmVO;
import com.class4.movie.util.Criteria;

public interface MovieListService {
	public ArrayList<CurrentFilmVO> cMovieList(Criteria cri);
	public int getTotal();
}
