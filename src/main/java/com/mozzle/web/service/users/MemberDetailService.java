package com.mozzle.web.service.users;

import java.util.ArrayList;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;

import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.mozzle.web.dto.users.UserDto;

public class MemberDetailService implements UserDetailsService {

	@Autowired
	private Login_IService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		UserDto dto = service.loginChk(username);
		
		logger.info("addfaehuifeafuieahfiaeifheaif : " + dto);
		
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		
		UserDetails user = new User(username,dto.getUser_pw(),roles);

		return user;
	}
	
	

}
