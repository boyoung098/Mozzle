package com.mozzle.web.service.users;

import java.util.List;
import java.util.Map;

import com.mozzle.web.dto.manage.MozzleDto;
import com.mozzle.web.dto.users.MozzleUserDto;

public interface IMozzleUserService {

	public List<MozzleUserDto> selectListMozzleUser(Map<String, String> map);
	public int insertMozzleUser(MozzleUserDto dto);
	public MozzleUserDto selectMozzleUser(Map<String, String> map);
	
	
	public MozzleUserDto selectMozzleUserByUserId(Map<String, String> map);
	
	
	//회원탈퇴부분은 아직 하지말고 나중에 다시 고려하기 -> 게시글같은부분 어떻게되는지
	//public int deleteMozzleUser(MozzleUserDto dto);
	
	public int updateMozzleUser(MozzleUserDto dto);
	
	public int updateMozzleUserAuth(MozzleUserDto dto);
	
	public List<Map<String, Object>> leaderCheck(String userId);
	

	public boolean changeMozzleAuth(String leaderId, Map<String, String> newLeader);

	public List<MozzleUserDto> selectListadminMozzleUser(Map<String, String> map);
	
	public MozzleUserDto selectmozzleUserLeader(String mozzle_id);
	
	public int deleteMozzleUser(MozzleUserDto dto);

	// USER SERVICE로 이동
	// public int deleteAllUserMozzleById(String userId);
	
	public List<MozzleUserDto> selectListadminMozzleUser2(Map<String, String> map);

}
