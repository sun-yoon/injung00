package com.injung.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.injung.domain.UserVO;
import com.injung.dto.LoginDTO;

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
	
		return session.selectOne(namespace+".selectByNo", no);
	}

	@Override
	public UserVO getId(String id)throws Exception{
		
		return session.selectOne(namespace+".selectById",id);
	}

	@Override
	public UserVO get(String id, String password)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "id", id );
		map.put( "password", password );
		return session.selectOne(namespace+".selectByNoAndPassword",map);
	}

	@Override
	public void delete(String id)throws Exception{
		session.delete(namespace+".delete",id);
		
	}

	@Override
	public void update(UserVO vo)throws Exception{
		session.update(namespace+".update",vo);
		
	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace+".login", dto);
	}

}
