package com.mozzle.web.service.board;

import com.mozzle.web.dto.board.PostReportDto;

public interface IPostReportService {

	public int selectCntByPostId(String post_id);
	public int insertPostReport(PostReportDto dto);
}
