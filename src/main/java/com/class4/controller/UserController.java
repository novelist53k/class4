package com.class4.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.class4.command.user.GenreListVO;
import com.class4.command.user.UserActorListVO;
import com.class4.command.user.UserVO;
import com.class4.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	@Qualifier("UserService")
	private UserService userService;
	
	@RequestMapping("/join")
	public String join() {
		return "user/join";
	}
	
		
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		UserVO vo =(UserVO)session.getAttribute("login");
		String userId = vo.getUserId();
		
		//1:N관계 맵핑으로 결과를 처리
		UserVO userActorInfo = userService.getActorInfo(userId);
		UserVO userGenreInfo = userService.getGenreInfo(userId);
		UserVO userDirectorInfo = userService.getDirectorInfo(userId);
		List<Map<Integer, String>> genre = userService.genrelist();
		model.addAttribute("userActorInfo",userActorInfo);
		model.addAttribute("userGenreInfo",userGenreInfo);
		model.addAttribute("userDirectorInfo",userDirectorInfo);
		model.addAttribute("genre",genre);
		return "user/mypage";
	}
	@ResponseBody
	@RequestMapping(value="idCheck", method=RequestMethod.POST)
	public int idCheck(@RequestBody UserVO vo) {
		System.out.println(vo.getUserId());
		int result = userService.idCheck(vo.getUserId());
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="login", method=RequestMethod.POST)
	public int login(@RequestBody UserVO vo, Model model, HttpSession session) {
		
		UserVO result = userService.Login(vo);
		
		if(result == null) {
			
			return 0;
		}else {
			session.setAttribute("login", result);
			
			return 1;
		}
		
		
	}
	@RequestMapping(value="JoinReq", method=RequestMethod.POST)	
	public String Join(UserVO vo) {
		int result1 = 0;
		for (int i = 0; i < vo.getGenreLike().length; i++) {			
			vo.setGenre(vo.getGenreLike()[i]);
			result1 = userService.genreList(vo);
			
		}
		System.out.println(result1);
		for (int i = 0; i < vo.getLikeActor().length; i++) {
			vo.setActor(vo.getLikeActor()[i]);
			userService.actorList(vo);
		}
		for (int i = 0; i < vo.getLikeDirector().length; i++) {
			vo.setDirector(vo.getLikeDirector()[i]);
			userService.directorList(vo);
		}
			
		int result = userService.JoinReq(vo);
		if(result ==1) {
			
			return "redirect:/";
		}else {
			
			return "/join";		
			
		}
		
	}
	@ResponseBody
	@RequestMapping(value = "upload" ,method=RequestMethod.POST )
	public String upload(@RequestParam("file") MultipartFile file, HttpSession session) {
		
		
		
		try {
			UserVO userVO = (UserVO)session.getAttribute("userVO");
			
			//폴더명
			String fileLoca = userVO.getUserId();
			
			//저장할 폴더
			String path = "D:\\course\\workspace\\class4\\src\\main\\webapp\\resources\\img\\profile\\"+fileLoca;
			String sqlPath = "\\movie\\resources\\img\\profile\\"+fileLoca;
			File folder = new File(path);
			if(!folder.exists()) {
				folder.mkdir();
			}
			
			String fileRealName = file.getOriginalFilename();
			Long size = file.getSize();
			
			String fileExtention = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			
			System.out.println(fileRealName);
			
			//업로드
			File saveFile = new File(path + "\\" + fileRealName);
			file.transferTo(saveFile);
			userVO.setPath(sqlPath);
			userVO.setFileRealName(fileRealName);
			boolean result = userService.uploadProfile(userVO);
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
	@RequestMapping(value="delUser", method=RequestMethod.POST)
	public String delUser(@RequestParam( value ="checkPw") String checkPw, HttpSession session) {
		UserVO vo = (UserVO)session.getAttribute("login");
		System.out.println(vo.getUserId());
		System.out.println(checkPw+"입력한 비번");
		System.out.println(vo.getUserPw()+"현재 로그인한 비번");
		String userId = vo.getUserId();
		
		System.out.println(vo.getUserPw()+"컨트롤러 : 유저비번 비번 확인");
		
		if(vo.getUserPw().equals(checkPw)) {
			userService.delUser(userId);
			
			return "/user/join";
		}else {
			
			return "/user/mypage";
		}
		
		
		
		
	}
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(UserVO vo) {
		userService.update(vo);
		
		for (int i = 0; i < vo.getGenreLike().length; i++) {			
			vo.setGenre(vo.getGenreLike()[i]);
			userService.genreList(vo);			
		}		
		for (int i = 0; i < vo.getLikeActor().length; i++) {
			vo.setActor(vo.getLikeActor()[i]);
			userService.actorList(vo);
		}
		for (int i = 0; i < vo.getLikeDirector().length; i++) {
			vo.setDirector(vo.getLikeDirector()[i]);
			userService.directorList(vo);
		}
		
		return "a";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		
		session.invalidate();
		return "movie";
	}
	
}
