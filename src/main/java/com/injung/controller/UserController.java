package com.injung.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.injung.annotation.AuthUser;
import com.injung.domain.UserVO;
import com.injung.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService service;
	
	@RequestMapping( value="/joinform", method = RequestMethod.GET )
	public void joinform(){
		logger.info("joinform get.....");
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("joinform post....");
		logger.info(vo.toString());

		service.join(vo);

		rttr.addFlashAttribute("msg", "success");

		// return "/board/success";
		return "redirect:/user/joinsuccess";
	}
	
	@RequestMapping( value="/joinsuccess", method = RequestMethod.GET )
	public void joinSuccess(UserVO vo, Model model) throws Exception {
		logger.info("joinSuccess get.....");
	}

	@RequestMapping("checkid")
	@ResponseBody
	public Object checkid(@RequestParam("id") String id) throws Exception{
		System.out.println(id);
		UserVO userVO = service.checkId(id);
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("result", "success");
		map.put("data", userVO !=null);
		return map;
	}
	
	@RequestMapping( value="/loginform", method = RequestMethod.GET )
	public void loginform() throws Exception {
	}
	
	@RequestMapping( value="/remove", method = RequestMethod.GET )
	public String remove(HttpSession session, Model model) throws Exception {
		UserVO authUser = (UserVO) session.getAttribute("authUser");
		System.out.println(authUser.getId());
		service.remove(authUser.getId());
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping( value="/modifyform", method = RequestMethod.GET )
	public void modifyform(@AuthUser UserVO authUser, Model model) throws Exception {
		UserVO vo = service.getUser(authUser.getId());
		model.addAttribute( "vo", vo );
		
	}
	
	@RequestMapping( value = "/modify", method = RequestMethod.POST )
	public String modify( @AuthUser UserVO authUser, @ModelAttribute UserVO vo ) throws Exception {
		vo.setId(authUser.getId());
		System.out.println(vo);
		service.modify(vo);
		return "redirect:/";
	}

//	
//	@RequestMapping(value = "/modify", method = RequestMethod.GET)
//	public void modify(@RequestParam("no")int no,@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
//		model.addAttribute(service.read(no));
//	}
//	
//	@Auth( role="Admin" )
//	@RequestMapping( "/modifyform"  method = RequestMethod.GET)
//	public String modifyForm( @AuthUser UserVO authUser, Model model ) {
//		UserVO vo = service.getUser(authUser.getNo());
//		model.addAttribute( "vo", vo );
//		return "/user/modifyform";
//	}
}
