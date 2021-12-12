package com.mozzle.web.service.users;

import com.mozzle.web.dto.users.UserDto;

public interface IUserService {


	public UserDto loginChk(String id);
	
	public boolean passwordChk(String id, String comparePw);

	public boolean signUp(UserDto dto);
	
	public int duplicationIdChk(String id);
}
