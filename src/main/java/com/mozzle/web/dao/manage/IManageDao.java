package com.mozzle.web.dao.manage;

import java.util.List;

import com.mozzle.web.dto.manage.MozzleDto;

public interface IManageDao {
	
	public int registMozzle(MozzleDto mozzle);
	public List<MozzleDto> selectMozzleByCreatDate();
	public MozzleDto selectMozzleByMozzleId(String mozzle_id);
	
	
}
