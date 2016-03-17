package com.injung.persistence;


import com.injung.domain.UserVO;




public interface UserDAO {

	public void create(UserVO vo) throws Exception;
	public UserVO getNo(Long no)throws Exception;
	public UserVO getId(String id)throws Exception;
	public UserVO get(UserVO vo)throws Exception;
	public void delete(String id)throws Exception;
	public void update(UserVO vo) throws Exception;
	public UserVO findId(UserVO vo) throws Exception;
	public UserVO findPw(UserVO vo) throws Exception;
	
	
}
