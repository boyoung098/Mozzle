package com.mozzle.web.comm;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class AuthenticationAspect {
	public void before(JoinPoint j) {
		Logger log = LoggerFactory.getLogger(j.getTarget() + "");
		System.out.println("로그인 확인 :gdfnlskda;lsfmkgb,lkdfdmj");
		//UserDetails userdto = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Object[] arg =  j.getArgs();
		System.out.println(arg == null);
		if(arg != null) {

			System.out.println("method 명: " + j.getSignature().getName());
			for (int i = 0; i < arg.length; i++) {
				System.out.println(i+"번째: \t" + arg[i]);
			}
		}
	}
}
