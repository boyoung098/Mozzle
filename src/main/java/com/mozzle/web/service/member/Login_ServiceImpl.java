package com.mozzle.web.service.member;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.mozzle.web.dao.member.Login_IDao;
import com.mozzle.web.dto.member.MemberDto;

@Service
public class Login_ServiceImpl implements Login_IService{

	@Autowired
	private Login_IDao dao;
	
	@Override
	public MemberDto loginChk(String id) {
		return dao.loginChk(id);
	}

	@Override
	public boolean signUp(MemberDto dto) {
		return dao.signUp(dto);
	}

}
