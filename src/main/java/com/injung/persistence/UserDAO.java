package com.injung.persistence;


import com.injung.domain.UserVO;
import com.injung.dto.LoginDTO;



public interface UserDAO {

	public void create(UserVO vo) throws Exception;
	public UserVO getNo(Long no)throws Exception;
	public UserVO getId(String id)throws Exception;
	public UserVO get(String id, String password)throws Exception;
	public void delete(String id)throws Exception;
	public void update(UserVO vo) throws Exception;
	public UserVO login(LoginDTO dto) throws Exception;
}
