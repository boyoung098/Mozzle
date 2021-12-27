package com.mozzle.web.service.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mozzle.web.dao.board.IMozzlePostDao;
import com.mozzle.web.dao.board.IPostReportDao;
import com.mozzle.web.dto.board.PostReportDto;
import com.mozzle.web.dto.board.RowNum_Dto;

@Service
public class PostReportServiceImpl implements IPostReportService {

	@Autowired
	IPostReportDao dao;
	@Autowired
	IMozzlePostDao postdao;
	
	@Override
	public int selectCntByPostId(String post_id) {
		// TODO Auto-generated method stub
		return dao.selectCntByPostId(post_id);
	}

	@Override
	public int insertPostReport(PostReportDto dto) {
		// TODO Auto-generated method stub
		return dao.insertPostReport(dto);
	}

	@Override
	public int postReportListTotal(String mozzle_id) {
		// TODO Auto-generated method stub
		return dao.postReportListTotal(mozzle_id);
	}

	@Override
	public List<PostReportDto> selectPostReportList(RowNum_Dto dto) {
		// TODO Auto-generated method stub
		return dao.selectPostReportList(dto);
	}

	@Override
	public int inappropriatePostReport(Map<String, String[]> map) {
		// TODO Auto-generated method stub
		return dao.inappropriatePostReport(map);
	}

	@Override
	public int deleteadminPostReport(Map<String, String[]> map) {
		postdao.deleteadminPosts(map);
		return dao.deleteadminPostReport(map);
	}
	
	

}
