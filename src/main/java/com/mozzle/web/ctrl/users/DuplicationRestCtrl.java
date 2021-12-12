package com.mozzle.web.ctrl.users;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mozzle.web.service.users.UserServiceImpl;

@RestController
@RequestMapping(value="/duplication")
public class DuplicationRestCtrl {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserServiceImpl service;
	
	@RequestMapping(value="/chkid.do", method=RequestMethod.POST)
	public Map<String, Boolean> chkid(String id){
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		int cnt = service.duplicationIdChk(id);
		logger.info("DuplicationChkController 입력 아이디 : {}", id);
		logger.info("DuplicationChkController 중복 아이디 갯수 : {}", cnt);
		
		boolean idchk = (cnt > 0) ? true : false;
		map.put("duplicated", idchk);
		
		return map;
	}
	
}
