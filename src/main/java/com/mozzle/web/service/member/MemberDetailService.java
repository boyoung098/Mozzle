package com.mozzle.web.service.member;

import java.util.ArrayList;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mozzle.web.dto.member.MemberDto;

@Service
public class MemberDetailService implements UserDetailsService {

	@Autowired
	private Login_IService service;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		MemberDto dto = service.loginChk(username);
	    if(dto == null){
	        throw new UsernameNotFoundException("User not authorized.");
	    }
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		
		roles.add(new SimpleGrantedAuthority("ROLE_User"));
		
		UserDetails user = new User(username,dto.getUserPw(),roles);

		return user;
	}
	
	

}
