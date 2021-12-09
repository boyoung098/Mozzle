package com.mozzle.web.service.board;

import java.util.List;

import com.mozzle.web.dto.board.Board;

public interface IBoardService {
	public int insertBoard(Board board);
	public int updateBoard(Board board);
	public int deleteBoard(int num);
	public List<Board> selectOneBoard(Board board);
	
	public int bookmarkBoard(Board board);
	public int bookmarkDelete(Board board);
	
	public int replyIn(Board board);
	public int replyUp(Board board);
	public int replyDl(Board board);
	
	public int reportBoard(Board board);
}
