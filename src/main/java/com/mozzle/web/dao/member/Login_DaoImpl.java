package com.mozzle.web.dao.member;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.mozzle.web.dto.member.MemberDto;

@Repository
public class Login_DaoImpl implements Login_IDao{

	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	private final String NS = "com.min.login.";
	
	
	@Override
	public MemberDto loginChk(String id) {
		return session.selectOne(NS+"loginChk", id);
	}

	@Override
	public boolean signUp(MemberDto dto) {
		dto.setUserPw(passwordEncoder.encode(dto.getUserPw()));
		return session.insert(NS+"signUp", dto) > 0 ? true : false;
	}

}
