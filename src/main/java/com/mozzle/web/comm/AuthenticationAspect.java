package com.mozzle.web.comm;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public class AuthenticationAspect {
	public void before(JoinPoint j) {
		Logger log = LoggerFactory.getLogger(j.getTarget() + "");
		System.out.println("로그인 확인 :ㅈ대롲ㄷ로ㅕㅈ도ㅕ랴ㅗㅕㅈㄷ로");
		UserDetails userdto = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Object[] arg =  j.getArgs();
		if(arg != null) {
			log.debug("method 명: " + j.getSignature().getName());
			for (int i = 0; i < arg.length; i++) {
				log.debug(i+"번째: \t" + arg[i]);
			}
			log.debug("method 명: " + j.getSignature().getName());
		}
	}
}
