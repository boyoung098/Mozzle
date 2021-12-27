package com.mozzle.web.service.users;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.mozzle.web.dao.users.IMozzleUserDao;
import com.mozzle.web.dao.users.IUserDao;
import com.mozzle.web.dto.users.UserDto;

@Service
public class UserServiceImpl implements IUserService{

	@Autowired
	private IUserDao dao;
	
	@Autowired
	private IMozzleUserDao mudao;
	
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
	
	@Override
	public int duplicationMailChk(String mail) {
		return dao.duplicationMailChk(mail);
	}

	@Override
	public boolean passwordChk(String id, String comparePw) {
		return dao.passwordChk(id, comparePw);
	}

	@Override
	public UserDto getUserInfo(String id) {
		return dao.getUserInfo(id);
	}

	@Override
	public String findId(UserDto dto) {
		return dao.findId(dto);
	}

	@Override
	public int findPw(UserDto dto) {
		return dao.findPw(dto);
	}

	@Override
	public boolean changePw(UserDto dto) {
		return dao.changePw(dto);
	}

	@Override
	public int updateUser(UserDto dto) {
		return dao.updateUser(dto);
	}

	@Override
	public int delflagUser(String id) {
		mudao.deleteAllUserMozzleById(id);
		return dao.delflagUser(id);
	}

}
