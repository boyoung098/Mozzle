package com.mozzle.web.dao.users;

import com.mozzle.web.dto.users.UserDto;

public interface IUserDao {

	
	public UserDto loginChk(String id);
	
	public boolean passwordChk(String id, String comparePw);

	public boolean signUp(UserDto dto);
	
	public int duplicationIdChk(String id);
	
	public int duplicationMailChk(String mail);
	
	public UserDto getUserInfo(String id);
	
	public String findId(UserDto dto);
	
	public int findPw(UserDto dto);
	
	public boolean changePw(UserDto dto);
	
	public int updateUser(UserDto dto);
	
	public int delflagUser(String id);
}
