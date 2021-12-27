package com.mozzle.web.dao.schedule;

import java.util.List;
import java.util.Map;

import com.mozzle.web.dto.schedule.ScheduleDto;
//import com.mozzle.web.dto.schedule.ScheduleLocationInfoDto;

public interface IScheduleDao {
	
	
	/**
	 * selectAll
	 * 일정리스트
	 * @param map
	 * @return
	 */
	public List<ScheduleDto> scheduleselectAll(String mozzle_id, String yyyyMMdd);
	
	/**
	 * insert
	 * 일정등록
	 * @param dto
	 * @return
	 */
	public boolean scheduleinsert(ScheduleDto dto);
	
	/**
	 * detail
	 * 상세보기
	 * @param schedule_id
	 * @return
	 */
	public ScheduleDto scheduledetail(int schedule_id);
	
	
	/**
	 * 일정 업데이트
	 * @param dto
	 * @return
	 */
	public boolean scheduleupdate(ScheduleDto dto);
	
	
	/**
	 * 일정 삭제
	 * @param schedule_id
	 * @return
	 */
	public boolean scheduledelete(String[] schedule_id);
	
	/**
	 * 일정 개수
	 * @param schedule_id
	 * @param yyyyMMdd
	 * @return
	 */
	public int schedulecount(String schedule_id, String yyyyMMdd);
}
