package class4;

import java.util.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;


import org.junit.Test;

import com.class4.command.MovieInfoVO;
import com.class4.command.mapping.MovieGenreVO;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;



public class test {
	
	@Test
	public void hihi() {
		KobisOpenAPIRestService service = new KobisOpenAPIRestService("7e7efe4ec48bc16bff2f86fbc588f9ca");
		
		String comCodeList;
		try {
			// 영화진흥위원회 api로 공통코드 호출
			comCodeList = service.getComCodeList(true, "2201");
			
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
			
			// 영화리스트 호출에 필요한 인터페이스
			String curPage = "1";
			String itemPerPage = "2";	// 호출할 개수
			String movieNm = "";
			String directorNm = "";
			String openStartDt = "2021";
			String openEndDt = "2021";
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
			System.out.println(movieList.toString());
			
			// 영화 코드를 저장할 리스트 생성
			ArrayList<String> movieCdList = new ArrayList<String>();
			
			// movie 테이블에서 영화 코드 가져오기
			
			for(int i = 0; i < movieList.size(); ++i) {
				LinkedHashMap<String, Object> cdHashMap = (LinkedHashMap<String, Object>) movieList.get(i);
				String movieCd = cdHashMap.get("movieCd").toString();
				
				// movieCd와 기존 테이블에 저장된 코드들을 비교해서 없는 코드일 시에만 movieCdList에 추가
				
				movieCdList.add(movieCd);
				
			}
			System.out.println("영화 코드 : " + movieCdList.toString());
			
			
			// 
			
			
			for(int i = 0; i < movieCdList.size(); ++i) {
				// 영화 코드를 이용하여 영화 정보 불러오기
				String strMovieInfo = service.getMovieInfo(true, movieCdList.get(i));
				HashMap<String, Object> movieInfoHashMap = mapper.readValue(strMovieInfo, HashMap.class);
				LinkedHashMap<String, Object> movieInfoResult = (LinkedHashMap<String, Object>) movieInfoHashMap.get("movieInfoResult");
				LinkedHashMap<String, Object> movieInfo = (LinkedHashMap<String, Object>) movieInfoResult.get("movieInfo");
				System.out.println(movieInfo);
				
				// api 정보로 MovieInfoVO 객체 생성
				MovieInfoVO movie = new MovieInfoVO();
				String mno = movieInfo.get("movieCd").toString();
				movie.setMovieCd(mno);
				movie.setTitle(movieInfo.get("movieNm").toString());
				movie.setFtitle(movieInfo.get("movieNmEn").toString());
				
				ArrayList<Object> audits = (ArrayList<Object>) movieInfo.get("audits");
				if(audits.size() == 0) {
					movie.setGrade("등급 없음");
				}
				else {
					LinkedHashMap<String, Object> grade = (LinkedHashMap<String, Object>) audits.get(0);
					movie.setGrade(grade.get("watchGradeNm").toString());
				}
				
				String strDate = movieInfo.get("openDt").toString();
				String strDateFormat = strDate.substring(6) + "/" + strDate.substring(4,6) + "/" + strDate.substring(0, 4);
				System.out.println(strDateFormat);
				
				DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			    Date date = dateFormat.parse(strDateFormat);
			    Timestamp openDt = new Timestamp(date.getTime());
			    movie.setOpenDt(openDt);
			    
			    
			    // 영화의 장르명 추출
			    ArrayList<Object> genres = (ArrayList<Object>) movieInfo.get("genres");
			    ArrayList<String> genreList = new ArrayList<String>();
			    for(int j = 0; j < genres.size(); ++j) {
			    	LinkedHashMap<String, Object> genreMap = (LinkedHashMap<String, Object>) genres.get(j);
			    	genreList.add(genreMap.get("genreNm").toString());
			    }
			    
			    // Genre 테이블에 없는 장르면 추가 있으면 아래로
			    
			    
			    
			    for(int j = 0; j < genreList.size(); ++j) {
			    	MovieGenreVO mgVO = new MovieGenreVO(1, movieCdList.get(i), genreList.get(j));
			    	// MovieGenre 테이블에서 mno와 genre가 동시에 같지 않다면 추가
			    	
			    }
			    
			    
			    
			    
			    
			    
			    
			}
			
			
			
			
			
			
			
			
			
		} catch (OpenAPIFault e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
