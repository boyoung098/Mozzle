package com.mozzle.web;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mozzle.web.dao.schedule.IScheduleDao;
import com.mozzle.web.dto.schedule.ScheduleDto;
//import com.mozzle.web.dto.schedule.ScheduleLocationInfoDto;

/**
 * Schedule
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class TestMain3 {

	@Autowired
	private ApplicationContext context;

	@Autowired
	private IScheduleDao scheduledao;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Test
	public void test() {

		SqlSessionTemplate session = context.getBean("sqlSessionTemplate", SqlSessionTemplate.class);
		System.out.println("session 값 = " + session);

		/**
		 * 일정리스트
		 */
		/*
		 * Map<String, String> map = new HashMap<String, String>();
		 * map.put("schedule_id", "2"); map.put("yyyymmdd", "20211217");
		 * List<ScheduleDto> slist = scheduledao.scheduleselectAll(map); for
		 * (ScheduleDto dto : slist) { logger.info("리스트 dto {}", dto); }
		 */

		/**
		 * 일정입력 Info 먼저
		 */
//      ScheduleLocationInfoDto dto1 = new ScheduleLocationInfoDto();
//      dto1.setLocation_name("JUnitTest");
//      dto1.setAddress("JUnit주소1");
//      dto1.setAddress2("JUnit주소2");
//      dto1.setPhone("010-1111-1111");
//      
//      
//      ScheduleDto dto2 = new ScheduleDto();
//      dto2.setMozzle_id(2);
//      dto2.setWriter("JUnit작성자");
//      dto2.setTitle("JUnit타이틀");
//      dto2.setContent("JUnit내용");
//      dto2.setSchedule_date("2021-12-20");
//      dto2.setDelflag("N");
//      dto2.setLocation_code(3);
//      
//      System.out.println(scheduledao.scheduleinsert(dto2)); 
		/**
		 * 일정개수
		 */
		/*
		 * Map<String,String> map2 = new HashMap<String, String>();
		 * map2.put("schedule_date", "2021-12-17"); map2.put("yyyymmdd", "20211217");
		 * System.out.println(scheduledao.schedulecount(map2));
		 */
	}

}