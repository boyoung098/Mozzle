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
import com.mozzle.web.dto.schedule.ScheduleLocationInfoDto;

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
	public List<ScheduleLocationInfoDto> scheduleinfoselectAll(String location_code) {
		logger.info("scheduleinfoselectAll 전체출력 : {}", location_code);
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("location_code", location_code);
		List<ScheduleLocationInfoDto> list = session.selectList(NS + "scheduleinfoselectAll", map2);
		return list;
	}

	@Override
	public boolean scheduleinfoinsert(ScheduleLocationInfoDto dto2) {
		logger.info("scheduleinfoinsert 지도 값 등록 : {}", dto2);
		int cnt2 = session.insert(NS + "scheduleinfoinsert", dto2);
		return cnt2 > 0 ? true : false;
	}

	@Override
	public boolean scheduleinfoupdate(ScheduleLocationInfoDto dto2) {
		// 일정 변경 : update문, 파라미터 : dto
		logger.info("scheduleinfoupdate 지도값변경 : {}", dto2);
		int cnt2 = session.update(NS + "scheduleinfoupdate", dto2);
		return cnt2 > 0 ? true : false;
	}

	@Override
	public ScheduleLocationInfoDto scheduleinfodetail(int location_code) {
		// 지도값상세보기 : select문, 결과: ScheduleLocationInfoDto, 파라미터 : location_code
		ScheduleLocationInfoDto dto2 = session.selectOne(NS + "scheduleinfodetail", location_code);
		return dto2;
	}

	@Override
	public boolean scheduleinfodelete(String[] location_code) {
		// 일정 삭제 (여러개/한개 삭제)
		logger.info("scheduleinfodelete 삭제(delete) : {}", location_code);
		Map<String, String[]> map2 = new HashMap<String, String[]>();
		map2.put("location_codes", location_code);
		int cnt2 = session.delete(NS + "scheduleinfodelete", map2);
		return cnt2 > 0 ? true : false;
	}

	@Override
	public List<ScheduleDto> scheduleselectAll(String mozzle_id, String yyyyMMdd) {
		// 일정목록조회 : select문, 결과:List, 파라미터 id,yyyyMMdd(해당일)
		logger.info("scheduleselectAll 전체출력 : {}", mozzle_id, yyyyMMdd);
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id", mozzle_id);
		map.put("yyyyMMdd", yyyyMMdd);
		List<ScheduleDto> list = session.selectList(NS + "scheduleselectAll", map);
		return list;
	}

	@Override
	public boolean scheduleinsert(ScheduleDto dto) {
		// 일정추가 : insert문, 파라미터 : dto
		logger.info("scheduleinsert 일정등록 : {}", dto);
		int cnt = session.insert(NS + "scheduleinsert", dto);
		return cnt > 0 ? true : false;
	}

	@Override
	public ScheduleDto scheduledetail(int schedule_id) {
		// 일정상세보기 : select문, 결과: ScheduleDto, 파라미터 : schedule_id
		ScheduleDto dto = session.selectOne(NS + "scheduledetail", schedule_id);
		return dto;
	}

	@Override
	public boolean scheduleupdate(ScheduleDto dto) {
		// 일정 변경 : update문, 파라미터 : dto
		logger.info("scheduleupdate 일정변경 : {}", dto);
		int cnt = session.update(NS + "scheduleupdate", dto);
		return cnt > 0 ? true : false;
	}

	@Override
	public boolean scheduledelete(String[] schedule_id) {
		// 일정 삭제 (여러개/한개 삭제)
		logger.info("scheduledelete 삭제(delete) : {}", schedule_id);
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("schedule_ids", schedule_id);
		int cnt = session.delete(NS + "scheduledeflag", map);
		return cnt > 0 ? true : false;
	}

	@Override
	public int schedulecount(String schedule_id, String yyyyMMdd) {
		// 일정의 개수 조회 : select문, 파라미터 : schedule_id, yyyyMMdd
		logger.info("schedulecount 개수(count) : {}", schedule_id, yyyyMMdd);
		Map<String, String> map = new HashMap<String, String>();
		map.put("schedule_id", schedule_id);
		map.put("yyyyMMdd", yyyyMMdd);
		int cnt = session.selectOne(NS + "schedulecount", map);
		return cnt;
	}

	

}