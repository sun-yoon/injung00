package com.injung.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.injung.domain.UserVO;



public class AuthInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	@Override
	public boolean preHandle(
		HttpServletRequest request,
		HttpServletResponse response,
		Object handler ) throws Exception {
		HttpSession session = request.getSession();
		if( session == null ) { //로그인 안함
			response.sendRedirect( "/user/loginform" );
			return false;
		}
		
		
		UserVO authUser = (UserVO)session.getAttribute( "authUser" );
		if( authUser == null ) { //로그인 안함
			response.sendRedirect( "/user/loginform" );
			return false;
		}
		return true;
	}
}
