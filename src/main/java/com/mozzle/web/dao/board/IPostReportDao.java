package com.mozzle.web.dao.board;

import java.util.List;
import java.util.Map;

import com.mozzle.web.dto.board.PostReportDto;
import com.mozzle.web.dto.board.PostReportJoinDto;
import com.mozzle.web.dto.board.RowNum_Dto;

public interface IPostReportDao {

	public int selectCntByPostId(String post_id);
	
	public int insertPostReport(PostReportDto dto);
	
	public int postReportListTotal(String mozzle_id);
	
	public List<PostReportDto> selectPostReportList(RowNum_Dto dto);
	//public List<PostReportDto> selectPostReportList(Map<String, String> map);
	
	public int inappropriatePostReport(Map<String,String[]> map);
	public int deleteadminPostReport(Map<String,String[]> map);
}
