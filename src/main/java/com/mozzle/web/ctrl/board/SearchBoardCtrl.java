package com.mozzle.web.ctrl.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mozzle.web.dto.board.Board;
import com.mozzle.web.service.board.IBoardService;

@RestController
public class SearchBoardCtrl {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IBoardService serviceImple;
	
	
	@ResponseBody
	@RequestMapping(value="/searchBoard.do", method = RequestMethod.POST)
	public Map<String,Object> searchBoard(HttpServletRequest request, HttpSession session, Model model) {
		String bkeyword = request.getParameter("data");
		logger.info("searchBoard 들어갔나----------------------------------  {}" , bkeyword);
		
		List<Board> boardlist = new ArrayList<Board>();
		if(serviceImple.selectSearchBoard(bkeyword) != null) {
			boardlist = serviceImple.selectSearchBoard(bkeyword);
		}
		
		Map<String,Object> returnmap = new HashMap<String,Object>();
		returnmap.put("searchResult", new String("1"));
		returnmap.put("boardlist", boardlist);
		return returnmap;
	}
	

}
