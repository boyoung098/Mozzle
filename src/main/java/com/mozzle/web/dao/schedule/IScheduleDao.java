package com.mozzle.web.dao.schedule;

import java.util.List;
import java.util.Map;

import com.mozzle.web.dto.schedule.ScheduleDto;

public interface IScheduleDao {
	
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
	public int scheduleinsert(ScheduleDto dto);
	
	/**
	 * 일정개수
	 * @param map
	 * @return
	 */
	public int schedulecount(Map<String, String> map);
	
	/**
	 * 일정리스트(몇개있는지)
	 * @param map
	 * @return
	 */
	public List<ScheduleDto> scheduleselectViewAll(Map<String,String> map);
	
	/**
	 * 일정상세보기
	 * @param schedule_id
	 * @return
	 */
	public ScheduleDto scheduleselectOne(String schedule_id);
	
	/**
	 * 일정 업데이트
	 * @param dto
	 * @return
	 */
	public int scheduleupdate(ScheduleDto dto);
	
	/**
	 * 일정 삭제
	 * @param schedule_id
	 * @return
	 */
	public int scheduledeflag(Map<String,String[]> schedule_id);
	
	/**
	 * 일정 삭제
	 * @param schedule_id
	 * @return
	 */
	public int scheduledelete(Map<String,String[]> schedule_id);
	
	
}
