package com.mozzle.web.ctrl.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mozzle.web.dto.users.MozzleUserDto;
import com.mozzle.web.service.users.IMozzleUserService;

@Controller
public class MozzleUserController {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IMozzleUserService mozzleUserService;
	
	@GetMapping(value="/mozzle/mozzleMove.do")
	public String mozzleMove(String mozzle_id, Model model) {
		log.info("이동할 mozzle_id는{}",mozzle_id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id", mozzle_id);
		List<MozzleUserDto> mozzleuserList = mozzleUserService.selectListMozzleUser(map);
		model.addAttribute("mozzleuserList",mozzleuserList);
		
		return "mozzle/board";
	}
	
	@RequestMapping(value="/mozzle/mozzleUserSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,List<MozzleUserDto> > mozzleUserSearch(String nickname){
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id", "1");
		map.put("nickname", nickname);
		List<MozzleUserDto> mozzleuserList = mozzleUserService.selectListMozzleUser(map);
		Map<String,List<MozzleUserDto>> returnmap = new HashMap<String,List<MozzleUserDto>>();
		returnmap.put("mozzleuserList", mozzleuserList);
		return returnmap;
	}
}
