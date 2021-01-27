package com.class4.controller;

import java.io.File;
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
		public String regist(RegistVO vo) {
			
			movieListService.regist(vo);
			
			return "redirect:/movie/movieCurrent";
		
				
			
		}
		//사람등록
		@RequestMapping(value="registP",method = RequestMethod.POST)
		public String registPeople(RegistVO vo) {
			
			movieListService.registP(vo);
			return "movie/movieCurrent";
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
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String movieUpdate(@RequestParam("cd")String cd, Model model) {
		MovieInfoVO vo = new MovieInfoVO();
		MovieInfoVO info = movieListService.getMovieInfo(cd);
		model.addAttribute("info", info);
		return "movie/movieUpdate";
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String movieUpdate(@RequestParam("cd")String cd, MovieInfoVO vo) {
		System.out.println(1);
		vo.setMovieCd(cd);
		System.out.println(vo.getMovieCd());
		System.out.println(vo.getSubhead());
		System.out.println(vo.getContent());
		System.out.println(vo.getTrailer());
		System.out.println(vo.getPoster());
		return "movie/movieUpdate";
	}
	
	
	
	
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile file,
						 @RequestParam("subhead") String subhead,
						 @RequestParam("content") String content,
						 @RequestParam("trailer") String trailer,
						 @RequestParam("movieCd") String movieCd,
						 HttpSession session,
						 MovieInfoVO infoVo) {
		try {
			System.out.println(movieCd);
			//2. 저장할 폴더
			//String uploadPath = "/var/upload/" + fileLoca;
			String uploadPath = "C:\\Users\\1104-07\\Desktop\\새 폴더\\git\\class4\\src\\main\\webapp\\resources\\img\\poster";
			File folder = new File(uploadPath);
			if(!folder.exists() ) {
				folder.mkdir(); //폴더생성
			}
			
			
			//3. 서버에 저장할 파일 이름
			String fileRealName = file.getOriginalFilename(); //파일이름
			Long size = file.getSize(); //파일사이즈
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());//확장자
			
			
			
			String fileName = fileRealName + fileExtension;//변경해서 저장할 파일이름 (uuid이름 + 확장자)
			
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
			
			
			//boolean result = snsBoardService.insertFile(vo);
			
//			if(result) { //성공
//				return "success";
//			} else {
//				return "fail"; 
//					
//			}
			
		} catch (NullPointerException e) {
			System.out.println("세션정보가 없음");
			return "fail";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		
		return "redirect:/movie/movieContent";
	}
	
	
	
	
	
	
}
