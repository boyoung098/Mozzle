package com.mozzle.web.dao.board;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mozzle.web.dto.board.PostReportDto;
import com.mozzle.web.dto.board.PostReportJoinDto;

@Repository
public class PostRepoartDaoImpl implements IPostReportDao {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.mozzle.web.dao.board.IPostReportDao.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int selectCntByPostId(String post_id) {
		logger.info("PostRepoartDaoImpl selectCntByPostId메소드{}",post_id);
		int n = session.selectOne(NS+"selectCntByPostId",post_id);
		return n;
	}

	@Override
	public int insertPostReport(PostReportDto dto) {
		logger.info("PostRepoartDaoImpl insertPostReport메소드{}",dto);
		
		return  session.insert(NS+"insertPostReport",dto);
	}

}
