package com.mozzle.web.service.users;

import java.util.List;

import com.mozzle.web.dto.users.GuestDto;

public interface IGuestService {

	public GuestDto selectByUUID(String uuid);
	public List<GuestDto> selectGuest();
	public int guestInsert(GuestDto dto);
}
