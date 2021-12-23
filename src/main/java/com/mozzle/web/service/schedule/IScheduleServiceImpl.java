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
		logger.info("scheduleselectAll 전체출력 : {}", map);
		return session.selectList(NS+"scheduleselectAll");
	}

	@Override
	public boolean scheduleinsert(ScheduleDto dto) {
		logger.info("scheduleinsert 일정등록 : {}", dto);
		int cnt = session.insert(NS+"scheduleinsert", dto);
		return cnt>0?true:false;
	}

	@Override
	public boolean scheduleupdate(ScheduleDto dto) {
		logger.info("scheduleselectOne 일정상세보기 : {}", dto);
		int cnt = session.update(NS+"scheduleupdate", dto);
		return cnt>0?true:false;
	}

	@Override
	public boolean scheduledelete(String schedule_id) {
		logger.info("scheduledeflag 삭제(delete) : {}", schedule_id);
		int cnt = session.delete(NS+"scheduledeflag",schedule_id);
		return cnt>0?true:false;
	}

}