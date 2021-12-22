package com.mozzle.web.dao.board;

import com.mozzle.web.dto.board.PostReportDto;
import com.mozzle.web.dto.board.PostReportJoinDto;

public interface IPostReportDao {

	public int selectCntByPostId(String post_id);
	
	public int insertPostReport(PostReportDto dto);
	
	
}
