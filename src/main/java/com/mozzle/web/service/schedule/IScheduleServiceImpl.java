package com.mozzle.web.service.schedule;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mozzle.web.dto.schedule.ScheduleDto;

/**
 * @author hyuns
 * @since 2021-12-11
 */

@Service
public class IScheduleServiceImpl implements IScheduleService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	private final String NS = "com.mozzle.web.Schedule.";

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<ScheduleDto> scheduleselectAll(Map<String, String> map) {
		logger.info("캘린더 리스트 출력 {} :", map);
		return session.selectList(NS + "scheduleselectAll", map);
	}

	@Override
	public int scheduleinsert(ScheduleDto dto) {
		logger.info("캘린더 일정등록 {} :", dto);
		return session.insert(NS + "scheduleinsert", dto);
	}

	@Override
	public int schedulecount(Map<String, String> map) {
		logger.info("일정 개수 {} :", map);
		int cnt = session.selectOne(NS + "schedulecount", map);
		return cnt;
	}

	@Override
	public List<ScheduleDto> scheduleselectViewAll(Map<String, String> map) {
		logger.info("일정 리스트 ?개만 보여준다.{} :", map);
		return session.selectList(NS + "scheduleselectViewAll", map);
	}

	@Override
	public ScheduleDto scheduleselectOne(String schedule_id) {
		logger.info("일정 상세보기 {} :", schedule_id);
		return session.selectOne(NS + "scheduleselectOne", schedule_id);
	}

	@Override
	public int scheduleupdate(ScheduleDto dto) {
		logger.info("일정 업데이트 {} :", dto);
		return session.update(NS + "scheduleupdate", dto);
	}

	@Override
	public int scheduledeflag(Map<String, String[]> schedule_id) {
		logger.info("일정 삭제(보류) {} :", schedule_id);
		return session.delete(NS + "scheduledeflag", schedule_id);
	}

	@Override
	public int scheduledelete(Map<String, String[]> schedule_id) {
		logger.info("일정 완전 삭제 {} : ", schedule_id);
		return session.delete(NS + "scheduledelete", schedule_id);
	}

}