package com.mozzle.web.ctrl.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mozzle.web.dto.board.MozzlePostDto;
import com.mozzle.web.dto.users.MozzleUserDto;
import com.mozzle.web.service.board.IMozzlePostService;
import com.mozzle.web.service.users.IMozzleUserService;

@Controller
public class MozzlePostController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	IMozzlePostService service;
	
	@Autowired
	private IMozzleUserService mozzleUserService;
	
	@RequestMapping(value="/mozzlePost.do", method= RequestMethod.GET)
	public String selectMozzlePostByMozzleId(HttpServletRequest request, 
				HttpSession session, Model model){
		
		String mozzle_id = request.getParameter("mozzle_id");
		
		logger.info("selectMozzlePostByMozzleId {}", mozzle_id);
		
		List<MozzlePostDto> postList = service.selectMozzlePostByMozzleId(mozzle_id);
		model.addAttribute("postList", postList);
		model.addAttribute("mozzle_id", mozzle_id);
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id", mozzle_id);
		
		String sessionid = (String)request.getSession().getAttribute("userId");
		System.out.println("============================="+sessionid);
		
		if(sessionid!=null) {
		map.put("user_id", sessionid);
		MozzleUserDto mozzleUserdto = mozzleUserService.selectMozzleUserByUserId(map);
		model.addAttribute("mozzleUserdto",mozzleUserdto);
		}
		
		return "mozzle/mozzlePost";
	}
	
	@RequestMapping(value="/selectMyMozzlePost.do", method= RequestMethod.GET)
	public String selectMyMozzlePost(HttpServletRequest request, 
			HttpSession session, Model model) {
		
		String mozzle_id = request.getParameter("mozzle_id");
		logger.info("selectMyMozzlePost {}", mozzle_id);
		
		String user_id = (String)session.getAttribute("userId");
		logger.info("session에서 받아온 user_id 값 {}", user_id);
		
		MozzlePostDto post = new MozzlePostDto();
		post.setMozzle_id(mozzle_id);
		post.setUser_id(user_id);
		
		List<MozzlePostDto> postList = service.selectMyMozzlePost(post);
		model.addAttribute("postList", postList);
		model.addAttribute("mozzle_id", mozzle_id);
		
		return "mozzle/mozzlePost";
	}
	
	@RequestMapping(value="/searchMozzlePost.do", method= RequestMethod.POST)
	public String searchMozzlePost(HttpServletRequest request, 
			HttpSession session, Model model) {
		
		String mozzle_id = request.getParameter("mozzle_id");
		logger.info("searchMozzlePost {}", mozzle_id);
		
		String user_id = (String)session.getAttribute("userId");
		logger.info("session에서 받아온 user_id 값 {}", user_id);
		
		String keyword = request.getParameter("keyword");
		logger.info("request에서 받아온 keyword 값 {}", keyword);
		
		MozzlePostDto post = new MozzlePostDto();
		post.setMozzle_id(mozzle_id);
		post.setUser_id(user_id);
		post.setKeyword(keyword);
		
		List<MozzlePostDto> postList = service.searchMozzlePost(post);
		model.addAttribute("postList", postList);
		model.addAttribute("mozzle_id", mozzle_id);
		
		return "redirect:/firstmozzle.do";
	}
	
	
	@RequestMapping(value = "/insertMozzlePost.do", method= RequestMethod.POST)
	@ResponseBody
	public boolean insertMozzlePost(@RequestParam("content") String content,
			@RequestParam("mozzle_id") String mozzle_id, HttpSession session) {
		
		logger.info("insertMozzlePost에 입력되는 값 {}", content);
		
		String user_id = (String)session.getAttribute("userId");
		logger.info("session에서 받아온 user_id 값 {}", user_id);
		
		MozzlePostDto post = new MozzlePostDto();
		post.setMozzle_id(mozzle_id);
		post.setUser_id(user_id);
		post.setContent(content);
		
		boolean result = service.insertMozzlePost(post);

		return result;
	}
	
	
	@RequestMapping(value="/replyShow.do", method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectMozzleReplyByRefer(HttpServletRequest request, HttpSession session, Model model){
		
		int refer = Integer.parseInt(request.getParameter("refer"));
		
		logger.info("selectMozzleReplyByRefer에 입력되는 값 {}", refer);
		List<MozzlePostDto> replyList = service.selectMozzleReplyByRefer(refer);
		
		logger.info("selectMozzleReplyByRefer에 출력되는 값 {}", replyList);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isc", true);
		map.put("replyList", replyList);
		
		return map;
	}
	
	
	@RequestMapping(value = "/replyIn.do", method= RequestMethod.POST)
	@ResponseBody
	public boolean replyIn(@RequestParam("post_id") String post_id, 
			@RequestParam("content") String content,
			@RequestParam("mozzle_id") String mozzle_id, HttpSession session) {
		
		logger.info("replyIn에 입력되는 값 {}", content);
		
		String user_id = (String)session.getAttribute("userId");
		logger.info("session에서 받아온 user_id 값 {}", user_id);
		
		MozzlePostDto post = new MozzlePostDto();
		post.setPost_id(post_id);
		post.setMozzle_id(mozzle_id);
		post.setUser_id(user_id);
		post.setContent(content);
		
		boolean result = service.replyIn(post);

		logger.info("################ replyIn Result : " + result);
		
		return result;
	}
	
	@RequestMapping(value="/deleteMozzlePost.do", method= RequestMethod.GET)
	@ResponseBody
	public boolean deleteMozzlePost(@RequestParam("post_id") String post_id) {
		
		logger.info("deleteMozzlePost에 입력되는 값 {}", post_id);
		
		boolean result = service.deleteMozzlePost(post_id);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public boolean updateMozzlePost(@RequestParam("content") String content,
			@RequestParam("mozzle_id") String mozzle_id, HttpSession session) {
		
		
		logger.info("updateMozzlePost에 입력되는 값 {}", content);
		
		String user_id = (String)session.getAttribute("userId");
		logger.info("session에서 받아온 user_id 값 {}", user_id);
		
		MozzlePostDto post = new MozzlePostDto();
		post.setMozzle_id(mozzle_id);
		post.setContent(content);
		boolean n = service.updateMozzlePost(post);
		return n;
	}
}
