package com.mozzle.web.service.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mozzle.web.dao.users.IMozzleUserDao;
import com.mozzle.web.dto.users.MozzleUserDto;

@Service
public class MozzleUserServiceImpl implements IMozzleUserService {

	@Autowired
	IMozzleUserDao mozzleUserDao;
	
	@Override
	public List<MozzleUserDto> selectListMozzleUser(Map<String, String> map) {
		
		return mozzleUserDao.selectListMozzleUser(map);
	}

	@Override
	public int insertMozzleUser(MozzleUserDto dto) {
		
		return mozzleUserDao.insertMozzleUser(dto);
	}

	@Override
	public MozzleUserDto selectMozzleUser(Map<String, String> map) {
		
		return mozzleUserDao.selectMozzleUser(map);
	}

	@Override
	public MozzleUserDto selectMozzleUserByUserId(Map<String, String> map) {
		
		return mozzleUserDao.selectMozzleUserByUserId(map);
	}

	@Override
	public int updateMozzleUser(MozzleUserDto dto) {
		
		return mozzleUserDao.updateMozzleUser(dto);
	}

	@Override
	public int updateMozzleUserAuth(MozzleUserDto dto) {
		
		return mozzleUserDao.updateMozzleUserAuth(dto);
	}

	@Override
	public List<Map<String, Object>> leaderCheck(String userId) {
		return mozzleUserDao.leaderCheck(userId);
	}

	@Transactional
	@Override
	public boolean changeMozzleAuth(String leaderId, Map<String, String> newLeader) {
		Map<String, String> leaderMap = new HashMap<String, String>();
		leaderMap.put("user_id", leaderId);
		leaderMap.put("mozzle_id", newLeader.get("mozzle_id"));
		leaderMap.put("auth_code", "2");
		newLeader.put("auth_code", "1");
		int n = mozzleUserDao.changeMozzleAuth(leaderMap);
		int m = mozzleUserDao.changeMozzleAuth(newLeader);
		return (n + m == 2) ? true : false;
	}

	@Override
	public List<MozzleUserDto> selectListadminMozzleUser(Map<String, String> map){
		return mozzleUserDao.selectListadminMozzleUser(map);
	}

	@Override
	public MozzleUserDto selectmozzleUserLeader(String mozzle_id) {
		
		return mozzleUserDao.selectmozzleUserLeader(mozzle_id);
	}

	@Override
	public int deleteMozzleUser(MozzleUserDto dto) {
		// TODO Auto-generated method stub
		return mozzleUserDao.deleteMozzleUser(dto);
	}
	
	@Override
	public List<MozzleUserDto> selectListadminMozzleUser2(Map<String, String> map){
		return mozzleUserDao.selectListadminMozzleUser2(map);
	}

}
