package com.injung.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.injung.domain.UserVO;
import com.injung.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class UserDAOTest {

	 @Inject
	  private UserDAO dao;
	 private static Logger logger = LoggerFactory.getLogger(UserDAOTest.class);
	  @Test
	  public void testCreate() throws Exception {

		  UserVO vo = new UserVO();
		  vo.setId("qqq");
		  vo.setPassword("123");
		  vo.setName("www");
		  vo.setEmail("eee");
		  vo.setGender("m");
		  vo.setBirthDate("10-10-11");
		  
	    
	    dao.create(vo);
	  }
	  
}
