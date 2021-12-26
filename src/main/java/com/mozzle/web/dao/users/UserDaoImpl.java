package com.mozzle.web.dao.users;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.mozzle.web.dto.users.UserDto;

@Repository
public class UserDaoImpl implements IUserDao{

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	private final String NS = "com.mozzle.web.Users.";
	
	
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

	@Override
	public int duplicationIdChk(String id) {
		return session.selectOne(NS + "duplicationIdChk", id);
	}
	
	@Override
	public int duplicationMailChk(String mail) {
		return session.selectOne(NS + "duplicationMailChk", mail);
	}

	@Override
	public boolean passwordChk(String id, String comparePw) {
		String passwordEncoded = session.selectOne(NS + "passwordChk", id);
		System.out.println(passwordEncoder);
		System.out.println(passwordEncoder.matches(comparePw, passwordEncoded));
		return passwordEncoder.matches(comparePw, passwordEncoded);
	}

	@Override
	public UserDto getUserInfo(String id) {
		return session.selectOne(NS + "getUserInfo", id);
	}

	@Override
	public String findId(UserDto dto) {
		return session.selectOne(NS + "findId", dto);
	}

	@Override
	public int findPw(UserDto dto) {
		return session.selectOne(NS + "findPw", dto);
	}

	@Override
	public boolean changePw(UserDto dto) {
		dto.setUser_pw(passwordEncoder.encode(dto.getUser_pw()));
		int cnt = session.update(NS + "changePw", dto);
		return cnt > 0 ? true : false;
	}

	@Override
	public int updateUser(UserDto dto) {
		if(!dto.getUser_pw().isEmpty()) {
			dto.setUser_pw(passwordEncoder.encode(dto.getUser_pw()));
		}
		return session.update(NS + "updateUser", dto);
	}

	@Override
	public int delflagUser(String id) {
		return session.update(NS + "delflagUser", id);
	}

}
