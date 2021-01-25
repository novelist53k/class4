package com.class4.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.class4.command.MovieInfoVO;
import com.class4.command.MovieListVO;
import com.class4.command.RegistVO;
import com.class4.movie.util.Criteria;
import com.class4.movie.util.PageVO;
import com.class4.movieList.service.MovieListServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired
	@Qualifier("movieListService")
	private MovieListServiceImpl movieListService;
		
		//영화 등록페이지
		@RequestMapping("/movieRegist")
		public String movieRegist() {
			return "movie/movieRegist";
		}
		
		//test
		@RequestMapping(value="rp",method = RequestMethod.POST )
		public String rprprp(RegistVO vo) {
			
			return null;
		}
				
		
		
		// 영화 등록
		@RequestMapping(value ="regist",method = RequestMethod.POST )
		public String regist(RegistVO vo, RedirectAttributes RA) {
			System.out.println("시작");
			String key = vo.getKey();
			
			
			KobisOpenAPIRestService service = new KobisOpenAPIRestService(key); 
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
//				String curPage = "1";
//				String itemPerPage = "100";	// 호출할 개수
//				String movieNm = "";
//				String directorNm = "";
//				String openStartDt = "2021";
//				String openEndDt = "2021";
//				String prdtStartYear = "";
//				String prdtEndYear = "";
//				String repNationCd = "";
				String curPage = vo.getCurPage();
				String itemPerPage = vo.getItemPerPage();	// 호출할 개수
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
				ArrayList<String> tableCodeList = movieListService.getCodeList();
				
				//System.out.println("코드 목록 : " + tableCodeList);
				
				same:for(int i = 0; i < movieList.size(); ++i) {
					
					LinkedHashMap<String, Object> cdHashMap = (LinkedHashMap<String, Object>) movieList.get(i);
					
					String movieCd = cdHashMap.get("movieCd").toString();
					// movieCd와 기존 테이블에 저장된 코드들을 비교해서 없는 코드일 시에만 movieCdList에 추가
					for(int l = 0; l < tableCodeList.size(); ++l) {
						
						if( tableCodeList.get(l).equals(movieCd) ) {
							continue same; 
						}
					
					}//end inner for
					
					movieCdList.add(movieCd);
				}//end out for
				
				for(int i = 0; i < movieCdList.size(); ++i) {
					// 영화 코드를 이용하여 영화 정보 불러오기
					String strMovieInfo = service.getMovieInfo(true, movieCdList.get(i));
					HashMap<String, Object> movieInfoHashMap = mapper.readValue(strMovieInfo, HashMap.class);
					LinkedHashMap<String, Object> movieInfoResult = (LinkedHashMap<String, Object>) movieInfoHashMap.get("movieInfoResult");
					LinkedHashMap<String, Object> movieInfo = (LinkedHashMap<String, Object>) movieInfoResult.get("movieInfo");
					
					MovieInfoVO movie = new MovieInfoVO();
					movie.setMovieCd(movieInfo.get("movieCd").toString());
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
					//System.out.println(strDate);
					String strDateFormat = strDate.substring(0,4)+"/"+strDate.substring(4,6) + "/"+ strDate.substring(6,8);
					//String strDateFormat = strDate.substring(6) + "/" + strDate.substring(0,4) + "/" + strDate.substring(6, 8);
					DateFormat fm = new SimpleDateFormat("yyyy/MM/dd");
					Date openDt = fm.parse(strDateFormat);
					movie.setOpenDt(openDt);

				  movieListService.regist(movie);
				  
				}
				
			System.out.println("끝");
			
				
			} catch (Exception e) {
				System.out.println("망");
				e.printStackTrace();
				
			}
			RA.addFlashAttribute("msg", "정상처리되었습니다"); 
			return "main";
				
			
		}
		
		
		
		
		
	//현재개봉작 리스트
	@RequestMapping("/movieCurrent")
	public String movieCurrent(Model model, Criteria cri, MovieListVO vo) {
		int total = movieListService.getTotalC();

		ArrayList<MovieListVO> list = movieListService.cMovieList(cri);
		
		PageVO pageVO = new PageVO(cri,total);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);
		
		return "movie/movieCurrent";
		
		
	}
	
	//개봉예정작 리스트
	@RequestMapping("/movieExpected")
	public String movieExpected(Model model, Criteria cri, MovieListVO vo) {
		int total = movieListService.getTotalE();

		ArrayList<MovieListVO> list = movieListService.eMovieList(cri);
		PageVO pageVO = new PageVO(cri,total);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", pageVO);
		
		return "movie/movieExpected";
	}
	
	//영화 정보페이지
	@RequestMapping("/movieContent")
	public String movieContent(MovieInfoVO vo, Model model) {
		String cd = vo.getMovieCd();
		MovieInfoVO info = movieListService.getMovieInfo(cd);
		model.addAttribute("info", info);
		
		return "movie/movieContent";
	}
	
	
	@RequestMapping("/movieUpdate")
	public String movieUpdate() {
		return "movie/movieUpdate";
	}
	
	@RequestMapping(value="shoot",method = RequestMethod.POST )
	public String update(MovieInfoVO vo) {
		int result = movieListService.update(vo);
		return null;
	}
	
	
}