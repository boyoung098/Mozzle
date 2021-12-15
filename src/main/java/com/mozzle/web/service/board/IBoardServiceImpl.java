package com.mozzle.web.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mozzle.web.dao.board.IBoardDao;
import com.mozzle.web.dto.board.Board;

@Service
public class IBoardServiceImpl implements IBoardService {

	@Autowired
	private IBoardDao dao;
	
	@Override
	public int insertBoard(Board board) {
		return dao.insertBoard(board);
	}

	@Override
	public int updateBoard(Board board) {
		return dao.updateBoard(board);
	}

	@Override
	public int deleteBoard(int num) {
		return dao.deleteBoard(num);
	}

	@Override
	public List<Board> selectOneBoard(Board board) {
		return dao.selectOneBoard(board);
	}

	@Override
	public List<Board> selectAllBoard() {
		return dao.selectAllBoard();
	}
	
	@Override
	public int bookmarkBoard(Board board) {
		return dao.bookmarkBoard(board);
	}

	@Override
	public int bookmarkDelete(Board board) {
		return dao.bookmarkDelete(board);
	}

	@Override
	@Transactional
	public int reply(Board board) {
		int In = dao.replyIn(board);
		int Up = dao.replyUp(board);
		int Dl = dao.replyDl(board);
		return In+Up+Dl;
	}


	@Override
	public int reportBoard(Board board) {
		return dao.reportBoard(board);
	}

	@Override
	public int replyview(Board board) {
		return dao.replyview(board);
	}

	

	

}
