package com.injung.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.injung.domain.UserVO;
import com.injung.dto.LoginDTO;
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
		
		return dao.get(vo.getId(),vo.getPassword());
	}

	@Override
	public UserVO getUser(Long no) throws Exception {
		
		return dao.getNo(no);
	}

	@Override
	public UserVO getUser(String id) throws Exception {
		
		return dao.getId(id);
	}

	@Override
	public void modify(UserVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public UserVO checkId(String id) throws Exception {
		
		return dao.getId(id);
	}

	@Override
	public void remove(String id) throws Exception {
		dao.delete(id);
		
	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

}
