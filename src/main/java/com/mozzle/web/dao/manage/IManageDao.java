package com.mozzle.web.dao.manage;

import java.util.List;

import com.mozzle.web.dto.manage.MozzleDto;

public interface IManageDao {
	
	public String createMozzleId();
	
	public int registMozzle(MozzleDto mozzle);
	
	public int mozzleNameCheck(String mozzle_name);
	
	public int updateMozzle(MozzleDto mozzle); 
	
	public List<MozzleDto> selectMozzleByCreatDate();
	
	public MozzleDto selectMozzleByMozzleId(String mozzle_id);
	
	public List<MozzleDto> selectMozzleByUserNumber();
	
	public String searchLeaderNickname(String mozzle_id);
	
	public List<MozzleDto> selectMyMozzle(String user_id);
	
	public int selectUserNum(String mozzle_id);
	
	public List<MozzleDto> selectMozzleBySearchBasedOnImportance(String keyword);
	
	public List<MozzleDto> selectMozzleBySearchFromTheLastest(String keyword);
	
	public String[] selectCategory();
	
	public String selectMozzleIdByMozzleName(String mozzleName);
	
	public int registLeader(MozzleDto mozzle);
}
