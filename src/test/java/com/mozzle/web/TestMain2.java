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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mozzle.web.dao.manage.IManageDao;
import com.mozzle.web.dto.manage.MozzleDto;
import com.mozzle.web.dao.board.IBoardDao;
import com.mozzle.web.dto.board.Board;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class TestMain2 {

	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private IManageDao dao;
	
	@Test
	public void test() {
		SqlSessionTemplate session = context.getBean("sqlSessionTemplate",SqlSessionTemplate.class);
		/*
		 * System.out.println("session 값="+session);
		 * 
		 * assertNotNull(dao.selectMozzleByCreatDate());
		 * 
		 * MozzleDto mdto = new MozzleDto`();
		 * 
		 * mdto.setCategory_code("1/2/3"); mdto.setMozzle_intro("TEST01 MOZZLE입니다");
		 * mdto.setMozzle_name("TEST01 MOZZLE"); mdto.setState("Y");
		 * 
		 * assertEquals(1, dao.registMozzle(mdto));
		 */
	
		assertNotNull(dao.selectMozzleBySearchFromTheLastest("커피"));
		
		assertNotNull(dao.selectMozzleBySearchBasedOnImportance("커피"));

	}
}
