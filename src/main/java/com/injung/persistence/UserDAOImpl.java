package com.injung.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.injung.domain.UserVO;


@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace="user";
	
	@Override
	public void create(UserVO vo)throws Exception{
	
		session.insert(namespace+".create", vo);
	}

	@Override
	public UserVO getNo(Long no)throws Exception{
	
		return session.selectOne(namespace+".getNo", no);
	}

	@Override
	public UserVO getId(String id)throws Exception{
		
		return session.selectOne(namespace+".getId",id);
	}

	@Override
	public UserVO get(UserVO vo )throws Exception{
		UserVO userVO = session.selectOne(namespace+".get",vo);
		return userVO;
	}

	@Override
	public void delete(String id)throws Exception{
		session.delete(namespace+".delete",id);
		
	}

	@Override
	public void update(UserVO vo)throws Exception{
		session.update(namespace+".update",vo);
		
	}



}
