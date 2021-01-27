package com.class4.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.class4.command.ActorVO;
import com.class4.command.DirectorVO;
import com.class4.command.GenreVO;
import com.class4.command.ReviewBoardVO;
import com.class4.command.UserVO;
import com.class4.command.mapping.UserActorVO;
import com.class4.command.mapping.UserDirectorVO;
import com.class4.command.mapping.UserGenreVO;
import com.class4.user.service.UserService;

import oracle.sql.TIMESTAMP;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	@Qualifier("UserService")
	private UserService userService;
	
	@RequestMapping("/join")
	public String join(Model model) {
		List<String> genreList = userService.getGenreList();
	            
		model.addAttribute("genreList",genreList);
	      
		return "user/join";
	}
	
		
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		UserVO vo =(UserVO)session.getAttribute("login");
		String userId = vo.getUserId();
		System.out.println("user나이값 : " +vo.getUserAge());
		
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = null;
		today = formatter.format(cal.getTime());
		Timestamp ts = Timestamp.valueOf(today);
		System.out.println("현재시간 "+ ts);
		
		List<UserActorVO> userActor = userService.getActorInfo(userId);
		List<UserGenreVO> userGenre = userService.getGenreInfo(userId);
		List<UserDirectorVO> userDirector = userService.getDirectorInfo(userId);
		List<ReviewBoardVO> usereview = userService.getReview(userId);
		
		model.addAttribute("userActorInfo",userActor);
		model.addAttribute("userGenreInfo",userGenre);
		model.addAttribute("userDirectorInfo",userDirector);
		model.addAttribute("userReview",usereview);
		
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
	public String Join(UserVO vo){
		
		String birthday = vo.getUserDay()+"/"+vo.getUserMonth()+"/"+ vo.getUserYear();

		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		try {
			Date date = dateFormat.parse(birthday);
			System.out.println(date.getYear());
			Timestamp age = new Timestamp(date.getYear()+date.getMonth()+date.getDay());
			vo.setUserAge(age);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(vo.toString());
		
		if(vo.getGenrelist() !=null) {
			System.out.println(vo.getGenrelist().length);
			for (int i = 0; i < vo.getGenrelist().length; i++) {			
				System.out.println(vo.getGenrelist());
				vo.setGenre(vo.getGenrelist()[i]);
				userService.genreList(vo);
			
			}
		}
		
		if(vo.getLikeActor() != null) {
		for (int i = 0; i < vo.getLikeActor().length; i++) {
			String actorName = vo.getLikeActor()[i].substring(0,vo.getLikeActor()[i].indexOf("."));
			String factorName = vo.getLikeActor()[i].substring(vo.getLikeActor()[i].indexOf(".")+1,vo.getLikeActor()[i].lastIndexOf("."));
			String aco = vo.getLikeActor()[i].substring(vo.getLikeActor()[i].lastIndexOf(".")+1);
			System.out.println(aco);
			vo.setActor(actorName);
			
			
			userService.actorList(vo, aco,actorName);
		
		}}
		
		if(vo.getLikeDirector()!=null) {
		for (int i = 0; i < vo.getLikeDirector().length; i++) {
			String directorName = vo.getLikeDirector()[i].substring(0,vo.getLikeDirector()[i].indexOf("."));
			String fdirectorName = vo.getLikeDirector()[i].substring(vo.getLikeDirector()[i].indexOf(".")+1,vo.getLikeDirector()[i].lastIndexOf("."));
			String dco = vo.getLikeDirector()[i].substring(vo.getLikeDirector()[i].lastIndexOf(".")+1);
			
			vo.setDirector(directorName);
		
			userService.directorList(vo,dco,directorName);
			}
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
			UserVO userVO = (UserVO)session.getAttribute("login");
			
			//占쏙옙占쏙옙占쏙옙
			String fileLoca = userVO.getUserId();
			
			//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
			String path = "D:\\project\\class4\\src\\main\\webapp\\resources\\img\\profile\\"+fileLoca;
			String sqlPath = "\\movie\\resources\\img\\profile\\"+fileLoca;
			File folder = new File(path);
			if(!folder.exists()) {
				folder.mkdir();
			}
			
			String fileRealName = file.getOriginalFilename();
			Long size = file.getSize();
			
			String fileExtention = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			
			System.out.println(fileRealName);
			
			//占쏙옙占싸듸옙
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
		
		String userId = vo.getUserId();
		
		
		
		if(vo.getUserPw().equals(checkPw)) {
			userService.delUser(userId);
			session.invalidate();
			
			return "/user/join";
		}else {
			
			return "/user/mypage";
		}
		
		
		
		
	}
	@RequestMapping("/update")
	public String update(HttpSession session,Model model) {
		UserVO vo =(UserVO)session.getAttribute("login");
		String userId = vo.getUserId();
		System.out.println(userId);
		
		System.out.println("1번");
		List<UserActorVO> userActor = userService.getActorInfo(userId);
		List<UserGenreVO> userGenre = userService.getGenreInfo(userId);
		List<UserDirectorVO> userDirector = userService.getDirectorInfo(userId);
		List<String> genreList = userService.getGenreList();
		
		model.addAttribute("userActorInfo",userActor);
		model.addAttribute("userGenreInfo",userGenre);
		model.addAttribute("userDirectorInfo",userDirector);
		model.addAttribute("genreList",genreList);
		model.addAttribute("vo", vo);
		System.out.println("3번");
		System.out.println(userGenre.toString());
		System.out.println(genreList.toString());
		
		return "user/update";
	}
	@RequestMapping("/modify")
	public String modify(UserVO vo, HttpSession session,Model model) {
		
		if (vo.getUserPw().equals("")) {
			UserVO user = (UserVO)session.getAttribute("login");
			vo.setUserPw(user.getUserPw());
		}
			
		String birthday = vo.getUserDay()+"/"+vo.getUserMonth()+"/"+ vo.getUserYear();

		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		try {
			Date date = dateFormat.parse(birthday);
			Timestamp age = new Timestamp(date.getTime());
			vo.setUserAge(age);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("수정"+vo.toString());
		userService.update(vo);
		session.setAttribute("login", vo);
		
		if(vo.getGenrelist() !=null) {
			System.out.println(vo.getGenrelist().length);
			for (int i = 0; i < vo.getGenrelist().length; i++) {			
				
				vo.setGenre(vo.getGenrelist()[i]);
				userService.genreList(vo);
			
			}
		}
		
		if(vo.getLikeActor() != null) {
		for (int i = 0; i < vo.getLikeActor().length; i++) {
			String actorName = vo.getLikeActor()[i].substring(0,vo.getLikeActor()[i].indexOf("."));
			String factorName = vo.getLikeActor()[i].substring(vo.getLikeActor()[i].indexOf(".")+1,vo.getLikeActor()[i].lastIndexOf("."));
			String aco = vo.getLikeActor()[i].substring(vo.getLikeActor()[i].lastIndexOf(".")+1);
			System.out.println(aco);
			vo.setActor(actorName);
			
			
			userService.actorList(vo, aco,actorName);
		
		}}
		
		if(vo.getLikeDirector()!=null) {
		for (int i = 0; i < vo.getLikeDirector().length; i++) {
			String directorName = vo.getLikeDirector()[i].substring(0,vo.getLikeDirector()[i].indexOf("."));
			String fdirectorName = vo.getLikeDirector()[i].substring(vo.getLikeDirector()[i].indexOf(".")+1,vo.getLikeDirector()[i].lastIndexOf("."));
			String dco = vo.getLikeDirector()[i].substring(vo.getLikeDirector()[i].lastIndexOf(".")+1);
			
			vo.setDirector(directorName);
		
			userService.directorList(vo,dco,directorName);
			}
		}
			
			
			
		return "redirect:/user/mypage";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, Model model) {
		
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/autocomplete", method = RequestMethod.POST)
	public void autoSearch(ModelMap model, HttpServletRequest request,			
			 HttpServletResponse response, ActorVO actorvo) throws IOException {
		
		 request.setCharacterEncoding("UTF-8");
		
		 List<ActorVO> list = userService.actorName(actorvo);
		 JSONArray array = new JSONArray();
		 
		 for(int i= 0; i < list.size(); i++) {
			 array.add(list.get(i).getActorName()+"."+list.get(i).getFActorName() +"."+list.get(i).getAno());
			 
			 
			 
		}
		 System.out.println(array.toString());
		 PrintWriter out = response.getWriter();
		 out.print(array.toString());
		 
		  
		 
		 
		 
		 
	}
	@RequestMapping(value = "/autocomplete1", method = RequestMethod.POST)
	public void autoSearch1(ModelMap model, HttpServletRequest request,			
			 HttpServletResponse response, UserVO vo, DirectorVO director) throws IOException {
		
		 request.setCharacterEncoding("UTF-8");
		
		 List<DirectorVO> list = userService.directorName(director);
		 JSONArray array = new JSONArray();
		 
		 for(int i= 0; i<list.size(); i++) {
			 array.add(list.get(i).getDirectorName()+"."+list.get(i).getFDirectorName()+"."+list.get(i).getDno());
			 
		}
		 System.out.println(array.toString());
		 PrintWriter out = response.getWriter();
		 out.print(array.toString());
		
		 System.out.println(array.toString());		 
		 list.clear();
		 
		 		 
	}
	
	
}
