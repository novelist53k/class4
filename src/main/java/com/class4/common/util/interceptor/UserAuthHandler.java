package com.class4.common.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.class4.command.UserVO;

public class UserAuthHandler extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		System.out.println( "���ͼ��� ����");
		if (vo== null) {
			response.sendRedirect(request.getContextPath());
			return false;
		}else{
			
			return true;
		}
	}

	
	
}
