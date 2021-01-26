package com.class4.common.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.class4.command.user.UserVO;

public class ReviewHandler extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String writer = request.getParameter("writer");
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		System.out.println(writer);
		System.out.println( "review인터셉터 실행");
		if (vo != null) {
			if(writer != null) {
				if(vo.getUserId().equals(writer)) {
					return true;
				}
			}
			
		}
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('권한이 없습니다');");
		out.println("history.go(-1);");		
		out.println("</script>");	
		
		return false;
	}

	
	
}
