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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mozzle.web.dto.board.MozzlePostDto;
import com.mozzle.web.service.board.IMozzlePostService;

@Controller
public class MozzlePostController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	IMozzlePostService service;
	
	@RequestMapping(value="/mozzlePost.do", method= RequestMethod.GET)
	public String selectMozzlePostByMozzleId(HttpServletRequest request, HttpSession session, Model model){
		
		String mozzle_id = request.getParameter("mozzle_id");
		
		logger.info("selectMozzlePostByMozzleId {}", mozzle_id);
		
		List<MozzlePostDto> postList = service.selectMozzlePostByMozzleId(mozzle_id);
		model.addAttribute("postList", postList);
		
		return "mozzle/mozzlePost";
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


}
