package class4;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.junit.Test;

import com.class4.command.MovieInfoVO;
import com.class4.command.MovieListVO;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

public class test5 {
	
	@Test
	public void code() {
		
		String key = "7e7efe4ec48bc16bff2f86fbc588f9ca";
		
		//영화 api 불러오기
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		//공통코드 조회
		String comCodeList;
		//공통코드 "2201" = 영화유형코드
		try {
			//값을 json으로 반환
			comCodeList = service.getComCodeList(true, "2201");
			
			//json 라이브러리를 통해 Handling(영화목록 조회)
			ObjectMapper mapper = new ObjectMapper();
			HashMap<String, Object> comCodeHashMap = mapper.readValue(comCodeList, HashMap.class);
			
			//공통코드 추출
			ArrayList<Object> list = (ArrayList<Object>) comCodeHashMap.get("codes");
			//영화 리스트 조회
			String[] codeList = {list.get(0).toString(), list.get(1).toString(), list.get(2).toString()};
			String[] movieTypeCd = new String[3];
			for(int i = 0 ; i < movieTypeCd.length ; i++) {
				movieTypeCd[i] = codeList[i].split(",")[0].split("=")[1];
				
			}
			
			// 영화리스트 호출에 필요한 인터페이스
			String curPage = "1"; //현재페이지 지정 default = 1
			String itemPerPage = "20"; // 결과 row의 개수를 지정합니다 
			String movieNm = ""; // 영화명 조회 (영화 전체 조회)
			String directorNm = ""; //영화감독명으로 조회
			String openStartDt = "2020"; //조회시작 개봉연도
			String openEndDt = "2021"; //조회종료 개봉연도
			String prdtStartYear = ""; //조회시작 제작연도
			String prdtEndYear = ""; //조회종료 제작연도
			String repNationCd = ""; //국적코드 (default = 전체)
			
			// 영화리스트 호출 
			String s = service.getMovieList(true, curPage, itemPerPage, movieNm, directorNm, openStartDt, openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCd);
			
			//json -> map
			HashMap<String, Object> movieMap = mapper.readValue(s, HashMap.class);
			
			//영화코드 추출
			//System.out.println(movieMap);
			LinkedHashMap<String, Object> mvLsRs = (LinkedHashMap<String, Object>) movieMap.get("movieListResult");
			ArrayList<Object> movieList = (ArrayList<Object>) mvLsRs.get("movieList");
			//System.out.println("무비리스트 목록 : "+movieList.toString());
			
			//'영화 코드'를 저장하는 리스트
			ArrayList<String> movieCdList = new ArrayList<String>();
			
			//movie테이블에서 영화 코드 가져오기
			for(int i=0; i < movieList.size() ; ++i) {
				LinkedHashMap<String, Object> cdHashMap = (LinkedHashMap<String, Object>)movieList.get(i);
				String movieCd = (String) cdHashMap.get("movieCd");
				//System.out.println(movieCd);
				
				movieCdList.add(movieCd);
			}
			
			//영화 코드를 이용한 영화정보 불러오기
			for(int i=0; i< movieCdList.size() ; i++) {
				String strMovieInfo = service.getMovieInfo(true, movieCdList.get(i));
				//System.out.println(strMovieInfo);
				HashMap<String, Object> infoMap = mapper.readValue(strMovieInfo, HashMap.class);
				HashMap<String, Object> mvInRs = (HashMap<String, Object>) infoMap.get("movieInfoResult");
				LinkedHashMap<String, Object> movieInfo = (LinkedHashMap<String, Object>) mvInRs.get("movieInfo");
				//System.out.println(movieInfo);
				
				MovieListVO movie = new MovieListVO();
				movie.setMovieCd(movieInfo.get("movieCd").toString());
				movie.setTitle(movieInfo.get("movieNm").toString());
				movie.setFtitle(movieInfo.get("movieNmEn").toString());
				
				ArrayList<Object> audits = (ArrayList<Object>)movieInfo.get("audits");
					if(audits.size() == 0) {
						movie.setGrade("등급 없음");
					}else {
						LinkedHashMap<String, Object> grade = (LinkedHashMap<String, Object>) audits.get(0);
						movie.setGrade(grade.get("watchGradeNm").toString());
					}//end if
				
				String strDate = movieInfo.get("openDt").toString();
				//System.out.println(strDate);
				String strDateFormat = strDate.substring(6)+"/" + strDate.substring(4, 6) + "/" + strDate.substring(0,4);
				//System.out.println(strDateFormat);
				
				DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
				Date date  = df.parse(strDateFormat);
				Timestamp openDt = new Timestamp(date.getTime());
				movie.setOpenDt(openDt);
				
				
				
			
			} //end for	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
