package com.mozzle.web.service.manage;

import java.util.List;

import com.mozzle.web.dto.manage.MozzleDto;

public interface IManageService {
	
	public int registMozzle(MozzleDto mozzle);
	public List<MozzleDto> selectMozzleByCreatDate();
	public MozzleDto selectMozzleByMozzleId(String mozzle_id);
	public List<MozzleDto> selectMozzleByUserNumber();

}
