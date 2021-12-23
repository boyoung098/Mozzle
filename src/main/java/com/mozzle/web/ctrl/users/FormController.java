package com.mozzle.web.ctrl.users;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mozzle.web.dto.users.UserDto;
import com.mozzle.web.service.users.IUserService;
import com.mozzle.web.service.users.MailSendService;

@Controller
@RequestMapping(value = "/form")
public class FormController {
	
	@Autowired
	private IUserService service;
	
	@Autowired
	private MailSendService mailService;
	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 아이디 찾기 회원 정보 입력(이메일, 이름)
	@RequestMapping(value="/findId.do", method=RequestMethod.GET)
	public String findId() {
	
		return "user/form/findIdForm";
	}
	
	// 비밀번호 찾기 회원 정보 입력(아이디, 이메일, 이름)
	@RequestMapping(value="/resetPw.do", method=RequestMethod.GET)
	public String resetPw() {
	
		return "user/form/resetPwForm";
	}
	
	// 아이디 찾기 결과 창
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
	
	// 비밀번호 찾기 입력 정보가 DB에 있는지 체크
	@ResponseBody
	@RequestMapping(value="/resetPwAuth.do", method=RequestMethod.POST)
	public Map<String, Integer> resetPwAuth(UserDto dto) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int cnt = service.findPw(dto);
		
		map.put("cnt", cnt);
		
		return map;
	}
	
	// 비밀번호 찾기 인증 코드 입력 창
	@RequestMapping(value="/resetPwMail.do", method=RequestMethod.POST)
	public String resetPwMail(UserDto dto, HttpServletRequest req) {
		HttpSession session = req.getSession();
	
		if(session.getAttribute("authCode") != null) {
			session.removeAttribute("authCode");
		}

		
		String authCode = mailService.sendAuthMail(dto.getEmail());
		System.out.println("인증 코드 : " + authCode);
		System.out.println(dto.getUser_id());
		req.setAttribute("findPw_Id", dto.getUser_id());
		session.setAttribute("authCode", authCode);
		
		return "user/form/resetPwAuth";
	}
	
	// 사용자가 입력한 인증번호 체크
	@ResponseBody
	@RequestMapping(value="/authCodeChk.do", method=RequestMethod.POST)
	public Map<String, Boolean> authCodeChk(HttpServletRequest req, String code) {
		HttpSession session = req.getSession();
		String authCode = session.getAttribute("authCode").toString();
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		map.put("authChk", code.equals(authCode));
		
		return map;
	}
	
	// 비밀번호 변경 form
	@RequestMapping(value="/passwordReset.do", method=RequestMethod.POST)
	public String passwordReset(HttpServletRequest req, HttpServletResponse res, String findPw_Id) {
		HttpSession session = req.getSession();
		//System.out.println(session.getAttribute("authCode").toString());
		System.out.println(findPw_Id);
		if(session.getAttribute("authCode") == null) {
			PrintWriter out;
			try {
				res.setContentType("text/html; charset=UTF-8");
				out = res.getWriter();
				out.println("<script>alert('올바른 접근이 아닙니다.'); self.close();</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		req.setAttribute("findPw_Id", findPw_Id);
		return "user/form/passwordReset";
	}
	
	// 비밀번호 변경
	@ResponseBody
	@RequestMapping(value="/updatePassword.do", method=RequestMethod.POST)
	public Map<String, Boolean> updatePassword(UserDto dto) {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("changed", service.changePw(dto));
		return map;
	}
	
	// 회원가입 이메일 인증 form
	@RequestMapping(value="/mailAuth.do", method=RequestMethod.GET)
	public String mailAuth(HttpServletRequest req, String email) {
		HttpSession session = req.getSession();
		
		if(session.getAttribute("authCode") != null) {
			session.removeAttribute("authCode");
		}

		
		String authCode = mailService.sendAuthMail(email);
		System.out.println("인증 코드 : " + authCode);
		session.setAttribute("authCode", authCode);
		req.setAttribute("email", email);
		return "user/form/mailAuth";
	}
	
	@ResponseBody
	@RequestMapping(value="/mailCheck.do", method=RequestMethod.POST)
	public Map<String, Boolean> mailCheck(HttpServletRequest req, String code) {
		HttpSession session = req.getSession();
		String authCode = session.getAttribute("authCode").toString();
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		map.put("equals", code.equals(authCode));
		
		return map;
	}

}
