package com.injung.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.injung.domain.UserVO;
import com.injung.persistence.UserDAO;


@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	private UserDAO dao;
	@Override
	public void join(UserVO vo) throws Exception {
		dao.create(vo);
		
	}

	@Override
	public UserVO login(UserVO vo) throws Exception {
		UserVO userVO = dao.get( vo );
		return userVO;
	}

	@Override
	public UserVO getUser(Long no) throws Exception {
		UserVO userVO = dao.getNo( no );
		return userVO;
	}

	@Override
	public UserVO getUser(String id) throws Exception {
		UserVO userVO = dao.getId( id );
		return userVO;
	}

	@Override
	public UserVO checkId(String id) throws Exception {
		UserVO userVO = dao.getId(id);
		return userVO;
	}

	@Override
	public void remove(String id) throws Exception {
		dao.delete(id);
		
	}

	@Override
	public void modify(UserVO vo) throws Exception {
		dao.update(vo); //db 업데이트
		
		//session 업데이트		
	}

	@Override
	public UserVO findId(UserVO vo) throws Exception {
		UserVO userVO = dao.findId(vo);
		return userVO;
	}

	@Override
	public UserVO findPw(UserVO vo) throws Exception {
		UserVO userVO = dao.findPw(vo);
		return userVO;
	}

}
