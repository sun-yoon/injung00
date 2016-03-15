package com.injung.service;

import com.injung.domain.UserVO;
import com.injung.dto.LoginDTO;

public interface UserService {

	public void join(UserVO vo)throws Exception;
	public UserVO login(UserVO vo)throws Exception;
	public UserVO getUser(Long no)throws Exception;
	public UserVO getUser(String id)throws Exception;
	public void modify(UserVO vo)throws Exception;
	public UserVO checkId(String id)throws Exception;
	public void remove(String id)throws Exception;
	public UserVO login(LoginDTO dto)throws Exception;

	
}
