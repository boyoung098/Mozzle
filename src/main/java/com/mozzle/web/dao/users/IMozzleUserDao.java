package com.mozzle.web.dao.users;

import java.util.List;
import java.util.Map;

import com.mozzle.web.dto.manage.MozzleDto;
import com.mozzle.web.dto.users.MozzleUserDto;

public interface IMozzleUserDao {

	public List<MozzleUserDto> selectListMozzleUser(Map<String, String> map);
	
	public int insertMozzleUser(MozzleUserDto dto);
	
	public MozzleUserDto selectMozzleUser(Map<String, String> map);
	
	
	public MozzleUserDto selectMozzleUserByUserId(Map<String, String> map);
	
	public int insertMozzleHost(MozzleDto dto);
	
	public int deleteMozzleUser(MozzleUserDto dto);
	
	public int updateMozzleUser(MozzleUserDto dto);
	
	public int updateMozzleUserAuth(MozzleUserDto dto);
	
	// 이종표 추가
	public List<Map<String, Object>> leaderCheck(String userId);
	
	public int deleteAllUserMozzleById(String userId);
	

	public int changeMozzleAuth(Map<String, String> map);

	public List<MozzleUserDto> selectListadminMozzleUser(Map<String, String> map);

	public MozzleUserDto selectmozzleUserLeader(String mozzle_id);
	
	public List<MozzleUserDto> selectListadminMozzleUser2(Map<String, String> map);
}
