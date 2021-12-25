package com.mozzle.web.dao.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mozzle.web.dto.board.Board;

@Repository
public class IBoardDaoImpl implements IBoardDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.mozzle.web.dto.board.Board.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertBoard(Board board) {
		logger.info("게시판 입력");
		return session.insert(NS+"insertBoard", board);
	}

	@Override
	public int updateBoard(Board board) {
		logger.info("게시판 수정");
		return session.update(NS+"updateBoard",board);
	}

	@Override
	public int deleteBoard(int num) {
		logger.info("게시판 삭제");
		return session.delete(NS+"deleteBoard",num);
	}

	@Override
	public List<Board> selectSearchBoard(String content) {
		logger.info("게시판 조회");
		
		return session.selectList(NS+"selectSearchBoard", content);
	}
	
	@Override
	public List<Board> selectAllBoard(String mozzle_id) {
		logger.info("전체 게시판");
		return session.selectList(NS+"selectAllBoard", mozzle_id);
	}

	
	
	

	@Override
	public int bookmarkBoard(Board board) {
		logger.info("북마크");
		return session.insert(NS+"bookmarkBoard", board);
	}

	@Override
	public int bookmarkDelete(Board board) {
		logger.info("북마크 해제");
		return session.insert(NS+"bookmarkDelete", board);
	}

	@Override
	public int getReplyinput(Board board) {
		logger.info("댓글 입력");
		return session.insert(NS+"replyIn",board);
	}

	@Override
	public int replyUp(Board board) {
		logger.info("댓글 수정");
		return session.update(NS+"replyUp",board);
	}

	@Override
	public int replyDl(Board board) {
		logger.info("댓글 삭제");
		return session.delete(NS+"replyDl", board);
	}
	
	@Override
	public int reportBoard(Board board) {
		logger.info("신고");
		return session.insert(NS+"reportBoard", board);
	}

	@Override
	public String replySelectAllBoard(String id) {
		return session.selectOne(NS+"reselectAll");
	}

	
	

	
	

}
