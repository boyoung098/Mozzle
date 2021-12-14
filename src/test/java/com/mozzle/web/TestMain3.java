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

import com.mozzle.web.dao.schedule.IScheduleDao;
import com.mozzle.web.dao.schedule.IScheduleDaoImpl;
import com.mozzle.web.dto.schedule.ScheduleDto;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class TestMain3 {

	@Autowired
	private ApplicationContext context;
	
	@Test
	public void test() {
		SqlSessionTemplate session = context.getBean("sqlSessionTemplate",SqlSessionTemplate.class);
		System.out.println("session 값="+session);
		
		assertNotNull(session);
		
		IScheduleDao dao = new IScheduleDaoImpl();
		
		/**
		 * 일정리스트 전부 출력
		 */
//		Map<String,String> map = new HashMap<String, String>();
//		map.put("schedule_id", "id의값");//똑같은 값 가져와야한다.
//		map.put("yyyymmdd", "20211207");
//		
//		System.out.println(dao.scheduleselectAll(map).hashCode());
		
		/**
		 * 일정등록
		 */
		ScheduleDto dto = 
				new ScheduleDto();
		dao.scheduleinsert(dto);
	}

}
