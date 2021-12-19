package com.mozzle.web.ctrl.board;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mozzle.web.dto.board.Board;
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
		
		return "mozzle/M_board";
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
	
	@ResponseBody
	@RequestMapping(value = "/addComment.do")
	public boolean addComment(HttpSession session, @RequestParam("fmcontent") String fmcontent) {
		
		Board board =  new Board();
		board.setMozzle_id("1");
		board.setUser_id("reuser05");
		board.setTitle("테스트테스트 제목입니다");
		board.setContent(fmcontent);
		System.out.println(fmcontent+"======================================================");
		
		boolean isc = false;
		
		int comment = serviceImple.getReplyinput(board);
		logger.info("addComment {}", comment);
		if(comment ==1) {
		
			isc = true;
			System.out.println("성공------------------------");
		}
		return isc;
	}
	
	
	

	
}