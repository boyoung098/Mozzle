package com.mozzle.web.dao.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mozzle.web.dto.board.PostReportDto;
import com.mozzle.web.dto.board.PostReportJoinDto;
import com.mozzle.web.dto.board.RowNum_Dto;

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

	@Override
	public int postReportListTotal(String mozzle_id) {
		logger.info("PostRepoartDaoImpl postReportListTotal메소드");
		
		return  session.selectOne(NS+"postReportListTotal",mozzle_id);
	}

	@Override
	public List<PostReportDto> selectPostReportList(RowNum_Dto dto) {
		logger.info("PostRepoartDaoImpl selectPostReportList메소드{}",dto);
		
		return session.selectList(NS+"selectPostReportList",dto);
	}

	@Override
	public int inappropriatePostReport(Map<String, String[]> map) {
		logger.info("PostRepoartDaoImpl inappropriatePostReport메소드{}",map);
		
		return session.update(NS+"inappropriatePostReport",map);
	}

	@Override
	public int deleteadminPostReport(Map<String, String[]> map) {
		logger.info("PostRepoartDaoImpl deleteadminPostReport메소드{}",map);
		
		return session.update(NS+"deleteadminPostReport",map);
	}

}
