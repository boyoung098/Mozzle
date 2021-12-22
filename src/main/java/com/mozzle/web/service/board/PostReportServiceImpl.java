package com.mozzle.web.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mozzle.web.dao.board.IPostReportDao;
import com.mozzle.web.dto.board.PostReportDto;

@Service
public class PostReportServiceImpl implements IPostReportService {

	@Autowired
	IPostReportDao dao;
	
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

}
