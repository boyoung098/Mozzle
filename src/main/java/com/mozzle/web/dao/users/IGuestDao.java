package com.mozzle.web.dao.users;

import java.util.List;

import com.mozzle.web.dto.users.GuestDto;

public interface IGuestDao {

	public GuestDto selectByUUID(String uuid);
	public List<GuestDto> selectGuest();
	public int guestInsert(GuestDto guestDto);
}
