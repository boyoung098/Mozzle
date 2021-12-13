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

}
