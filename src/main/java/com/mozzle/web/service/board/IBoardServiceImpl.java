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
	public List<Board> selectSearchBoard(String content) {
		return dao.selectSearchBoard(content);
	}

	@Override
	public List<Board> selectAllBoard(String mozzle_id) {
		return dao.selectAllBoard(mozzle_id);
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
		int Up = dao.replyUp(board);
		int Dl = dao.replyDl(board);
		return Up+Dl;
	}


	@Override
	public int reportBoard(Board board) {
		return dao.reportBoard(board);
	}

	@Override
	public int getReplyinput(Board board) {
		return dao.getReplyinput(board);
	}

	@Override
	public String replySelectAllBoard(String id) {
		return dao.replySelectAllBoard(id);
	}

	

	

	

}
