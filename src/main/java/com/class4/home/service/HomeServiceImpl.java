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

	// 선호하는 배우 등록 여부
	@Override
	public int getWhetherToRegistActor(String id) {
		return mapper.getLikeActorCount(id);
	}


	// 선호하는 감독 등록 여부
	@Override
	public int getWhetherToRegistDirector(String id) {
		return mapper.getLikeDirectorCount(id);
	}


	// 선호하는 장르 등록 여부
	@Override
	public int getWhetherToRegistGenre(String id) {
		return mapper.getLikeGenreCount(id);
	}

	// 유저가 선호하는 배우가 출연한 영화리스트를 가져오는 함수
	@Override
	public ArrayList<MovieInfoVO> getUserActorML(String id) {
		Random ran = new Random();
		
		// 유저가 선호하는 배우, 감독, 장르별 영화들을 담을 변수
		ArrayList<MovieInfoVO> userLikeActorList = new ArrayList<MovieInfoVO>();
		

		// ======================================================
		// 유저가 선호하는 배우에 따른 영화 가져오기
		ArrayList<String> actorCodeList = mapper.getActorCodeList(id);	// 유저가 선호하는 배우의 코드 리스트
		ArrayList<String> codeListByActor = new ArrayList<String>();	// 유저가 선호하는 배우의 코드로 영화 코드를 가져와 저장하기 위한 리스트
		
		for(String a : actorCodeList) {
			codeListByActor.addAll(mapper.getCodeListByActor(a));	// 배우 코드로 영화 코드를 받아 리스트에 추가
		}
		HashSet<String> codeSetByActor = new HashSet<String>(codeListByActor);	// 영화 코드 중복 제거
		codeListByActor = new ArrayList<String>(codeSetByActor);
		
		int[] randomIdx = new int[movieMaxCnt];	// 영화 코드 개수가 슬라이드 내 최대 영화 개수 초과시 영화 코드를 랜덤으로 가져오기 위한 인덱스 번호 변수
		
		if(codeListByActor.size() > movieMaxCnt) {
			// 영화코드 개수가 movieMaxCnt 초과시 가져온 영화코드의 인덱스 번호를 랜덤으로 저장
			for(int i = 0; i < movieMaxCnt; ++i) {
				randomIdx[i] = ran.nextInt(codeListByActor.size());
				for(int j = 0; j < i; ++j) {
					if(randomIdx[i] == randomIdx[j]) {	// 중복방지
						--i;
						break;
					}
				}
			}
			
			// 랜덤으로 저장한 인덱스 번호로 영화 가져오기
			for(int i = 0; i < randomIdx.length; ++i) {
				userLikeActorList.add(mapper.getMovie(codeListByActor.get(i)));
			}
		}
		else {
			// 영화코드 개수가movieMaxCnt이하일시 배우가 출연한 영화 코드로 영화 목록 가져오기
			for(String s : codeListByActor) {
				userLikeActorList.add(mapper.getMovie(s));
			}		
		}
		return userLikeActorList;
	}


	// 유저가 선호하는 감독의 영화리스트를 가져오는 함수
	@Override
	public ArrayList<MovieInfoVO> getUserDirectorML(String id) {
		ArrayList<MovieInfoVO> userLikeDirectorList = new ArrayList<MovieInfoVO>();
		Random ran = new Random();
		
		// 유저가 선호하는 감독에 따른 영화 가져오기
		ArrayList<String> directorCodeList = mapper.getDirectorCodeList(id);	// 유저가 선호하는 감독의 코드 리스트
		ArrayList<String> codeListByDirector = new ArrayList<String>();			// 유저가 선호하는 감독의 코드로 영화 코드를 가져와 저장하기 위한 리스트
		
		for(String d : directorCodeList) {
			codeListByDirector.addAll(mapper.getCodeListByDirector(d));	// 감독 코드로 영화 코드를 받아 리스트에 추가
		}
		// 중복 제거
		HashSet<String> codeSetByDirector = new HashSet<String>(codeListByDirector);	// 영화 코드 중복 제거
		codeListByDirector = new ArrayList<String>(codeSetByDirector);
		
		
		
		int[] randomIdx = new int[movieMaxCnt];	// 영화 코드 개수가 슬라이드 내 최대 영화 개수 초과시 영화 코드를 랜덤으로 가져오기 위한 인덱스 번호 변수
		
		if(codeListByDirector.size() > movieMaxCnt) {
			// 영화코드 개수가 movieMaxCnt 초과시 가져온 영화코드의 인덱스 번호를 랜덤으로 저장
			for(int i = 0; i < movieMaxCnt; ++i) {
				randomIdx[i] = ran.nextInt(codeListByDirector.size());
				for(int j = 0; j < i; ++j) {
					if(randomIdx[i] == randomIdx[j]) {	// 중복방지
						--i;
						break;
					}
				}
			}
			
			// 랜덤으로 저장한 인덱스 번호로 영화 가져오기
			for(int i = 0; i < randomIdx.length; ++i) {
				userLikeDirectorList.add(mapper.getMovie(codeListByDirector.get(i)));
			}
		}
		else {
			// 영화코드 개수가movieMaxCnt이하일시 감독의 영화 코드로 영화 목록 가져오기
			for(String d : codeListByDirector) {
				userLikeDirectorList.add(mapper.getMovie(d));
			}		
		}
		return userLikeDirectorList;
	}
	
	
	
	
	
	
	
	// 유저가 선호하는 장르에 따른 영화리스트를 가져오는 함수
	@Override
	public ArrayList<MovieInfoVO> getUserGenreML(String id) {
		ArrayList<MovieInfoVO> userLikeGenreList = new ArrayList<MovieInfoVO>();
		Random ran = new Random();
		id = "qwer"; // 테스트용 변수 삭제 예정
		
		// 유저가 선호하는 장르에 따른 영화 가져오기
		ArrayList<String> genreCodeList = mapper.getGenreCodeList(id);	// 유저가 선호하는 장르 리스트
		ArrayList<String> codeListByGenre = new ArrayList<String>();	// 유저가 선호하는 장르로 영화 코드를 가져와 저장하기 위한 리스트
		
		for(String g : genreCodeList) {
			codeListByGenre.addAll(mapper.getCodeListByActor(g));	// 장르로 영화 코드를 받아 리스트에 추가
		}
		// 중복 제거
		HashSet<String> codeSetByGenre = new HashSet<String>(codeListByGenre);	// 영화 코드 중복 제거
		codeListByGenre = new ArrayList<String>(codeSetByGenre);
		
		
		
		int[] randomIdx = new int[movieMaxCnt];	// 영화 코드 개수가 슬라이드 내 최대 영화 개수 초과시 영화 코드를 랜덤으로 가져오기 위한 인덱스 번호 변수
		
		if(codeListByGenre.size() > movieMaxCnt) {
			// 영화코드 개수가 movieMaxCnt 초과시 가져온 영화코드의 인덱스 번호를 랜덤으로 저장
			for(int i = 0; i < movieMaxCnt; ++i) {
				randomIdx[i] = ran.nextInt(codeListByGenre.size());
				for(int j = 0; j < i; ++j) {
					if(randomIdx[i] == randomIdx[j]) {	// 중복방지
						--i;
						break;
					}
				}
			}
			
			// 랜덤으로 저장한 인덱스 번호로 영화 가져오기
			for(int i = 0; i < randomIdx.length; ++i) {
				userLikeGenreList.add(mapper.getMovie(codeListByGenre.get(i)));
			}
		}
		else {
			// 영화코드 개수가movieMaxCnt이하일시 장르별 영화 코드로 영화 목록 가져오기
			for(String g : codeListByGenre) {
				userLikeGenreList.add(mapper.getMovie(g));
			}		
		}
		
		
		
		return userLikeGenreList;
	}
	
	// 나이별 선호 영화 가져오기
	@Override
	public ArrayList<MovieInfoVO> getUserByAgeML(int age) {
		ArrayList<MovieInfoVO> listByUserAge = new ArrayList<MovieInfoVO>();
		RConnection rconn = null;
		System.out.println(age);
		System.out.println(age + 10);
		
		try {
			rconn = new RConnection("127.0.0.1", 6311);

			rconn.eval("library(rJava)");
			rconn.eval("library(DBI)");
			rconn.eval("library(RJDBC)");
			rconn.eval("library(dplyr)");
			
			rconn.eval("drv <- JDBC('oracle.jdbc.OracleDriver', 'C:/jdbc/Oracle/ojdbc8.jar')");
			rconn.eval("rconn <- dbConnect(drv, 'jdbc:oracle:thin:@localhost:1521/XEPDB1','CLASS4', 'CLASS4')");
			
			System.out.println(2);
			rconn.eval("ua_age <- dbGetQuery(rconn, 'select *" + 
					"                             from userActor" + 
					"                             WHERE (SYSDATE - uaage) >= " + age + " * 365 AND (SYSDATE - uaage) < " + (age + 10) + " * 365')");
			System.out.println(3);
			rconn.eval("ua_age <- ua_age %>%" + 
					"  group_by(ANO) %>%" + 
					"  summarise(feq = n()) %>%" + 
					"  arrange(desc(feq))");
			System.out.println(4);
			rconn.eval("ud_age <- dbGetQuery(rconn, 'select *" + 
					" from userDirector" + 
					"                             WHERE (SYSDATE - udage) >= " + age + " * 365 AND (SYSDATE - udage) < " + (age + 10) + " * 365')");
			System.out.println(5);
			rconn.eval("ud_age <- ud_age %>%" + 
					"  group_by(DNO) %>%" + 
					"  summarise(feq = n()) %>%" + 
					"  arrange(desc(feq))");
			System.out.println(6);
			
			RList rList = rconn.eval("ua <- as.data.frame(ua_age)").asList();
			RList rList2 = rconn.eval("ud <- as.data.frame(ud_age)").asList();
			
			String[] codeArrayByActor = rList.at("ANO").asStrings();
			String[] codeArrayByDirector = rList2.at("DNO").asStrings();
			
			System.out.println(Arrays.toString(codeArrayByActor));
			System.out.println(Arrays.toString(codeArrayByDirector));

			ArrayList<String> codeList = new ArrayList<String>();	// 영화 코드를 저장하기 위한 리스트
			
			// 배우 코드와 감독 코드로 영화코드를 가져와 리스트에 추가
			for(String a : codeArrayByActor) {
				codeList.addAll(mapper.getCodeListByActor(a));
			}
			for(String d : codeArrayByDirector) {
				codeList.addAll(mapper.getCodeListByDirector(d));
			}
			
			HashSet<String> codeSet = new HashSet<String>(codeList);	// 영화 코드 중복 제거
			codeList = new ArrayList<String>(codeSet);
			
			Random ran = new Random();
			int[] randomIdx = new int[movieMaxCnt];	// 영화 코드 개수가 슬라이드 내 최대 영화 개수 초과시 영화 코드를 랜덤으로 가져오기 위한 인덱스 번호 변수
			
			if(codeList.size() > movieMaxCnt) {
				// 영화코드 개수가 movieMaxCnt 초과시 가져온 영화코드의 인덱스 번호를 랜덤으로 저장
				for(int i = 0; i < movieMaxCnt; ++i) {
					randomIdx[i] = ran.nextInt(codeList.size());
					for(int j = 0; j < i; ++j) {
						if(randomIdx[i] == randomIdx[j]) {	// 중복방지
							--i;
							break;
						}
					}
				}
				
				// 랜덤으로 저장한 인덱스 번호로 영화 가져오기
				for(int i = 0; i < randomIdx.length; ++i) {
					listByUserAge.add(mapper.getMovie(codeList.get(i)));
				}
			}
			else {
				// 영화코드 개수가movieMaxCnt이하일시 배우가 출연한 영화 코드로 영화 목록 가져오기
				for(String s : codeList) {
					listByUserAge.add(mapper.getMovie(s));
				}		
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rconn.eval("dbDisconnect(rconn)");				
			} catch (Exception e2) {
				e2.printStackTrace();
			} finally {
				rconn.close();				
			}
			
		}		
		
		return listByUserAge;
	}
	
	// 성별별 선호 영화 가져오기
	@Override
	public ArrayList<MovieInfoVO> getUserByGenderML(String gender) {
		ArrayList<MovieInfoVO> listByUserGender = new ArrayList<MovieInfoVO>();
		RConnection rconn = null;
		System.out.println(gender);
		
		try {
			rconn = new RConnection("127.0.0.1", 6311);
			rconn.eval("library(rJava)");
			rconn.eval("library(DBI)");
			rconn.eval("library(RJDBC)");
			rconn.eval("library(dplyr)");
			
			rconn.eval("drv <- JDBC('oracle.jdbc.OracleDriver', 'C:/jdbc/Oracle/ojdbc8.jar')");
			rconn.eval("rconn <- dbConnect(drv, 'jdbc:oracle:thin:@localhost:1521/XEPDB1','CLASS4', 'CLASS4')");
			
			rconn.eval("ua <- dbGetQuery(rconn, 'SELECT * FROM userActor')");
			rconn.eval("ua <- ua %>%" + 
					"  filter(UAGENDER == '" + (gender.equals("남자") ? "남자" : "여자") + "') %>%" + 
					"  group_by(ANO) %>%" + 
					"  summarise(feq = n()) %>%" + 
					"  arrange(desc(feq))");

			rconn.eval("ud <- dbGetQuery(rconn, 'SELECT * FROM userDirector')");
			rconn.eval("ud <- ud %>%" + 
					"  filter(UDGENDER == '" + (gender.equals("남자") ? "남자" : "여자") + "') %>%" + 
					"  group_by(DNO) %>%" + 
					"  summarise(feq = n()) %>%" + 
					"  arrange(desc(feq))");

			
			RList rList = rconn.eval("ua <- as.data.frame(ua)").asList();
			RList rList2 = rconn.eval("ud <- as.data.frame(ud)").asList();
			
			String[] codeArrayByActor = rList.at("ANO").asStrings();
			String[] codeArrayByDirector = rList2.at("DNO").asStrings();
			
			System.out.println(Arrays.toString(codeArrayByActor));
			System.out.println(Arrays.toString(codeArrayByDirector));

			ArrayList<String> codeList = new ArrayList<String>();	// 영화 코드를 저장하기 위한 리스트
			
			// 배우 코드와 감독 코드로 영화코드를 가져와 리스트에 추가
			for(String a : codeArrayByActor) {
				codeList.addAll(mapper.getCodeListByActor(a));
			}
			for(String d : codeArrayByDirector) {
				codeList.addAll(mapper.getCodeListByDirector(d));
			}
			
			HashSet<String> codeSet = new HashSet<String>(codeList);	// 영화 코드 중복 제거
			codeList = new ArrayList<String>(codeSet);
			
			Random ran = new Random();
			int[] randomIdx = new int[movieMaxCnt];	// 영화 코드 개수가 슬라이드 내 최대 영화 개수 초과시 영화 코드를 랜덤으로 가져오기 위한 인덱스 번호 변수
			
			if(codeList.size() > movieMaxCnt) {
				// 영화코드 개수가 movieMaxCnt 초과시 가져온 영화코드의 인덱스 번호를 랜덤으로 저장
				for(int i = 0; i < movieMaxCnt; ++i) {
					randomIdx[i] = ran.nextInt(codeList.size());
					for(int j = 0; j < i; ++j) {
						if(randomIdx[i] == randomIdx[j]) {	// 중복방지
							--i;
							break;
						}
					}
				}
				
				// 랜덤으로 저장한 인덱스 번호로 영화 가져오기
				for(int i = 0; i < randomIdx.length; ++i) {
					listByUserGender.add(mapper.getMovie(codeList.get(i)));
				}
			}
			else {
				// 영화코드 개수가movieMaxCnt이하일시 배우가 출연한 영화 코드로 영화 목록 가져오기
				for(String s : codeList) {
					listByUserGender.add(mapper.getMovie(s));
				}		
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rconn.eval("dbDisconnect(rconn)");				
			} catch (Exception e2) {
				e2.printStackTrace();
			} finally {
				rconn.close();				
			}
			
		}
		
		return listByUserGender;
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
			System.out.println(Arrays.toString(word));	// 많이 사용된 단어 순서대로 출력
			
			Random ran = new Random();
			int randomCnt = word.length > 7 ? 7 : word.length;	// 검색어 랜덤 추출에 사용할 단어 개수
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
