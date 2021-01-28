package com.class4.common.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.class4.command.UserVO;

public class MovieHandler extends HandlerInterceptorAdapter{

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      
      HttpSession session = request.getSession();
      UserVO vo = (UserVO)session.getAttribute("login");
      System.out.println( "무비인터셉터 가동 ");
      if (vo== null || !vo.getUserId().equals("admin")) {
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("alert('Permission Denied');");
         out.println("location.href='/movie';");
         out.println("</script>");   
//         response.sendRedirect(request.getContextPath());
         return false;
      }else{
         
         return true;
      }
   }

   
   
}