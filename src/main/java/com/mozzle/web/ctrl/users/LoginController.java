package com.mozzle.web.ctrl.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.mozzle.web.comm.JwtTokenProvider;
import com.mozzle.web.dao.notice.INoticeDao;
import com.mozzle.web.dto.manage.MozzleDto;
import com.mozzle.web.dto.users.UserDto;
import com.mozzle.web.service.manage.IManageService;
import com.mozzle.web.service.notice.INoticeService;
import com.mozzle.web.service.users.IUserService;

@Controller
@SessionAttributes("userId")
public class LoginController {

	@Autowired
	IUserService service;
	
	@Autowired
	private IManageService mService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Authentication user, Model model) {
		if (user != null) {
			UserDetails userdto = (UserDetails) user.getPrincipal();
			// 로그인 결과가 유효하다면
			if (userdto != null) {
				if(userdto.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ADMIN"))) {
					System.out.println(userdto.getUsername());
					System.out.println(userdto.getAuthorities());
					model.addAttribute("userId", userdto.getUsername());
					return "forward:/adminIndex.do";
				}
				else if(userdto.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_USER"))) {
					System.out.println(userdto.getUsername());
					System.out.println(userdto.getAuthorities());
					model.addAttribute("userId", userdto.getUsername());
					List<MozzleDto> myMozzleList = mService.selectMyMozzle(userdto.getUsername());
					System.out.println(myMozzleList.size());
					model.addAttribute("myMozzleList", myMozzleList);
					
				}
				
			}	
		}
		

		//새로 생긴 모즐
		List<MozzleDto> newMozzleList = mService.selectMozzleByCreatDate();
		//HOT 모즐
		List<MozzleDto> hotMozzleList = mService.selectMozzleByUserNumber();

		model.addAttribute("newMozzleList", newMozzleList);
		model.addAttribute("hotMozzleList", hotMozzleList);
		
//		List<Map<String, Object>> lists =
//				nservice.noticeSelectAll("qkrekfthsus");
//		
//		for(Map<String, Object> m: lists) {
//			for( String key : m.keySet() ){
//	            System.out.println( String.format("키 : %s, 값 : %s", key, String.valueOf(m.get(key))));
//	        }
//		}
		return "index";
	}

	// 로그인 페이지로 가는 매핑
	@RequestMapping(value = "/loginPage.do", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Authentication user, Model model,
			SessionStatus session, HttpServletResponse res) {
		if (error != null) {
			model.addAttribute("msg", "로그인 에러");
		}

		if (logout != null) {
			model.addAttribute("msg", "로그아웃 성공");
			session.setComplete();

			Cookie kc = new Cookie("JSESSIONID", null); // choiceCookieName(쿠키 이름)에 대한 값을 null로 지정

			kc.setMaxAge(0); // 유효시간을 0으로 설정

			res.addCookie(kc); // 응답 헤더에 추가해서 없어지도록 함

		}
		

		if (user != null) {
			//"/adminIndex.do"
				UserDetails userdto = (UserDetails) user.getPrincipal();
				// 로그인 결과가 유효하다면
				if (userdto != null) {
					System.out.println(userdto.getUsername());
					System.out.println(userdto.getAuthorities());
					model.addAttribute("userId", userdto.getUsername());
				}
			return "forward:/";
		}
		return "user/login";
	}
	
	@RequestMapping(value = "/logout.do", method=RequestMethod.GET)
	public String logout() {
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
	
	@RequestMapping(value= "/AuthError.do")
	public String authError() {
		
		return "AuthError";
	}

	// 중복 로그인
	@RequestMapping(value = "/duplicateLogin.do", method = RequestMethod.GET)
	public String duplicateLogin(HttpServletResponse res) {
		Cookie kc = new Cookie("JSESSIONID", null); // choiceCookieName(쿠키 이름)에 대한 값을 null로 지정

		kc.setMaxAge(0); // 유효시간을 0으로 설정

		res.addCookie(kc); // 응답 헤더에 추가해서 없어지도록 함
		return "duplicateLogin";
	}

	
	@RequestMapping(value = "/header.do", method = RequestMethod.GET)
	public String header() {
		return "comm/header";
	}
	
	@RequestMapping(value = "/footer.do", method = RequestMethod.GET)
	public String footer() {
		return "comm/footer";
	}
	
	

}
