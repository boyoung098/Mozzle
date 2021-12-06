package com.mozzle.web.service.users;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.mozzle.web.dao.users.Login_IDao;
import com.mozzle.web.dto.users.UserDto;

@Service
public class Login_ServiceImpl implements Login_IService{

	@Autowired
	private Login_IDao dao;
	
	
	
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

}
