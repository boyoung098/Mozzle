package com.mozzle.web;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.mozzle.web.dao.users.IGuestDao;
import com.mozzle.web.dto.users.GuestDto;

//김보영
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class TestMain {

//	@Autowired
//	private IUserDao userDao;
	
	@Autowired
	private IGuestDao guestDao;
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Test
	public void test() {
		//GuestDto guestdto = guestDao.selectByUUID("ee");
		//log.info("GuestDto 값 {}",guestdto);
		//List<GuestDto> list = guestDao.selectGuest();
		
		
	}

}
