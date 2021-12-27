package com.mozzle.web.dao.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mozzle.web.dto.board.MozzlePostDto;

@Repository
public class MozzlePostDaoImpl implements IMozzlePostDao {
	
	@Autowired
	private SqlSessionTemplate session;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS ="com.mozzle.web.dao.board.MozzlePostDaoImpl.";
	
	@Override
	public List<MozzlePostDto> selectMozzlePostByMozzleId(String mozzle_id) {
		logger.info("selectMozzlePostByMozzleId {} ", mozzle_id);
		return session.selectList(NS + "selectMozzlePostByMozzleId", mozzle_id);
	}
	
	@Override
	public List<MozzlePostDto> selectMyMozzlePost(MozzlePostDto post) {
		logger.info("selectMozzlePostByMozzleId {} ", post);
		return session.selectList(NS + "selectMyMozzlePost", post);
	}

	@Override
	public List<MozzlePostDto> searchMozzlePost(MozzlePostDto post) {
		logger.info("searchMozzlePost {} ", post);
		return session.selectList(NS + "searchMozzlePost", post);
	}
	
	@Override
	public List<MozzlePostDto> selectMozzleReplyByRefer(int refer) {
		logger.info("selectMozzleReplyByRefer {}", refer);
		return session.selectList(NS + "selectMozzleReplyByRefer", refer);
	}
	
	@Override
	public int insertMozzlePost(MozzlePostDto post) {
		logger.info("insertMozzlePost {}", post);
		return session.insert(NS + "insertMozzlePost", post);
	}

	@Override
	public int insertFirstReply(MozzlePostDto post) {
		logger.info("insertFirstReply {}", post);
		return session.insert(NS + "insertFirstReply", post);
	}

	@Override
	public int replyUp(MozzlePostDto post) {
		logger.info("replyUp {}", post);
		return session.update(NS + "replyUp", post);
	}

	@Override
	public int replyIn(MozzlePostDto post) {
		logger.info("replyIn {}", post);
		return session.insert(NS + "replyIn", post);
	}

	@Override
	public int deleteMozzlePost(String post_id) {
		logger.info("deleteMozzlePost {}", post_id);
		return session.update(NS + "deleteMozzlePost", post_id);
	}

	@Override
	public int deleteadminPosts(Map<String, String[]> map) {
		// TODO Auto-generated method stub
		return session.update(NS + "deleteadminPosts", map);
  }
  @Override
	public List<Map<String, String>> selectMyPost(Map<String, String> map) {
		return session.selectList(NS + "selectMyPost", map);
	}
  @Override
	public int updateMozzlePost(MozzlePostDto post) {
		logger.info("updateMozzlePost {}", post);
		return session.update(NS+"updateMozzlePost", post);
	}
}
