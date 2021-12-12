package com.mozzle.web.service.users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mozzle.web.dao.users.IGuestDao;
import com.mozzle.web.dto.users.GuestDto;

@Service
public class GuestServiceImpl implements IGuestService {

	@Autowired
	IGuestDao guestDao;
	
	@Override
	public GuestDto selectByUUID(String uuid) {
		
		return guestDao.selectByUUID(uuid);
	}

	@Override
	public List<GuestDto> selectGuest() {
		
		return guestDao.selectGuest();
	}

	@Override
	public int guestInsert(GuestDto dto) {
		
		return guestDao.guestInsert(dto);
	}

}
