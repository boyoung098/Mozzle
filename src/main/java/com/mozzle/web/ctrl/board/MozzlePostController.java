package com.mozzle.web.ctrl.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mozzle.web.dto.board.MozzlePostDto;
import com.mozzle.web.service.board.IMozzlePostService;

@Controller
public class MozzlePostController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	IMozzlePostService service;
	
	@RequestMapping(value="/mozzlePost.do", method= RequestMethod.GET)
	public String selectMozzlePostByMozzleId(HttpServletRequest request, Model model){
		
		String mozzle_id = request.getParameter("mozzle_id");
		
		logger.info("selectMozzlePostByMozzleId {}", mozzle_id);
		List<MozzlePostDto> postList = service.selectMozzlePostByMozzleId(mozzle_id);
		model.addAttribute("postList", postList);
		
		return "mozzle/mozzlePost";
	}


}
