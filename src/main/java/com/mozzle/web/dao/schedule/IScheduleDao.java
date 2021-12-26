package com.mozzle.web.dao.schedule;

import java.util.List;
import java.util.Map;

import com.mozzle.web.dto.schedule.ScheduleDto;
import com.mozzle.web.dto.schedule.ScheduleLocationInfoDto;

public interface IScheduleDao {
	
	/**
	 * selectinfoAll
	 * 지도 리스트
	 * @param location_code
	 * @return
	 */
	public List<ScheduleLocationInfoDto> scheduleinfoselectAll(String location_code);
	
	/**
	 * scheduleinfoinsert
	 * 지도값 등록
	 * @param dto2
	 * @return
	 */
	public boolean scheduleinfoinsert(ScheduleLocationInfoDto dto2);
	
	/**
	 * scheduleinfoupdate
	 * 지도 값 변경
	 * @param dto2
	 * @return
	 */
	public boolean scheduleinfoupdate(ScheduleLocationInfoDto dto2);
	
	/**
	 * 지도 상세 보기
	 * @param location_code
	 * @return
	 */
	public ScheduleLocationInfoDto scheduleinfodetail(int location_code);
	
	/**
	 * scheduleinfodelete
	 * 지도 값 삭제
	 * @param location_code
	 * @return
	 */
	public boolean scheduleinfodelete(String[] location_code);
	
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
