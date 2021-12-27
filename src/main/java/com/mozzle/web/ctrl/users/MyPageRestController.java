package com.mozzle.web.ctrl.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mozzle.web.dto.users.MozzleUserDto;
import com.mozzle.web.dto.users.UserDto;
import com.mozzle.web.service.manage.IManageService;
import com.mozzle.web.service.users.IMozzleUserService;
import com.mozzle.web.service.users.IUserService;

@RestController
@RequestMapping(value="/user/myPage")
public class MyPageRestController {
	
	@Autowired
	private IUserService service;
	
	@Autowired
	private IMozzleUserService muservice;
	
	@Autowired
	private IManageService mservice;

	@RequestMapping(value="/userInfo.do", method=RequestMethod.POST)
	public UserDto getUserInfo(String id){
		UserDto dto = service.getUserInfo(id);
		
		return dto;
	}
	
	@RequestMapping(value="/leaderCheck.do", method=RequestMethod.POST)
	public List<Map<String, Object>> leaderCheck(String userId){
		List<Map<String, Object>> lists = muservice.leaderCheck(userId);	
		return lists;
	}
	
	@RequestMapping(value="/deleteMozzle.do", method=RequestMethod.POST)
	public Map<String, Boolean> deleteMozzle(String mozzleId){
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("success", mservice.deleteMozzle(mozzleId));
		return map;
	}
}
