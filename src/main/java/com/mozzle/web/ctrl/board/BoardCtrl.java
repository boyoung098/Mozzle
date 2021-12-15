package com.mozzle.web.ctrl.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import java.io.PrintWriter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mozzle.web.dto.board.Board;
import com.mozzle.web.dto.users.UserDto;
import com.mozzle.web.service.board.IBoardService;

@Controller
public class BoardCtrl {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IBoardService serviceImple;
	
	@RequestMapping(value="/board.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardList(Model model) {
		logger.info("모즐메인 게시판");
		//List<Board> boardlist = serviceImple.selectAllBoard();
		model.addAttribute("boardlist", serviceImple.selectAllBoard());
		return "board";
	}
	
	@PostMapping(value="/insertBoard.do")
	public String insertBoard(Board board){
		logger.info("insertBoard 입력됨????=================== {}", board);
		serviceImple.insertBoard(board);
		return "redirect:/board";
	}
	
	@PostMapping(value="/updateboard.do")
	public String updateboard(Board board, RedirectAttributes rttr) {
		logger.info("updateboard 수정되었습니다. {}", board);
		serviceImple.updateBoard(board);
		rttr.addFlashAttribute("update","update");
		return "redirect:/board";
	}
	
	
	
	@RequestMapping(value="/deleteBoard.do")
	public String deleteBoard(int num, RedirectAttributes rttr) {
		logger.info("게시글 삭제");
		serviceImple.deleteBoard(num);
		rttr.addFlashAttribute("result", "delete success");
		return "redirect:/board";
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/reinboard.do", method=RequestMethod.POST)
	public Map<String, Object> replyBoard(@RequestBody Board board) {
			Map<String, Object> map = new HashMap<String, Object>();
			int cnt = serviceImple.replyview(board);
			
			logger.info("댓글 등록!!!!!!!!!!!!!!!!!!!!!!!! :{}", board);
			map.put("result", board);
			
			return map;
		
	}
	

	
}
