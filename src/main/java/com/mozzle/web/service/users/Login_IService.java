package com.mozzle.web.service.users;

import com.mozzle.web.dto.users.UserDto;

public interface Login_IService {


	public UserDto loginChk(String id);
	

	public boolean signUp(UserDto dto);
}
