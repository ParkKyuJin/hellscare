package com.pro.hellscare.Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {

	// 로그인이 성공한 경우에 실행할 코드 
		@Override
		public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
				Authentication authentication) throws IOException, ServletException {
			System.out.println("UserLoginSuccessHandler");
			// 로그인이 성공한 경우에 실행할 코드
			/*
			UserVO vo = (UserVO) authentication.getPrincipal();
			System.out.println("UserVO ===> " + vo);
			
			String msg = authentication.getName() + "님 환영합니다.";
			request.setAttribute("msg", msg);
			
			RequestDispatcher rd = request.getRequestDispatcher("/");
			rd.forward(request, response);
			*/
			
			//파라미터 authentication이용 
			System.out.println("UserVO ==> " +  authentication.getName() );
		
			String viewpage = "";
			
			if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("USER_ADMIN"))) {
				
				// 관리자 로그인 성공 시 이동 페이지 
				request.getSession().setAttribute("memId", authentication.getName());
				viewpage="/WEB-INF/views/host/host_main.jsp";
			}else {
				request.getSession().setAttribute("memId", authentication.getName());
				
				
				// 회원 로그인 성공 시 이동 페이지 
				viewpage="/WEB-INF/views/index.jsp";
				System.out.println(viewpage);
				
			}
			
			RequestDispatcher rd = request.getRequestDispatcher(viewpage); 
			rd.forward(request, response);
		}
		

	
	
	

}