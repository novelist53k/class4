package com.class4.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.class4.command.ActorVO;
import com.class4.command.DirectorVO;
import com.class4.command.GenreVO;
import com.class4.command.MovieInfoVO;
import com.class4.command.MovieListVO;
import com.class4.command.RegistVO;
import com.class4.command.mapping.MovieActorVO;
import com.class4.command.mapping.MovieDirectorVO;
import com.class4.movie.util.Criteria;
import com.class4.movie.util.PageVO;
import com.class4.movieList.service.MovieListServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;

import freemarker.ext.jython.JythonWrapper;
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
				

				System.out.println("첫번째여기");
				
				ArrayList<String> tableGenres = movieListService.getGenreList();//<----------------------------
				
				System.out.println("장르목록 : "+tableGenres);
				for(int i = 0 ; i < movieCdList.size(); ++i) {
					String strMovieInfo = service.getMovieInfo(true, movieCdList.get(i));
					HashMap<String, Object> movieInfoHashMap = mapper.readValue(strMovieInfo, HashMap.class);
					LinkedHashMap<String, Object> movieInfoResult = (LinkedHashMap<String, Object>) movieInfoHashMap.get("movieInfoResult");
					LinkedHashMap<String, Object> movieInfo = (LinkedHashMap<String, Object>) movieInfoResult.get("movieInfo");
					//ArrayList<HashMap<String, Object>> genres = (ArrayList<HashMap<String, Object>>)movieInfo.get("genres");
					ArrayList<LinkedHashMap<String, Object>> genres = (ArrayList<LinkedHashMap<String, Object>>) movieInfo.get("genres");
					System.out.println(genres.size());
					//불러오기 
					
					boolean flag= true;
					String genreNm = "";
					///////학원에서 해야지... 지금 여기서부터 오류
					start:for(int j = 0; j < genres.size() ; j++) {
						System.out.println("되냐?");
						genreNm = genres.get(j).get("genreNm").toString();
						System.out.println("테이블값:"+tableGenres);
						if(tableGenres.equals(genreNm)){
							flag = false;
							break;
						}
//						GenreVO genre = new GenreVO();
//						genre.setGenre(genreNm);
//						movieListService.GenreInsert(genre);
					
						//System.out.println(genres.get(j).get("genreNm"));
//						String a = (String) genres.get(j).get("genreNm");
//						GenreVO genre = new GenreVO(a);
//						movieListService.GenreInsert(genre);
					}
					if(flag) {
						GenreVO genre = new GenreVO();
						genre.setGenre(genreNm);
						movieListService.GenreInsert(genre);
					}
					
				}
				System.out.println("두번째");
				
				
				System.out.println("세번째");
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
					
					
					
					
					//-----------------------------------------------------
//					ActorVO actor = new ActorVO();
//					
//					
//					ArrayList<Object> audits = (ArrayList<Object>) movieInfo.get("audits");
//					if(audits.size() == 0) {
//						movie.setGrade("등급 없음");
//					}
//					else {
//						LinkedHashMap<String, Object> grade = (LinkedHashMap<String, Object>) audits.get(0);
//						movie.setGrade(grade.get("watchGradeNm").toString());
//					}
//					
//					String strDate = movieInfo.get("openDt").toString();
//					//System.out.println(strDate);
//					String strDateFormat = strDate.substring(0,4)+"/"+strDate.substring(4,6) + "/"+ strDate.substring(6,8);
//					//String strDateFormat = strDate.substring(6) + "/" + strDate.substring(0,4) + "/" + strDate.substring(6, 8);
//					DateFormat fm = new SimpleDateFormat("yyyy/MM/dd");
//					Date openDt = fm.parse(strDateFormat);
//					movie.setOpenDt(openDt);

				  //movieListService.regist(movie);
				  
				}
				
			System.out.println("끝");
			
				
			} catch (Exception e) {
				System.out.println("망");
				e.printStackTrace();
				
			}
			//RA.addFlashAttribute("msg", "정상처리되었습니다"); 
			//return "registPeople";
			return "movie/movieRegist";
				
			
		}
		//사람등록
		@RequestMapping("/registPeople")
		public String registPeople() {
			System.out.println("사람등록 시작");
			// api에 사용할 객체 service
			KobisOpenAPIRestService service = new KobisOpenAPIRestService("7e7efe4ec48bc16bff2f86fbc588f9ca");
			String curPage = "100";	// 페이지
			String itemPerPage = "100";	// 가져올 사람 수
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
					ArrayList<String> tablePeopleCodeList = movieListService.getPeopleCodeList();
					System.out.println("기존 테이블 인물코드 : " + tablePeopleCodeList);
					
					// 중복 여부 체크 변수
					boolean flag = true;
					
					for(int j = 0; j < tablePeopleCodeList.size(); ++j) {
						if(peopleCd.equals(tablePeopleCodeList.get(j))) {
							flag = false;
							break;
						}
					}
					
					// 중복 시 insert하지 않는다
					if(flag) {
						// 배우면 ActorVO에, 감독이면 DirectorVO에 추가
						if(peopleInfo.get("repRoleNm").equals("배우")) {
							// Actor 테이블을 조회해서 이미 있는 peopleCd라면 추가하지 말고 출연, 감독한 영화로 이동
							
							ActorVO actorVO = new ActorVO(peopleCd, peopleNm, peopleNmEn);
							movieListService.ActorInsert(actorVO);
							
						}
						else if(peopleInfo.get("repRoleNm").equals("감독")) {
							// Director 테이블을 조회해서 이미 있는 peopleCd라면 추가하지 말고 출연, 감독한 영화로 이동
							
							DirectorVO directorVO = new DirectorVO(peopleCd, peopleNm, peopleNmEn);
							movieListService.DirectorInsert(directorVO);
						}
					}
					
					
					
					
					// 출연, 감독한 정보 추출
					ArrayList<Object> filmos = (ArrayList<Object>) peopleInfo.get("filmos");
					
					// 출연, 감독한 영화의 키 저장
					ArrayList<String> filmosMovieCdList = new ArrayList<String>();
					
					for(int j = 0; j < filmos.size(); ++j) {
						LinkedHashMap<String, Object> filmoInfo = (LinkedHashMap<String, Object>) filmos.get(j);
						
						if(filmoInfo.get("moviePartNm").equals("배우")) {
							// MovieActor 테이블을 조회해서 movieCd와 peopleCd가 모두 일치하면 추가X
							
							MovieActorVO movieActorVO = new MovieActorVO(filmoInfo.get("movieCd").toString(), peopleCd);
						}
						else if (filmoInfo.get("moviePartNm").equals("감독")) {
							// MovieDirector 테이블을 조회해서 movieCd와 peopleCd가 모두 일치하면 추가X
							
							MovieDirectorVO movieDirectorVO = new MovieDirectorVO(filmoInfo.get("movieCd").toString(), peopleCd);
						}
					}
				}
				
				System.out.println("사람등록 끝");
				
				
			} catch (Exception e) {
				System.out.println("사람등록 에러");
				e.printStackTrace();
			}
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
	
	//수정페이지
	@RequestMapping("/movieUpdate")
	public String movieUpdate() {
		return "movie/movieUpdate";
	}
	
	//수정 작업 컨트롤러
	@RequestMapping(value="shoot",method = RequestMethod.POST )
	public String update(MovieInfoVO vo) {
		int result = movieListService.update(vo);
		return null;
	}
	
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile file,
						 @RequestParam("content") String content,
						 HttpSession session) {
		try {
			UserVO userVO = (UserVO)session.getAttribute("userVO");
			String writer = userVO.getUserId(); //작성자정보
			
			//1. 날짜별로 폴더로 관리
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String fileLoca = sdf.format(date); //폴더명
			
			//2. 저장할 폴더
			String uploadPath = "/var/upload/" + fileLoca;
			//String uploadPath = "D:\\course\\upload\\"+fileLoca;
			File folder = new File(uploadPath);
			if(!folder.exists() ) {
				folder.mkdir(); //폴더생성
			}
			
			
			//3. 서버에 저장할 파일 이름
			String fileRealName = file.getOriginalFilename(); //파일이름
			Long size = file.getSize(); //파일사이즈
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());//확장자
			
			UUID uuid = UUID.randomUUID();
			String uuids = uuid.toString().replaceAll("-", "");
			
			String fileName = uuids + fileExtension;//변경해서 저장할 파일이름 (uuid이름 + 확장자)
			
			System.out.println("=========================");
			System.out.println("저장할폴더 : "+uploadPath);
			System.out.println("파일실제이름 : "+fileRealName);
			System.out.println("파일사이즈 : " + size);
			System.out.println("파일확장자 : "+ fileExtension);
			System.out.println("변경해서저장할 파일명 : "+ fileName);
			
			
			//4. 파일 업로드처리
			File saveFile = new File(uploadPath + "\\" +  fileName );
			file.transferTo(saveFile); //스프링의 업로드처리
			
			//5.DB에 insert작업
			SnsBoardVO vo = new SnsBoardVO(0, writer, content, uploadPath, fileLoca, fileName, fileRealName, null);
			boolean result = snsBoardService.insertFile(vo);
			
			if(result) { //성공
				return "success";
			} else {
				return "fail"; 
					
			}
			
		} catch (NullPointerException e) {
			System.out.println("세션정보가 없음");
			return "fail";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		
		
	}
	
	
}