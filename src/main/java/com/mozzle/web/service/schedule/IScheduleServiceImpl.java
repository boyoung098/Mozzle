package com.mozzle.web.service.schedule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mozzle.web.dao.schedule.IScheduleDao;
import com.mozzle.web.dto.schedule.ScheduleDto;
//import com.mozzle.web.dto.schedule.ScheduleLocationInfoDto;

/**
 * @author hyuns
 * @since 2021-12-11
 */

@Service
public class IScheduleServiceImpl implements IScheduleService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IScheduleDao dao;

	@Override
	public List<ScheduleDto> scheduleselectAll(String mozzle_id, String yyyyMMdd) {
		// 일정목록조회 : select문, 결과:List, 파라미터 id,yyyyMMdd(해당일)
		logger.info("scheduleselectAll 전체출력 : {}", mozzle_id, yyyyMMdd);
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id", mozzle_id);
		map.put("yyyyMMdd", yyyyMMdd);
		List<ScheduleDto> list = dao.scheduleselectAll(mozzle_id, yyyyMMdd);
		return list;
	}

	@Override
	public boolean scheduleinsert(ScheduleDto dto) {
		// 일정추가 : insert문, 파라미터 : dto
		logger.info("scheduleinsert 일정등록 : {}", dto);
		return dao.scheduleinsert(dto);
	}

	
	@Override
	public ScheduleDto scheduledetail(String schedule_id) {
		// 일정상세보기 : select문, 결과: ScheduleDto, 파라미터 : schedule_id
		return dao.scheduledetail(schedule_id);
	}

	@Override
	public boolean scheduleupdate(ScheduleDto dto) {
		// 일정 변경 : update문, 파라미터 : dto
		logger.info("scheduleupdate 일정변경 : {}", dto);
		return dao.scheduleupdate(dto);
	}

	@Override
	public boolean scheduledelete(String[] schedule_id) {
		// 일정 삭제 (여러개/한개 삭제)
		return dao.scheduledelete(schedule_id);
	}

	@Override
	public int schedulecount(String schedule_id, String yyyyMMdd) {
		// 일정의 개수 조회 : select문, 파라미터 : schedule_id, yyyyMMdd
		logger.info("schedulecount 개수(count) : {}", schedule_id, yyyyMMdd);
		return dao.schedulecount(schedule_id, yyyyMMdd);
	}

	@Override
	public List<ScheduleDto> scheduleselectViewAll(String schedule_id, String yyyyMM) {
		logger.info("scheduleselectViewAll 리스트 : {}", schedule_id, yyyyMM);
		return dao.scheduleselectViewAll(schedule_id, yyyyMM);
	}

	

}