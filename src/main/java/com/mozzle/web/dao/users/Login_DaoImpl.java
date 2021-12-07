package com.mozzle.web.dao.users;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.mozzle.web.dto.users.UserDto;

@Repository
public class Login_DaoImpl implements Login_IDao{

	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	private final String NS = "com.min.login.";
	
	
	@Override
	public UserDto loginChk(String id) {
		UserDto dto = session.selectOne(NS+"loginChk", id);
		System.out.println("AT DAO : " + dto);
		return dto;
	}

	@Override
	public boolean signUp(UserDto dto) {
		dto.setUser_pw(passwordEncoder.encode(dto.getUser_pw()));
		return session.insert(NS+"signUp", dto) > 0 ? true : false;
	}

}
