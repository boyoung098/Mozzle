package com.mozzle.web.ctrl.users;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String myPage(Authentication user, Model model, 
			@RequestParam(value = "auth") String auth) {
		// 로그인 상태인지 확인
		if (user != null) {
			UserDetails userdto = (UserDetails) user.getPrincipal();
			// 로그인 결과가 유효하다면
			if (userdto != null) {
				String accessToken = jwtTokenProvider.createJwtAccessToken(userdto.getUsername());
				String refreshToken = jwtTokenProvider.createJwtRefreshToken(userdto.getUsername());
				System.out.println(userdto.getUsername());
				model.addAttribute("userId", userdto.getUsername());
				model.addAttribute("accessToken", accessToken);
				model.addAttribute("refreshToken", refreshToken);
			}
		}
		
		if(auth != null) {
			System.out.println("비밀번호 입력");
		}
		model.addAttribute("auth", auth);
		return "user/myPage";
	}
	
	public Map<String, Boolean> passwordCheck(){
		
		return null;
	}

}
