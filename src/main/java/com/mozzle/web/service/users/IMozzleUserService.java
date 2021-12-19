package com.mozzle.web.service.users;

import java.util.List;
import java.util.Map;

import com.mozzle.web.dto.users.MozzleUserDto;

public interface IMozzleUserService {

	public List<MozzleUserDto> selectListMozzleUser(Map<String, String> map);
	public int insertMozzleUser(MozzleUserDto dto);
	public MozzleUserDto selectMozzleUser(Map<String, String> map);
}
