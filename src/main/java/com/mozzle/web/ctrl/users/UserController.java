package com.mozzle.web.ctrl.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
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
import com.mozzle.web.dto.board.MozzlePostDto;
import com.mozzle.web.dto.manage.MozzleDto;
import com.mozzle.web.dto.users.UserDto;
import com.mozzle.web.service.board.IMozzlePostService;
import com.mozzle.web.service.manage.IManageService;
import com.mozzle.web.service.users.IMozzleUserService;
import com.mozzle.web.service.users.IUserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private IUserService service;
	
	@Autowired
	IMozzlePostService postService;

	@Autowired
	private IManageService mService;

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
		System.out.println(dto.getUser_pw().isEmpty());
		service.updateUser(dto);
		return "redirect:/";
	} 
	
	@RequestMapping(value="/myThread.do", method=RequestMethod.GET)
	public String myThread(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", session.getAttribute("userId").toString());
		List<Map<String, String>> posts = postService.selectMyPost(map);
		req.setAttribute("posts", posts);
		return "user/mypage/myThread";
	}
	
	@RequestMapping(value="/manageMozzle.do", method=RequestMethod.GET)
	public String bookmark(HttpServletRequest req) {
		HttpSession session = req.getSession();
		List<MozzleDto> myMozzleList = mService.selectAllMyMozzle(session.getAttribute("userId").toString());
		System.out.println(myMozzleList.size());
		req.setAttribute("myMozzleList", myMozzleList);
		return "user/mypage/manageMozzle";
	}
	
	@RequestMapping(value="/notification.do", method=RequestMethod.GET)
	public String inviteUser() {
		
		return "user/mypage/notification";																																															
	}
	
	@RequestMapping(value="/leaderList.do", method=RequestMethod.GET)
	public String leaderList(HttpServletRequest req) {
		HttpSession session = req.getSession();
		req.setAttribute("userId", session.getAttribute("userId").toString());
		
		return "user/mypage/leaderList";
	}
	
	@RequestMapping(value = "/delflagUser.do", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Boolean> delflagUser(String userId){
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		int n = service.delflagUser(userId);
		boolean result = n > 0 ? true : false;
		map.put("delflag", result);
		return map;
	}

}
