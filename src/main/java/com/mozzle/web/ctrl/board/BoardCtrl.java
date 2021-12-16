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
	public String insertBoard(Board board, HttpServletResponse resp) throws IOException {

		logger.info("insertBoard 입력됨????=================== {}", board);
		serviceImple.insertBoard(board);
		return "board";
		
		
		//		int cnt = serviceImple.insertBoard(board);
//		if(cnt == 1) {
//			resp.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = resp.getWriter();
//			out.println("<script>alert('성공적으로 새글이 입력되었습니다'); location.href='./board.do';</script>");
//			out.flush();
//			return "board";
//		}else {
//			resp.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = resp.getWriter();
//			out.println("<script>alert('새글 입력 실패'); location.href='./board.do';</script>");
//			out.flush();
//			return "board";
//		}
		
	}
	
	@PostMapping(value="/updateboard.do")
	public String updateboard(Board board, RedirectAttributes rttr) {
		logger.info("updateboard 수정되었습니다. {}", board);
		serviceImple.updateBoard(board);
		rttr.addFlashAttribute("update","update");
		return "redirect:/board";
	}
	
	@PostMapping(value="/deleteBoard.do")
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
	
	
	
	
//	@RequestMapping(value="/reinboard.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String replyBoard(@RequestBody Board board, HttpSession session) {
//			logger.info("댓글 등록!!!!!!!!!!!!!!!!!!!!!!!!");
//			//System.out.println(board.getUser_id());
//			String writer = (String) session.getAttribute("user_id");
//			
//			board.setUser_id(writer);
//			serviceImple.reply(board);
//			return "board";
//		
//	}
	
//	@RequestMapping(value="/reviewboard.do", produces = "application/json; charset=utf8")
//	@ResponseBody
//	public String replyviewBoard(@ModelAttribute("board") Board board, HttpServletRequest req) {
//		logger.info("댓글 보이기");
//		ArrayList<HashMap> relist = new ArrayList<HashMap>();
//		
//		List<Board> boardvo = serviceImple.replyview(board);
//		if(boardvo.size()>0){
//			for (int i = 0; i < boardvo.size(); i++) {
//				HashMap hm = new HashMap();
//				hm.put("content", boardvo.get(i).getContent());
//				hm.put("regdate", boardvo.get(i).getRegdate());
//				
//				relist.add(hm);
//			}
//		}
//		JSONArray json = new JSONArray(relist);
//		return "board";
//	}
	
}