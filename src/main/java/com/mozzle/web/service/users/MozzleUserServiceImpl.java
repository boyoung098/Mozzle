package com.mozzle.web.service.users;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	
	

}
