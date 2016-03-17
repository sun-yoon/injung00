package com.injung.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.injung.annotation.Auth;
import com.injung.annotation.AuthUser;
import com.injung.domain.UserVO;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Auth
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String mainPage(@AuthUser UserVO uv, Model model) {
		logger.info("main get.....");
		return "redirect:/board/list";
	}	
	
	
	@RequestMapping(value="/board/list", method=RequestMethod.GET)
	public void list(@AuthUser UserVO uv) {
		if(uv!=null)
			logger.info(uv.getEmail());
		else{
			logger.info("uv is null");
		}
	}
	
}
