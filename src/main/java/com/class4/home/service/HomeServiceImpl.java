package com.class4.home.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Random;

import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.class4.command.MovieInfoVO;
import com.class4.home.mapper.HomeMapper;



@Service("HomeService")
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	private HomeMapper mapper;
	
	// 메인 슬라이드 하나 당 최대 영화 개수
	private int movieMaxCnt = 18;

	// 비 로그인
	// 최신작 & 개봉작 18개 가져오기
	@Override
	public HashMap<String, ArrayList<MovieInfoVO>> getMainMovieList() {
		HashMap<String, ArrayList<MovieInfoVO>> mainMovieList = new HashMap<String, ArrayList<MovieInfoVO>>();
		// 최신영화
		mainMovieList.put("recent", mapper.getRecentlyList(movieMaxCnt));
		// 개봉예정작
		mainMovieList.put("commingSoon", mapper.getCommingSoonList(movieMaxCnt));
		
		return mainMovieList;
	}

	
	
	// 로그인
	// 유저가 선호하는 장르의 영화 가져오기
	@Override
	public HashMap<String, ArrayList<MovieInfoVO>> getUserLikeList(String id) {
		HashMap<String, ArrayList<MovieInfoVO>> userLikeList = new HashMap<String, ArrayList<MovieInfoVO>>();
		Random ran = new Random();
		
		// 테스트용 임시 변수
		id = "qwer";
		
		// 유저가 선호하는 배우, 감독, 장르별 영화들을 담을 변수
		ArrayList<MovieInfoVO> userLikeActorList = new ArrayList<MovieInfoVO>();
		ArrayList<MovieInfoVO> userLikeDirectorList = new ArrayList<MovieInfoVO>();
		ArrayList<MovieInfoVO> userLikeGenreList = new ArrayList<MovieInfoVO>();
		
		
		
		
		
		// 유저가 선호하는 배우가 출연한 영화의 코드 가져오기
		ArrayList<String> actorCodeList = mapper.getActorCodeList(id);
		
		ArrayList<String> codeListByActor = new ArrayList<String>();
		
		for(String a : actorCodeList) {
			codeListByActor.addAll(mapper.getCodeListByActor(a));
		}
		// 중복 제거
		HashSet<String> codeSetByActor = new HashSet<String>(codeListByActor);
		codeListByActor = new ArrayList<String>(codeListByActor);
		
		
		
		int[] randomIdx = new int[movieMaxCnt];
		
		// 선호하는 배우가 출연한 영화코드 개수가 movieMaxCnt 초과시 가져온 영화코드 중 movieMaxCnt개 만큼 랜덤 처리
		if(codeListByActor.size() > movieMaxCnt) {
			for(int i = 0; i < movieMaxCnt; ++i) {
				randomIdx[i] = ran.nextInt(codeListByActor.size());
				for(int j = 0; j < i; ++j) {
					if(randomIdx[i] == randomIdx[j]) {	// 중복방지
						--i;
						break;
					}
				}
			}
			
			for(int i = 0; i < randomIdx.length; ++i) {
				mapper.getMovie(codeListByActor.get(i));
			}
		}
		else {
			// 배우가 출연한 영화 코드로 영화 목록 가져오기
			for(String s : codeListByActor) {
				mapper.getMovie(s);
			}		
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		return userLikeList;
	}

	
	// 영화 검색
	@Override
	public ArrayList<MovieInfoVO> searchMovie(String keyword) {	
		return mapper.searchMovie(keyword);
	}
	
	
	// 사용자 검색기록 추가
	@Override
	public void addSearchHistory(String id, String keyword) {
		
		int searchMaxCnt = 5;	// 사용자당 검색기록 최대 저장 수
		int searchCnt = mapper.getSearchCnt(id);	// 사용자당 검색 기록 숫자
		// 사용자 검색 횟수가 cnt 초과시 앞에서 부터 새로운 검색어로 수정, 이하면 검색어 추가
		if(searchCnt > searchMaxCnt) {
			mapper.replaceSearchHistory(id, keyword, searchCnt % searchMaxCnt);
		}
		else {
			mapper.addSearchHistory(id, keyword);
		}

	}
	
	
	// 사용자 검색기록을 분석하여 많이 사용된 단어로 영화 가져오기
	@Override
	public ArrayList<MovieInfoVO> getSearchHistoryMovieList(String id) {
		
		/*
		rstudio에 필요한 패키지 다 설치했는지 확인하세요
		서버 돌리기 전에 rstudio 먼저 키시고 아래 코드 돌려주세요
		
		library(Rserve)
		Rserve(FALSE, port = 6311, args = '--RS-encoding utf8 --no-save --slave --encoding utf8 --internet2')
		Rserve(args = "--RS- encoding utf8")

		*/
		ArrayList<MovieInfoVO> searchHistoryMovieList = new ArrayList<MovieInfoVO>();
		
		RConnection rconn = null;
		
		try {
			// rstudio와 연결
			rconn = new RConnection("127.0.0.1", 6311);
			
			// 사용자 검색 기록 가져오기
			id = "1";	// 테스트용
			ArrayList<String> searchHistoryList = mapper.getSearchHistory(id);
			
			// 테스트용 변수 설정
			searchHistoryList = new ArrayList<String>();
			searchHistoryList.add("팅커벨 죽이기");
			searchHistoryList.add("리라장 사건");
			for(int i = 0; i < 5; ++i) {
				searchHistoryList.add("안녕 인생이란");
			}
			
			for(int i = 0; i < 4; ++i) {
				searchHistoryList.add("된장 같은 인생이란");
			}
			for(int i = 0; i < 3; ++i) {
				searchHistoryList.add("팅커벨 같은 인생");
			}
			// 테스트용 변수 설정 끝
			
			
			String r = "c(";	// 검색어를 벡터형으로 rstudio에 전달하기 위한 변수
			for(int i = 0; i < searchHistoryList.size(); ++i) {
				// 마지막 변수에는 ,를 추가하지 않기 위해 별도 처리
				if(i == searchHistoryList.size() - 1) {
					r += ("'" + searchHistoryList.get(i) + "'");
				}
				else {
					r += ("'" + searchHistoryList.get(i) + "',");					
				}
			}
			r += ")";
			
			rconn.eval("library(KoNLP)");
			rconn.eval("library(stringr)");
			rconn.eval("library(dplyr)");
			rconn.eval("useNIADic()");
			
			rconn.eval("keyword <- " + r);
			rconn.eval("keyword <- str_replace_all(keyword, '\\\\W', ' ')");
			rconn.eval("keyword_list <- extractNoun(keyword)");
			rconn.eval("keyword_vec <- unlist(keyword_list)");
			rconn.eval("keyword <- as.data.frame(keyword_vec, stringsAsFactors = F)");
			rconn.eval("keyword <- rename(keyword, word = keyword_vec)");
			
			rconn.eval("keyword <- keyword %>%" + 
					"  filter(nchar(word) >= 2) %>%" + 
					"  group_by(word) %>%" + 
					"  summarise(feq = n()) %>%" + 
					"  arrange(desc(feq))").asList();
			rconn.eval("keyword <- as.data.frame(keyword)");
			
			RList rList = rconn.eval("keyword").asList();
			String[] word = rList.at("word").asStrings();
			int[] feq = rList.at("feq").asIntegers();
			System.out.println(Arrays.toString(word));	// 많이 사용된 단어 순서대로 출력
			
			Random ran = new Random();
			int randomCnt = word.length > 10 ? 10 : word.length;	// 검색어 랜덤 추출에 사용할 단어 개수
			int wordCnt = word.length > 3 ? 3 : word.length;		// 검색에 사용할 단어 개수,
			int randomIdx[] = new int[wordCnt];	// 검색어 선정에 사용할 랜덤 인덱스 번호
			
			
			for(int i = 0; i < wordCnt; ++i) {
				randomIdx[i] = ran.nextInt(wordCnt);
				for(int j = 0; j < i; ++j) {
					if(randomIdx[i] == randomIdx[j]) {
						--i;
						break;
					}
				}
			}
			System.out.println(Arrays.toString(randomIdx));
			

			

			for(int i = 0; i < randomIdx.length; ++i) {
				System.out.println("검색어 : " + word[randomIdx[i]]);
				ArrayList<MovieInfoVO> result = mapper.searchMovie(word[randomIdx[i]]);
				for(MovieInfoVO m : result) {
					searchHistoryMovieList.add(m);
				}
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rconn.close();
		}
		
		
		
		
		
		return searchHistoryMovieList;
	}





	

	
	
	
	
	
	
	
}
