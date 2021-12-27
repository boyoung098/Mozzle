package com.mozzle.web.service.schedule;

import java.util.List;
import java.util.Map;

import com.mozzle.web.dto.schedule.ScheduleDto;
//import com.mozzle.web.dto.schedule.ScheduleLocationInfoDto;

public interface IScheduleService {
	
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
	public ScheduleDto scheduledetail(String schedule_id);
	
	
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
	
	/**
	 * 일정에 리스트 보여주기
	 * @param schedule_id
	 * @param yyyyMM
	 * @return
	 */
	public List<ScheduleDto> scheduleselectViewAll(String schedule_id, String yyyyMM);
	
}
