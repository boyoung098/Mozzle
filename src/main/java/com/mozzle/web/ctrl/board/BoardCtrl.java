package com.mozzle.web.ctrl.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String insertBoard(Board board, HttpServletResponse resp) throws IOException {
		int cnt = serviceImple.insertBoard(board);
		if(cnt == 1) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('성공적으로 새글이 입력되었습니다'); location.href='./board.do';</script>");
			out.flush();
			return "board";
		}else {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('새글 입력 실패'); location.href='./board.do';</script>");
			out.flush();
			return "board";
		}
		
	}
	
	
	
	@RequestMapping(value="/reinboard.do")
	@ResponseBody
	public String replyBoard(@ModelAttribute("board") Board board, HttpSession session, HttpServletRequest req) {
			logger.info("댓글 등록!!!!!!!!!!!!!!!!!!!!!!!!");
			UserDto user = (UserDto) session.getAttribute("user_id");
			
			board.setUser_id(user.getUser_id());
			serviceImple.reply(board);
			return "redirect:/board";
		
	}
	
	@RequestMapping(value="/reviewboard.do")
	@ResponseBody
	public ResponseEntity replyviewBoard(@ModelAttribute("board") Board board, HttpServletRequest req) {
		logger.info("댓글 보이기");
		HttpHeaders header = new HttpHeaders();
		ArrayList<HashMap> relist = new ArrayList<HashMap>();
		
		List<Board> boardvo = serviceImple.replyview(board);
		if(boardvo.size()>0){
			for (int i = 0; i < boardvo.size(); i++) {
				HashMap hm = new HashMap();
				hm.put("content", boardvo.get(i).getContent());
				
				relist.add(hm);
			}
		}
		JSONArray json = new JSONArray(relist);
		return new ResponseEntity(json.toString(), header, HttpStatus.CREATED);
	}
	
}
