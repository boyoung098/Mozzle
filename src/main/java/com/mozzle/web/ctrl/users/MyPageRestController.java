package com.mozzle.web.ctrl.users;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mozzle.web.dto.users.UserDto;
import com.mozzle.web.service.users.IUserService;

@RestController
@RequestMapping(value="/user/myPage")
public class MyPageRestController {
	
	@Autowired
	private IUserService service;

	@RequestMapping(value="/userInfo.do", method=RequestMethod.POST)
	public UserDto getUserInfo(String id){
		UserDto dto = service.getUserInfo(id);
		
		return dto;
	}
	
}
