package com.mozzle.web.service.schedule;

import java.util.List;
import java.util.Map;

import com.mozzle.web.dto.schedule.ScheduleDto;

public interface IScheduleService {
	
	/**
	 * selectAll
	 * 일정리스트
	 * @param map
	 * @return
	 */
	public List<ScheduleDto> scheduleselectAll(Map<String, String> map);
	
	/**
	 * insert
	 * 일정등록
	 * @param dto
	 * @return
	 */
	public boolean scheduleinsert(ScheduleDto dto);
	
	
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
	public boolean scheduledelete(String schedule_id);
	
	
}
