package com.mozzle.web.dao.users;

import com.mozzle.web.dto.users.UserDto;

public interface IUserDao {

	
	public UserDto loginChk(String id);
	
	public boolean passwordChk(String id, String comparePw);

	public boolean signUp(UserDto dto);
	
	public int duplicationIdChk(String id);
	
	public UserDto selectUserById(String id);
}
