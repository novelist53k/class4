package com.class4.movieList.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class4.command.CurrentFilmVO;
import com.class4.movieList.mapper.MovieListMapper;
import com.class4.util.Criteria;

@Service("movieListService")
public class MovieListServiceImpl implements MovieListService{
	@Autowired
	private MovieListMapper movieListMapper;
	
	@Override
	public ArrayList<CurrentFilmVO> movieList(Criteria cri) {
		
		return movieListMapper.movieList(cri);
	}

	@Override
	public int getTotal() {
		
		return movieListMapper.getTotal();
	}
	
}
