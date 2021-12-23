package com.mozzle.web;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mozzle.web.dao.notice.INoticeDao;

// 작성자 : 이종표
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class TestNotice {

	@Autowired
	private INoticeDao dao;
	
	@Test
	public void test() {

		List<Map<String, Object>> lists =
				dao.noticeSelectAll("qkrekfthsus");
		
		for(Map<String, Object> m: lists) {
			for( String key : m.keySet() ){
	            System.out.println( String.format("키 : %s, 값 : %s", key, m.get(key)) );
	        }
		}

	}

}
