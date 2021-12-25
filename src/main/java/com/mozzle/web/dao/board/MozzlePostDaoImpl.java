package com.mozzle.web.dao.board;

import java.util.List;

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
	public List<MozzlePostDto> selectMozzleReplyByRefer(int refer) {
		logger.info("selectMozzleReplyByRefer {}", refer);
		return session.selectList(NS + "selectMozzleReplyByRefer", refer);
	}
	
	@Override
	public int insertMozzlePost(MozzlePostDto post) {
		logger.info("insertMozzlePost {}", post);
		return session.selectOne(NS + "insertMozzlePost", post);
	}
}
