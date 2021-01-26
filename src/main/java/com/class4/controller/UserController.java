package com.class4.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
import com.class4.command.ReviewBoardVO;
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
		
		//1:N���� �������� ����� ó��
		UserVO userActorInfo = userService.getActorInfo(userId);
		UserVO userGenreInfo = userService.getGenreInfo(userId);
		UserVO userDirectorInfo = userService.getDirectorInfo(userId);
		List<ReviewBoardVO> usereview = userService.getReview(userId);
		
		model.addAttribute("userActorInfo",userActorInfo);
		model.addAttribute("userGenreInfo",userGenreInfo);
		model.addAttribute("userDirectorInfo",userDirectorInfo);
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
	public String Join(UserVO vo , DirectorVO dvo, ActorVO avo) {
		
		vo.setUserAge(vo.getUserYear()+vo.getUserMonth()+vo.getUserDay());
		System.out.println(vo.getGenrelist());
		System.out.println(vo.getActor());
		System.out.println(vo.toString());
		if(vo.getGenrelist() !=null) {
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
			System.out.println(factorName);
			System.out.println(aco);
			vo.setActor(actorName);
			avo.setActorName(actorName);
			avo.setFActorName(factorName);
			avo.setAco(aco);
			
			userService.actorList(vo, avo);
		
		}}
		
		if(vo.getLikeDirector()!=null) {
		for (int i = 0; i < vo.getLikeDirector().length; i++) {
			String directorName = vo.getLikeDirector()[i].substring(0,vo.getLikeDirector()[i].indexOf("."));
			String fdirectorName = vo.getLikeDirector()[i].substring(vo.getLikeDirector()[i].indexOf(".")+1,vo.getLikeActor()[i].lastIndexOf("."));
			String dco = vo.getLikeActor()[i].substring(vo.getLikeDirector()[i].lastIndexOf(".")+1);
			vo.setDirector(directorName);
			dvo.setDco(dco);
			dvo.setDirectorName(directorName);
			dvo.setFDirectorName(fdirectorName);
			userService.directorList(vo, dvo);
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
			
			//������
			String fileLoca = userVO.getUserId();
			
			//������ ����
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
			
			//���ε�
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
			
			return "/user/join";
		}else {
			
			return "/user/mypage";
		}
		
		
		
		
	}
	@RequestMapping("/update")
	public String update() {
				
		return "user/update";
	}
	@RequestMapping("/modify")
	public String modify(UserVO vo, HttpSession session) {
			System.out.println(vo.toString());
			
			session.setAttribute("login", userService.update(vo));
			
			
		return "redirect:/user/mypage";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, Model model) {
		
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/autocomplete", method = RequestMethod.POST)
	public void autoSearch(ModelMap model, HttpServletRequest request,			
			 HttpServletResponse response, UserVO vo,ActorVO actorvo) throws IOException {
		
		 request.setCharacterEncoding("UTF-8");
		
		 List<ActorVO> list = userService.actorList(actorvo);
		 JSONArray array = new JSONArray();
		 
		 for(int i= 0; i<list.size(); i++) {
			 array.add(list.get(i).getActorName()+"."+list.get(i).getFActorName() +"."+list.get(i).getAco());
			 
			 
			 
		}
		 System.out.println(array.toString());
		 PrintWriter out = response.getWriter();
		 out.print(array.toString());
		 
		  
		 
		 
		 
		 
	}
	@RequestMapping(value = "/autocomplete1", method = RequestMethod.POST)
	public void autoSearch1(ModelMap model, HttpServletRequest request,			
			 HttpServletResponse response, UserVO vo, DirectorVO director) throws IOException {
		
		 request.setCharacterEncoding("UTF-8");
		
		 List<DirectorVO> list = userService.directorList(director);
		 JSONArray array = new JSONArray();
		 
		 for(int i= 0; i<list.size(); i++) {
			 array.add(list.get(i).getDirectorName()+" / "+list.get(i).getFDirectorName()+" / "+list.get(i).getDco());
			 
		}
		 System.out.println(array.toString());
		 PrintWriter out = response.getWriter();
		 out.print(array.toString());
		 out.flush();		 
		 out.close();
		 array.clear();
		 System.out.println(array.toString());		 
		 list.clear();
		 
		 		 
	}
	
	
}
