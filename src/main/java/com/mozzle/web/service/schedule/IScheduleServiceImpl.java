package com.mozzle.web.service.schedule;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mozzle.web.dao.schedule.IScheduleDao;
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
	
	@Autowired
	private IScheduleDao dao;

	@Override
	public List<ScheduleDto> scheduleselectAll(String mozzle_id, String yyyyMMdd) {
		logger.info("scheduleselectAll 전체출력 : {}", mozzle_id,yyyyMMdd);
		return dao.scheduleselectAll(mozzle_id, yyyyMMdd);
	}

	@Override
	public boolean scheduleinsert(ScheduleDto dto) {
		logger.info("scheduleinsert 일정등록 : {}", dto);
		return dao.scheduleinsert(dto);
	}

	@Override
	public ScheduleDto scheduledetail(int schedule_id) {
		logger.info("scheduledelete 삭제(delete) : {}", schedule_id);
		return dao.scheduledetail(schedule_id);
	}

	@Override
	public boolean scheduleupdate(ScheduleDto dto) {
		logger.info("scheduleselectOne 일정상세보기 : {}", dto);
		return dao.scheduleupdate(dto);
	}

	@Override
	public boolean scheduledelete(String[] schedule_id) {
		logger.info("scheduledelete 삭제(delete) : {}", schedule_id);
		return dao.scheduledelete(schedule_id);
	}

	@Override
	public int schedulecount(String schedule_id, String yyyyMMdd) {
		logger.info("schedulecount 개수(count) : {}", schedule_id,yyyyMMdd);
		return dao.schedulecount(schedule_id, yyyyMMdd);
	}

	

}