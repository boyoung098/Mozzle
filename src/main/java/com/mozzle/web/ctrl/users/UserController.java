package com.mozzle.web.ctrl.users;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mozzle.web.comm.JwtTokenProvider;
import com.mozzle.web.dto.users.UserDto;
import com.mozzle.web.service.users.IUserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	IUserService service;

	@Autowired
	private JwtTokenProvider jwtTokenProvider;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value = "/myPage.do", method = RequestMethod.POST)
	public String myPage(Model model, @RequestParam(value = "auth") boolean auth, @RequestParam(value = "menu", required = false) String menu) {
		
		model.addAttribute("auth", auth);
		model.addAttribute("menu", menu);
		return "user/mypage/myPage";
	}
	
	@RequestMapping(value="/myPageAuth.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> passwordCheck(HttpServletRequest req, String passwordChk){
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		HttpSession session = req.getSession();
		System.out.println(passwordChk);
		System.out.println(service);
		boolean checked = service.passwordChk(session.getAttribute("userId").toString(), passwordChk);
		map.put("result", checked);
		return map;
	}
	
	@RequestMapping(value="/updateUser.do", method=RequestMethod.GET)
	public String updateUser(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		model.addAttribute("userDto", service.getUserInfo(session.getAttribute("userId").toString()));
		return "user/mypage/updateUser";
	}
	
	@RequestMapping(value = "/updateUserInfo.do", method=RequestMethod.POST)
	public String updateUserInfo(UserDto dto) {
		System.out.println(dto);
		return "forward:/";
	}
	
	@RequestMapping(value="/myThread.do", method=RequestMethod.GET)
	public String myThread() {
		
		return "user/mypage/myThread";
	}
	
	@RequestMapping(value="/bookmark.do", method=RequestMethod.GET)
	public String bookmark() {
		
		return "user/mypage/bookmark";
	}
	
	@RequestMapping(value="/inviteUser.do", method=RequestMethod.GET)
	public String inviteUser() {
		
		return "user/mypage/inviteUser";																																															
	}

}
