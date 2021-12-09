package com.mozzle.web.dao.schedule;

import java.util.List;

import com.mozzle.web.dto.schedule.ScheduleDto;

public interface IScheduleDao {
	
	/**
	 * insert
	 * @param dto
	 * @return
	 */
	public int insertBoard(ScheduleDto dto);
	
	/**
	 * update
	 * @param dto
	 * @return
	 */
	public int updateBoard(ScheduleDto dto);
	
	/**
	 * selectAll
	 * @return
	 */
	public List<ScheduleDto> seletBoard();
	
}
