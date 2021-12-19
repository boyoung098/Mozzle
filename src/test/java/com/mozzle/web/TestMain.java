package com.mozzle.web;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

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
import com.mozzle.web.dao.users.IMozzleUserDao;
import com.mozzle.web.dto.users.GuestDto;
import com.mozzle.web.dto.users.MozzleUserDto;

//김보영
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class TestMain {

//	@Autowired
//	private IUserDao userDao;
	
	@Autowired
	private ApplicationContext context;
	
//	@Autowired
//	private IGuestDao guestDao;
//	
	@Autowired
	private IMozzleUserDao mozzleUserDao;
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Test
	public void test() {
		//GuestDto guestdto = guestDao.selectByUUID("ee");
		//log.info("GuestDto 값 {}",guestdto);
		//List<GuestDto> list = guestDao.selectGuest();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id", "1");
		map.put("user_id", "vv");
		//map.put("nickname", "바");
		//List<MozzleUserDto> userList = mozzleUserDao.selectListMozzleUser(map);
		//for (MozzleUserDto mozzleUserDto : userList) {
		//	log.info("mozzle의 회원 dto{}",mozzleUserDto);
		//}
		//log.info("찍은 값의 사이쯔{}",userList.size());
		
		
//		MozzleUserDto dto = new MozzleUserDto();
//		dto.setUser_id("aaaa");
//		dto.setMozzle_id("1");
//		dto.setNickname("asdgg");
//		dto.setBirthday_show("N");
		
		//모즐유저테이블에 일반회원 넣기
		//int n = mozzleUserDao.insertMozzleUser(dto);
		//assertEquals(1, n);
		
		//모즐유저를 userid로 조회
		//MozzleUserDto userdto = mozzleUserDao.selectMozzleUserByUserId(map);
		
		//탈퇴 deleteMozzleUser = O
//		MozzleUserDto deletedto = new MozzleUserDto();
//		deletedto.setUser_id("abcd");
//		deletedto.setMozzle_id("1");
//		int n = mozzleUserDao.deleteMozzleUser(deletedto);
//		assertEquals(1, n);
		
		MozzleUserDto updatedto = new MozzleUserDto();
		updatedto.setMozzle_id("1");
		updatedto.setUser_id("aaaa");
		updatedto.setImage_origin("아하하하.img");
		updatedto.setImage_saved("bxckjasdkjhsakdjvh.img");
		updatedto.setNickname("바보");
		updatedto.setBirthday_show("Y");
		
		
		int m = mozzleUserDao.updateMozzleUser(updatedto);
		assertEquals(1, m);
	}

}
