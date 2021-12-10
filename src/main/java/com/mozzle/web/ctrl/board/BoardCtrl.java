package com.mozzle.web.ctrl.board;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mozzle.web.dto.board.Board;
import com.mozzle.web.service.board.IBoardService;

@Controller
public class BoardCtrl {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IBoardService serviceImple;
	
	@RequestMapping(value="/home.do", method = RequestMethod.GET)
	public String boardList(Model model) {
		logger.info("모즐메인 게시판");
		List<Board> boardlist = serviceImple.selectAllBoard();
		model.addAttribute("boardlist",boardlist);
		return "view/home";
	}
}
