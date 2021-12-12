package com.mozzle.web.ctrl.users;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.mozzle.web.comm.JwtTokenProvider;
import com.mozzle.web.dto.users.UserDto;
import com.mozzle.web.service.users.IUserService;

@Controller
@SessionAttributes("userId")
public class LoginController {

	@Autowired
	IUserService service;

	@Autowired
	private JwtTokenProvider jwtTokenProvider;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		return "index";
	}

	// 로그인 페이지로 가는 매핑
	@RequestMapping(value = "/loginPage.do", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Authentication user, Model model,
			SessionStatus session) {
		if (error != null) {
			model.addAttribute("msg", "로그인 에러");
		}

		if (logout != null) {
			model.addAttribute("msg", "로그아웃 성공");
			session.setComplete();
		}

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
			return "forward:/";
		}
		return "user/login";
	}
	
	@RequestMapping(value = "/logout.do", method=RequestMethod.GET)
	public String logout() {
		System.out.println("adfadfadff");
		return "redirect:/loginPage.do?logout";
	}

	// 회원가입으로 가는 매핑
	@RequestMapping(value = "/registerPage.do", method = RequestMethod.GET)
	public String SignUpgo() {
		return "user/register";
	}

	// 회원가입 성공 매핑
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String maingo(UserDto dto, Model model) {
		System.out.println("회원가입 정보" + dto.toString());
		System.out.println(dto.getUser_pw().equals(""));
		String pw = dto.getUser_pw();
		if(service.signUp(dto)) {
			return "redirect:/";
		}
		else {
			return "login";
		}
	}

	// 중복 로그인
	@RequestMapping(value = "/duplicateLogin.do", method = RequestMethod.GET)
	public String duplicateLogin() {
		return "duplicateLogin";
	}


}
