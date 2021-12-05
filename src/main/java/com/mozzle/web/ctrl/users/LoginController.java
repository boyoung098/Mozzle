package com.mozzle.web.ctrl.users;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mozzle.web.comm.JwtTokenProvider;
import com.mozzle.web.dto.users.UserDto;
import com.mozzle.web.service.users.Login_IService;



@Controller
public class LoginController {

	@Autowired
	Login_IService service;
	
	@Autowired
	private JwtTokenProvider jwtTokenProvider;

	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String home() {
		
		return "home";
	}

	// 로그인 페이지로 가는 매핑
	@RequestMapping(value = "/loginPage.do", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Authentication user, Model model, HttpServletRequest req) {
		

		if (error != null) {
			model.addAttribute("msg", "로그인 에러");
		}

		if (logout != null) {
			model.addAttribute("msg", "로그아웃 성공");
		}
		
		if(user != null) {
			return "redirect:/result.do";
		}
		return "login";
	}



	//로그인 완료 후 메인 페이지로 가는 매핑
	@RequestMapping(value = "/result.do", method = RequestMethod.GET)
	public String maingo(Authentication user, Model model) {
		UserDetails userdto = (UserDetails) user.getPrincipal();
		// 사용자에게 토큰 발급
		if(userdto != null) {
			String accessToken = jwtTokenProvider.createJwtAccessToken(userdto.getUsername());
			String refreshToken = jwtTokenProvider.createJwtRefreshToken(userdto.getUsername());
			
			model.addAttribute("accessToken", accessToken);
			model.addAttribute("refreshToken", refreshToken);
			System.out.println("sdfsdfsdf");
		}
		model.addAttribute("user", userdto.toString());
		model.addAttribute("userid", userdto.getUsername());
		return "main";
	}


	//회원가입으로 가는 매핑
	@RequestMapping(value = "/singUpgo.do", method = RequestMethod.GET)
	public String SignUpgo() {
		return "SignUp";
	}


	// 회원가입 성공 매핑
	@RequestMapping(value = "/singUpSc.do", method = RequestMethod.POST)
	public String maingo(UserDto dto, Model model) {
		System.out.println("회원가입 정보"+dto.toString());
		service.signUp(dto);
		return "login";
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout() {
		return "redirect:/logingo.do";
	}
	
	// 중복 로그인
	@RequestMapping(value = "/duplicateLogin.do", method = RequestMethod.GET)
	public String duplicateLogin() {
		return "duplicateLogin";
	}
	
	@RequestMapping(value = "/user/userPage.do", method = RequestMethod.POST)
	public String userPage() {
		return null;
	}
	


}
