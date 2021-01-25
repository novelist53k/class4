  
package com.class4.movieList.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class4.command.ActorVO;
import com.class4.command.DirectorVO;
import com.class4.command.MovieInfoVO;
import com.class4.command.MovieListVO;
import com.class4.movie.util.Criteria;
import com.class4.movieList.mapper.MovieListMapper;

@Service("movieListService")
public class MovieListServiceImpl implements MovieListService{
	@Autowired
	private MovieListMapper movieListMapper;
	
	//영화등록메서드
	@Override
	public void regist(MovieInfoVO vo) {
		
		 movieListMapper.regist(vo);
	}
	
	
	
	@Override
	public ArrayList<MovieListVO> cMovieList(Criteria cri) {
		
		return movieListMapper.cMovieList(cri);
	}
	@Override
	public ArrayList<MovieListVO> eMovieList(Criteria cri) {
		
		return movieListMapper.eMovieList(cri);
	}
	
	
	@Override
	public int getTotalC() {
		return movieListMapper.getTotalC();
	}
	@Override
	public int getTotalE() {
		return movieListMapper.getTotalE();
	}
	@Override
	public int update(MovieInfoVO vo) {
		return movieListMapper.update(vo);
	}
	@Override
	public ArrayList<String> getCodeList() {
		return movieListMapper.getCodeList();
	}



	@Override
	public MovieInfoVO getMovieInfo(String cd) {
		
		return movieListMapper.getMovieInfo(cd);
	}
	
//	@Override
//	public ArrayList<String> getPeopleCodeList() {
//		ArrayList<String> actorCodeList = movieListMapper.getActorCodeList();
//		ArrayList<String> directorCodeList = movieListMapper.getDirectorCodeList();
//		ArrayList<String> peopleCodeList = new ArrayList<String>();
//		
//		for(int i = 0; i < actorCodeList.size(); ++i) {
//			peopleCodeList.add(actorCodeList.get(i));
//		}
//		for(int i = 0; i < directorCodeList.size(); ++i) {
//			peopleCodeList.add(directorCodeList.get(i));
//		}
//		
//		
//		return peopleCodeList;
//	}
//	@Override
//	public void testActorInsert(ActorVO actorVO) {
//		movieListMapper.testActorInsert(actorVO);
//		System.out.println("배우1");
//		
//	}
//	@Override
//	public void testDirectorInsert(DirectorVO directorVO) {
//		System.out.println("감독1");
//		movieListMapper.testDirectorInsert(directorVO);
//	}
//
//
//
//	@Override
//	public ArrayList<String> getActorCodeList() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//
//
//	@Override
//	public ArrayList<String> getDirectorCodeList() {
//		// TODO Auto-generated method stub
//		return null;
//	}


}