package com.class4.movieList.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class4.command.CurrentFilmVO;
import com.class4.movie.util.Criteria;
import com.class4.movieList.mapper.MovieListMapper;

@Service("movieListService")
public class MovieListServiceImpl implements MovieListService{
	@Autowired
	private MovieListMapper movieListMapper;
	
	@Override
	public ArrayList<CurrentFilmVO> cMovieList(Criteria cri) {
		
		return movieListMapper.cMovieList(cri);
	}
	
	
	@Override
	public int getTotal() {
		return movieListMapper.getTotal();
	}


	
}
