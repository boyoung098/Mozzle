package com.mozzle.web.ctrl.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mozzle.web.dto.users.UserDto;
import com.mozzle.web.service.users.IUserService;

@Controller
@RequestMapping(value = "/form")
public class FormController {
	
	@Autowired
	private IUserService service;
	
	@RequestMapping(value="/findId.do", method=RequestMethod.GET)
	public String findId() {
	
		return "user/form/findIdForm";
	}
	
	@RequestMapping(value="/resetPw.do", method=RequestMethod.GET)
	public String resetPw() {
	
		return "user/form/resetPwForm";
	}
	
	@RequestMapping(value="/findIdResult.do", method=RequestMethod.POST)
	public String findIdResult(UserDto dto, Model model) {
		System.out.println(dto);
		String findId = service.findId(dto);
		if (findId != null) {
			model.addAttribute("findId", findId);
		}
		model.addAttribute("message", "찾으시는 아이디의 회원이 존재하지 않습니다.");
		return "user/form/findIdResult";
	}
	
	@RequestMapping(value="/resetPwInput.do", method=RequestMethod.POST)
	public String resetPwInput() {
		return "user/form/resetPwInput";
	}
	

}
