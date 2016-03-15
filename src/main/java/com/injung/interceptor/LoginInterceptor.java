package com.injung.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.injung.domain.UserVO;
import com.injung.service.UserService;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String id = request.getParameter( "id" );
		String password = request.getParameter( "password" );
		
		ApplicationContext applicationContext = 
			WebApplicationContextUtils.getWebApplicationContext( request.getServletContext() );		
		UserService service = applicationContext.getBean( UserService.class );

		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPassword(password);
		
		UserVO authUser = service.login(vo);
		if( authUser == null ) {
			response.sendRedirect( "/user/loginform" );
			logger.info("fail to login");
			return false;
		}
		
		HttpSession session = request.getSession( true );
		session.setAttribute( "authUser", authUser );
		logger.info(id);
		logger.info(password);
		response.sendRedirect( "/" );
		
		return false;
	}
}
	
//	@Override
//	public boolean preHandle(HttpServletRequest request, 
//			HttpServletResponse response, Object handler)throws Exception {
//		String id = request.getParameter("id");
//		String password = request.getParameter("password");
//		ApplicationContext applicationContext = 
//				WebApplicationContextUtils.getWebApplicationContext( request.getServletContext() );		
//			UserService service = applicationContext.getBean( UserService.class ); 
//			UserVO vo = new UserVO();
//			vo.setId(id);
//			vo.setPassword(password);
//			
//			UserVO authUser = service.login(dto);
//			if( authUser == null ) {
//				response.sendRedirect( "/user/loginform" );
//				return false;
//			}
//			
//			HttpSession session = request.getSession( true );
//			session.setAttribute( "authUser", authUser );
//			System.out.println(authUser);
//			response.sendRedirect( "/" );
//			
//			return false;
//		
//	}

//}
