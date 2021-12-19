package com.mozzle.web.service.board;

import java.util.List;

import com.mozzle.web.dto.board.Board;

public interface IBoardService {
	public int insertBoard(Board board);
	public int updateBoard(Board board);
	public int deleteBoard(int num);
	public List<Board> selectOneBoard(Board board);
	public List<Board> selectAllBoard();
	
	public int bookmarkBoard(Board board);
	public int bookmarkDelete(Board board);
	
	public int reply(Board board);
	public int getReplyinput(Board board);
	public int reportBoard(Board board);
	
}
