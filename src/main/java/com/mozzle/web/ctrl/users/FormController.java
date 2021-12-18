package com.mozzle.web.ctrl.users;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/form")
public class FormController {
	
	@RequestMapping(value="findId.do", method=RequestMethod.GET)
	public String findId() {
	
		return "user/form/findIdForm";
	}
	
	@RequestMapping(value="resetPw.do", method=RequestMethod.GET)
	public String resetPw() {
	
		return "user/form/resetPwForm";
	}

}
