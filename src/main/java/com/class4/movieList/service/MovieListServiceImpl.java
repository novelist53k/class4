  
package com.class4.movieList.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.class4.movieList.mapper.MovieListMapper;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;

@Service("movieListService")
public class MovieListServiceImpl implements MovieListService{
	@Autowired
	private MovieListMapper movieListMapper;
	
	   //사람등록메서드
	   @Override
	   public void registP(RegistVO vo) {
	      System.out.println("사람등록 시작");
	      // api에 사용할 객체 service
	      KobisOpenAPIRestService service = new KobisOpenAPIRestService(vo.getKey());
	      String curPage = vo.getCurPage();   // 페이지
	      String itemPerPage = vo.getItemPerPage();   // 가져올 사람 수
	      int row = Integer.parseInt(itemPerPage);
	      
	      try {
	         // 문자열을 반환 후 json 형식을 HashMap으로 변경하여 영화인리스트에서 영화인코드로 접근
	         String strPeopleList = service.getPeopleList(true, curPage, itemPerPage, "", "");
	         ObjectMapper mapper = new ObjectMapper();
	         HashMap<String, Object> peopleHashMap = mapper.readValue(strPeopleList, HashMap.class);
	         HashMap<String, Object> peopleListResult = (HashMap<String, Object>)peopleHashMap.get("peopleListResult");
	         
	         // peopleCd를 리스트에 보관
	         ArrayList<String> peopleCdList = new ArrayList<String>();
	         for(int i = 0; i < row; ++i) {
	            // peopleCd를 리스트에 추가
	            HashMap<String, Object> peopleList = (HashMap<String, Object>) ((ArrayList<Object>) peopleListResult.get("peopleList")).get(i);
	            peopleCdList.add(peopleList.get("peopleCd").toString());

	         }
	         
	         for(int i = 0; i < peopleCdList.size(); ++i) {
	            
	            // peopleCd로 영화인 정보 추출
	            String strActorInfo = service.getPeopleInfo(true, peopleCdList.get(i));
	            HashMap<String, Object> peopleResult = mapper.readValue(strActorInfo, HashMap.class);
	            LinkedHashMap<String, Object> peopleInfoResult = (LinkedHashMap<String, Object>) peopleResult.get("peopleInfoResult");
	            LinkedHashMap<String, Object> peopleInfo = (LinkedHashMap<String, Object>) peopleInfoResult.get("peopleInfo");
	            System.out.println(peopleInfo);
	            
	            // 인물코드, 이름, 영어이름
	            String peopleCd = peopleInfo.get("peopleCd").toString();
	            String peopleNm = peopleInfo.get("peopleNm").toString();
	            String peopleNmEn = peopleInfo.get("peopleNmEn").toString();
	            
	            
	            
	            // 기존 테이블에서 peopleCd 호출
	            ArrayList<String> tableActorCodeList = movieListMapper.getActorCodeList();
	            ArrayList<String> tableDirectorCodeList = movieListMapper.getDirectorCodeList();
	            
	            // 중복 여부 체크 변수
	            boolean actorFlag = true;
	            boolean directorFlag = true;
	            
	            for(int j = 0; j < tableActorCodeList.size(); ++j) {
	               if(peopleCd.equals(tableActorCodeList.get(j))) {
	                  actorFlag = false;
	                  break;
	               }
	            }
	            
	            for(int j = 0; j < tableDirectorCodeList.size(); ++j) {
	               if(peopleCd.equals(tableDirectorCodeList.get(j))) {
	                  directorFlag = false;
	                  break;
	               }
	            }
	            
	            System.out.println(1);
	            
	            // 중복 시 insert하지 않는다
	         
	            // 배우면 ActorVO에, 감독이면 DirectorVO에 추가
	            if(actorFlag && peopleInfo.get("repRoleNm").equals("배우")) {
	               // Actor 테이블을 조회해서 이미 있는 peopleCd라면 추가하지 말고 출연, 감독한 영화로 이동
	                  
	               ActorVO actorVO = new ActorVO(peopleCd, peopleNm, peopleNmEn);
	               movieListMapper.ActorInsert(actorVO);
	                  
	            }
	            else if(directorFlag && peopleInfo.get("repRoleNm").equals("감독")) {
	               // Director 테이블을 조회해서 이미 있는 peopleCd라면 추가하지 말고 출연, 감독한 영화로 이동
	                  
	               DirectorVO directorVO = new DirectorVO(peopleCd, peopleNm, peopleNmEn);
	               movieListMapper.DirectorInsert(directorVO);
	            }
	         
	            System.out.println(2);
	            
	            
	            // 출연, 감독한 정보 추출
	            ArrayList<Object> filmos = (ArrayList<Object>) peopleInfo.get("filmos");
	            
	            // 출연, 감독한 영화의 키 저장
	            ArrayList<String> movieCdListByAno = movieListMapper.getMnoByAno(peopleCd);
	            ArrayList<String> movieCdListByDno = movieListMapper.getMnoByDno(peopleCd);

	            
	            for(int j = 0; j < filmos.size(); ++j) {
	               LinkedHashMap<String, Object> filmoInfo = (LinkedHashMap<String, Object>) filmos.get(j);
	               boolean mnoFlag = true;
	               String mcd = filmoInfo.get("movieCd").toString();
	               System.out.println("사람 코드 : " + mcd);
	               
	               if(filmoInfo.get("moviePartNm").equals("배우")) {
	                  // MovieActor 테이블을 조회해서 movieCd와 peopleCd가 모두 일치하면 추가X
	                  for(String code : movieCdListByAno) {
	                     if(code.equals(mcd)) {
	                        mnoFlag = false;
	                     }
	                  }
	                  
	                  if(mnoFlag) {
	                     movieListMapper.registMovieActor(new MovieActorVO(mcd, peopleCd));                              
	                  }
	               }
	               else if (filmoInfo.get("moviePartNm").equals("감독")) {
	                  // MovieDirector 테이블을 조회해서 movieCd와 peopleCd가 모두 일치하면 추가X
	                  // MovieActor 테이블을 조회해서 movieCd와 peopleCd가 모두 일치하면 추가X
	                  for(String code : movieCdListByDno) {
	                     if(code.equals(mcd)) {
	                        mnoFlag = false;
	                     }
	                  }
	                  
	                  movieListMapper.registMovieDirector(new MovieDirectorVO(mcd, peopleCd));
	               }
	            }
	         }
	         
	         System.out.println("사람등록 끝");
	         
	         
	      } catch (Exception e) {
	         System.out.println("사람등록 에러");
	         e.printStackTrace();
	      }
	      
	   }
	
	
	
	
	   //영화등록메서드
	   @Override
	   public void regist(RegistVO vo) {
	      
	      System.out.println("시작");
	      String key = vo.getKey();
	      
	      
	      KobisOpenAPIRestService service = new KobisOpenAPIRestService(key); 
	      String comCodeList;
	      try {
	         // 영화진흥위원회 api로 공통코드 호출
	         comCodeList = service.getComCodeList(true, "2201");
	         System.out.println(1);
	         // json을 map으로 변환
	         ObjectMapper mapper = new ObjectMapper();
	         HashMap<String, Object> comCodeHashMap = mapper.readValue(comCodeList, HashMap.class);

	         // 공통 코드 추출
	         ArrayList<Object> list = (ArrayList<Object>) comCodeHashMap.get("codes");
	         
	         // 영화리스트 호출에 필요한 movieTypeCd 변수 생성
	         String[] codeList = {list.get(0).toString(), list.get(1).toString(), list.get(2).toString()};
	         String[] movieTypeCd = new String[3];
	         for(int i = 0; i < codeList.length; ++i) {
	            movieTypeCd[i] = codeList[i].split(",")[0].split("=")[1];
	         }
	         System.out.println(2);
	         // 영화리스트 호출에 필요한 인터페이스
//	         String curPage = "1";
//	         String itemPerPage = "100";   // 호출할 개수
//	         String movieNm = "";
//	         String directorNm = "";
//	         String openStartDt = "2021";
//	         String openEndDt = "2021";
//	         String prdtStartYear = "";
//	         String prdtEndYear = "";
//	         String repNationCd = "";
	         String curPage = vo.getCurPage();
	         String itemPerPage = vo.getItemPerPage();   // 호출할 개수
	         String movieNm = "";
	         String directorNm = "";
	         String openStartDt = vo.getOpenStartDt();
	         String openEndDt = vo.getOpenEndDt();
	         String prdtStartYear = "";
	         String prdtEndYear = "";
	         String repNationCd = ""; 
	         
	         // 영화진흥위원회 api로 영화리스트 호출
	         String s = service.getMovieList(true, curPage, itemPerPage,
	                         movieNm, directorNm, openStartDt,
	                         openEndDt, prdtStartYear, prdtEndYear,
	                         repNationCd, movieTypeCd);
	         
	         // json을 map으로 변환
	         HashMap<String, Object> movieMap = mapper.readValue(s, HashMap.class);
	         
	         // 영화코드 추출
	         movieMap.get("movieList");
	         LinkedHashMap<String, Object> map = (LinkedHashMap<String, Object>) movieMap.get("movieListResult");
	         ArrayList<Object> movieList = (ArrayList<Object>) map.get("movieList");
	         
	         // 영화 코드를 저장할 리스트 생성
	         ArrayList<String> movieCdList = new ArrayList<String>();
	         
	         // movie 테이블에서 영화 코드 가져오기
	         ArrayList<String> tableCodeList = movieListMapper.getCodeList();
	         
	         //System.out.println("코드 목록 : " + tableCodeList);
	         
	         same:for(int i = 0; i < movieList.size(); ++i) {
	            
	            LinkedHashMap<String, Object> cdHashMap = (LinkedHashMap<String, Object>) movieList.get(i);
	            
	            String movieCd = cdHashMap.get("movieCd").toString();
	            System.out.println(movieCd);
	            // movieCd와 기존 테이블에 저장된 코드들을 비교해서 없는 코드일 시에만 movieCdList에 추가
	            for(int l = 0; l < tableCodeList.size(); ++l) {
	               
	               if( tableCodeList.get(l).equals(movieCd) ) {
	                  continue same; 
	               }
	            
	            }//end inner for
	            
	            movieCdList.add(movieCd);
	         }//end out for
	         

	         System.out.println("첫번째여기");
	         
	         
	   
	         for(int i = 0 ; i < movieCdList.size(); ++i) {
	            String strMovieInfo = service.getMovieInfo(true, movieCdList.get(i));
	            HashMap<String, Object> movieInfoHashMap = mapper.readValue(strMovieInfo, HashMap.class);
	            LinkedHashMap<String, Object> movieInfoResult = (LinkedHashMap<String, Object>) movieInfoHashMap.get("movieInfoResult");
	            LinkedHashMap<String, Object> movieInfo = (LinkedHashMap<String, Object>) movieInfoResult.get("movieInfo");
	            //ArrayList<HashMap<String, Object>> genres = (ArrayList<HashMap<String, Object>>)movieInfo.get("genres");
	            ArrayList<LinkedHashMap<String, Object>> genres = (ArrayList<LinkedHashMap<String, Object>>) movieInfo.get("genres");
	            System.out.println(genres.size());
	            //불러오기 
	            
	            
	            ArrayList<String> tableGenres = movieListMapper.getGenreList();//<----------------------------
	            
	            String genreNm = "";
	            boolean flag= true;
	            
	            start:for(int j = 0; j < genres.size() ; j++) {
	               flag = true;
	               
	               System.out.println("되냐?");
	               genreNm = genres.get(j).get("genreNm").toString();
	               System.out.println("장르명 : " + genreNm);

	               
	               for(int k = 0; k < tableGenres.size(); ++k) {
	                  if(tableGenres.get(k).equals(genreNm)){
	                     flag = false;
	                  }
	               }
	               
	               System.out.println("중복 아니면 true : " + flag);
	               if(flag) {
	                  GenreVO genre = new GenreVO();
	                  genre.setGenre(genreNm);
	                  movieListMapper.GenreInsert(genre);
	               }
	            }
	            
	            
	            
	            
	         }
	         System.out.println("두번째");
	         
	         
	         System.out.println("세번째");
	         for(int i = 0; i < movieCdList.size(); ++i) {
	            System.out.println("영화 코드 목록 : " + movieCdList);
	            // 영화 코드를 이용하여 영화 정보 불러오기
	            String strMovieInfo = service.getMovieInfo(true, movieCdList.get(i));
	            HashMap<String, Object> movieInfoHashMap = mapper.readValue(strMovieInfo, HashMap.class);
	            LinkedHashMap<String, Object> movieInfoResult = (LinkedHashMap<String, Object>) movieInfoHashMap.get("movieInfoResult");
	            LinkedHashMap<String, Object> movieInfo = (LinkedHashMap<String, Object>) movieInfoResult.get("movieInfo");
	            
	            
	            
	            MovieInfoVO movie = new MovieInfoVO();
	            movie.setMovieCd(movieInfo.get("movieCd").toString());
	            movie.setTitle(movieInfo.get("movieNm").toString());
	            movie.setFtitle(movieInfo.get("movieNmEn").toString());
	            
	            
	            
	         
	            //등급

	            ArrayList<Object> audits = (ArrayList<Object>) movieInfo.get("audits");
	            if(audits.size() == 0) {
	               movie.setGrade("등급 없음");
	            }
	            else {
	               LinkedHashMap<String, Object> grade = (LinkedHashMap<String, Object>) audits.get(0);
	               movie.setGrade(grade.get("watchGradeNm").toString());
	            }
	            
	            String strDate = movieInfo.get("openDt").toString();
	            //System.out.println(strDate);
	            String strDateFormat = strDate.substring(0,4)+"/"+strDate.substring(4,6) + "/"+ strDate.substring(6,8);
	            //String strDateFormat = strDate.substring(6) + "/" + strDate.substring(0,4) + "/" + strDate.substring(6, 8);
	            DateFormat fm = new SimpleDateFormat("yyyy/MM/dd");
	            Date openDt = fm.parse(strDateFormat);
	            movie.setOpenDt(openDt);

	            movieListMapper.regist(movie);
	            
	            // 영화의 장르명 추출
	            ArrayList<Object> genres = (ArrayList<Object>) movieInfo.get("genres");
	            System.out.println(genres);
	             ArrayList<String> genreList = new ArrayList<String>();
	             for(int j = 0; j < genres.size(); ++j) {
	                LinkedHashMap<String, Object> genreMap = (LinkedHashMap<String, Object>) genres.get(j);
	                genreList.add(genreMap.get("genreNm").toString());
	             }
	             System.out.println("영화 장르 : " + genreList.toString());
	             
	             for(int j = 0; j < genreList.size(); ++j) {
	                ArrayList<String> genreListByMno = movieListMapper.getGenreByMno(movieCdList.get(i));
	                System.out.println("movieDirecotr테이블에서 영화 코드로 가져온 장르: " + genreListByMno);
	                
	                
	                
	                
	                MovieGenreVO mgVO = new MovieGenreVO(1, movieCdList.get(i), genreList.get(j));
	                System.out.println("추가할 놈 : " + mgVO.toString());
	                // MovieGenre 테이블에서 mno와 genre가 동시에 같지 않다면 추가

	                boolean mgFlag = true;
	                
	                System.out.println(genreListByMno);
	                for(String m : genreListByMno) {
	                   System.out.println("기존 장르 : " + m);
	                   System.out.println("넣을 장르 : " + genreList.get(j));
	                   if(m.equals(genreList.get(j))) {
	                      mgFlag = false;
	                      break;
	                   }
	                }
	                if(mgFlag) {
	                   System.out.println(1);
	                   System.out.println(mgVO.toString());
	                   movieListMapper.registMovieGenre(mgVO);                   
	                }

	                
	                
	             }
	         }
	         
	      System.out.println("끝");
	      
	         
	      } catch (Exception e) {
	         System.out.println("망");
	         e.printStackTrace();
	         
	      }
	      
	      
	      
	      
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
	public void update(MovieInfoVO vo) {
		 movieListMapper.update(vo);
	}
	@Override
	public ArrayList<String> getCodeList() {
		return movieListMapper.getCodeList();
	}



	@Override
	public MovieInfoVO getMovieInfo(String cd) {
		
		return movieListMapper.getMovieInfo(cd);
	}
	
	@Override
	public ArrayList<String> getActorCodeList() {
		return movieListMapper.getActorCodeList();
	}



	@Override
	public ArrayList<String> getDirectorCodeList() {
		
		return movieListMapper.getActorCodeList();
	}

	
	@Override
	public ArrayList<String> getPeopleCodeList() {
		ArrayList<String> actorCodeList = movieListMapper.getActorCodeList();
		ArrayList<String> directorCodeList = movieListMapper.getDirectorCodeList();
		ArrayList<String> peopleCodeList = new ArrayList<String>();
		
		for(int i = 0; i < actorCodeList.size(); ++i) {
			peopleCodeList.add(actorCodeList.get(i));
		}
		for(int i = 0; i < directorCodeList.size(); ++i) {
			peopleCodeList.add(directorCodeList.get(i));
		}
		
		
		return peopleCodeList;
	}

	
	@Override
	public void ActorInsert(ActorVO vo) {
		movieListMapper.ActorInsert(vo);
		
	}
	
	@Override
	public void DirectorInsert(DirectorVO directorVO) {
		movieListMapper.DirectorInsert(directorVO);
	}



	@Override
	public ArrayList<String> getGenreList() {
		
		
		return movieListMapper.getGenreList();
	}



	@Override
	public void GenreInsert(GenreVO vo) {
		movieListMapper.GenreInsert(vo);
		
	}


	@Override
	public boolean postUpload(MovieInfoVO vo) {
		
		return movieListMapper.postUpload(vo);
	}




	@Override
	public void registMovieGenre(MovieGenreVO vo) {
		movieListMapper.registMovieGenre(vo);
		
	}




	@Override
	public ArrayList<String> getGenreByMno(String mno) {
		
		return movieListMapper.getGenreByMno(mno);
	}




	@Override
	public ArrayList<String> getMnoByAno(String ano) {
		
		return movieListMapper.getMnoByAno(ano);
	}




	@Override
	public ArrayList<String> getMnoByDno(String dno) {
		return movieListMapper.getMnoByDno(dno);
	}




	@Override
	public void registMovieActor(MovieActorVO vo) {
		
		movieListMapper.registMovieActor(vo);
		
	}




	@Override
	public void registMovieDirector(MovieDirectorVO vo) {
		movieListMapper.registMovieDirector(vo);
	}



	
	
}
