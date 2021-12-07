package com.mozzle.web.dao.board;

public interface IBoardDao {
	
	public int insertBoard();
	public int updateBoard();
	public String deleteBoard();
	public String selectOneBoard();
	
	public String bookmarkBoard();
	public String reportBoard();
	
	public String replyIn();
	public int replyUp();
	public String replydl();
}
