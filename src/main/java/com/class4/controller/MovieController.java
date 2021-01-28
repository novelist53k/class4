package com.class4.controller;

import java.io.File;
import java.io.IOException;
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
import com.class4.command.UserVO;
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
		ArrayList<String>genreList = movieListService.getGenreByMno(cd);
		ArrayList<String>directorList = movieListService.getMnoByDno(cd);
		ArrayList<String>actorList = movieListService.getMnoByAno(cd);
		
		model.addAttribute("info", info);
		model.addAttribute("genre", genreList);
		model.addAttribute("director", directorList);
		model.addAttribute("actor",actorList);
		
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
	
	
	//사진등록페이지
	@RequestMapping(value="/phobtn",method=RequestMethod.POST)
	public String movieUpdatePhoto(@RequestParam("cd")String cd, Model model) {
		MovieInfoVO vo = new MovieInfoVO();
		MovieInfoVO info = movieListService.getMovieInfo(cd);
		model.addAttribute("info", info);
		return "movie/movieUpdatePoster";
	}
	
	
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String movieUpdate(MovieInfoVO vo,Model model) {
		
		movieListService.update(vo);
		System.out.println("됨?");
		String cd = vo.getMovieCd();
		MovieInfoVO info = movieListService.getMovieInfo(cd);
		model.addAttribute("info", info);
		return "redirect:/movie/movieContent";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "upload" ,method=RequestMethod.POST )
	public String upload(@RequestParam("file") MultipartFile file,
						 @RequestParam("title")String title
						 ) {
		
		try {
			System.out.println("영화제목:"+title);
			//UserVO userVO = (UserVO)session.getAttribute("login");
			MovieInfoVO vo = new MovieInfoVO();
			//占쏙옙占쏙옙占쏙옙
			//String fileLoca = vo.getPoster();
			
			//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
			String path = "C:\\Users\\user\\Desktop\\프로젝트\\class4\\class4\\src\\main\\webapp\\resources\\img\\poster";
			//String sqlPath = "\\movie\\resources\\img\\profile\\"+fileLoca;
			File folder = new File(path);
			if(!folder.exists()) {
				folder.mkdir();
			}
			
			String fileRealName = file.getOriginalFilename();
			Long size = file.getSize();
			
			String fileExtention = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			vo.setPoster(fileRealName);
			vo.setTitle(title);
			
			//占쏙옙占싸듸옙
			File saveFile = new File(path + "\\" + fileRealName);
			file.transferTo(saveFile);
			vo.setPoster(fileRealName);
			boolean result = movieListService.postUpload(vo);
			if(result) {
				return "success";
			}else {
				return "fail";
			}
		} catch (IllegalStateException e) {
			
			e.printStackTrace();
			return "fail";
		} catch (IOException e) {

			e.printStackTrace();
			return "fail";
		} catch (Exception e) {
			
			
			e.printStackTrace();
			return "fail";
		}
		
		
		
		
	}
	
	
	
	
	
	
}
