package com.mozzle.web.ctrl.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mozzle.web.dto.board.Board;
import com.mozzle.web.dto.manage.MozzleDto;
import com.mozzle.web.service.board.IBoardService;

@RestController
public class SearchBoardCtrl {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IBoardService serviceImple;
	
	
	@ResponseBody
	@RequestMapping(value="/searchBoard.do", produces = "application/json; charset=UTF-8",  method = RequestMethod.POST)
	public String searchBoard(HttpServletRequest request, HttpSession session, Model model) {
		
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("keyword", keyword);
		
		String bkeyword = request.getParameter("bkeyword");
		logger.info("BrowserController의 searchMozzleByWord {}" , bkeyword);
		List<Board> searchboardlist = serviceImple.selectOneBoard(bkeyword); 
		model.addAttribute("searchboardlist",searchboardlist);
		session.setAttribute("bkeyword", bkeyword);
		return "mozzle/board";

	}
	

}
