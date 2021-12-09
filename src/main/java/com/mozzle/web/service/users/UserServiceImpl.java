package com.mozzle.web.service.users;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.mozzle.web.dao.users.IUserDao;
import com.mozzle.web.dto.users.UserDto;

@Service
public class UserServiceImpl implements IUserService{

	@Autowired
	private IUserDao dao;
	
	
	
	@Override
	public UserDto loginChk(String id) {
		UserDto dto = dao.loginChk(id);
		System.out.println("At Service sflgjfsoijgoijgoidsj : " + dto);
		return dao.loginChk(id);
	}

	@Override
	public boolean signUp(UserDto dto) {
		return dao.signUp(dto);
	}

	@Override
	public int duplicationIdChk(String id) {
		return dao.duplicationIdChk(id);
	}

}
