package com.mozzle.web.service.board;

import java.util.List;
import java.util.Map;

import com.mozzle.web.dto.board.MozzlePostDto;

public interface IMozzlePostService {

	public List<MozzlePostDto> selectMozzlePostByMozzleId(String mozzle_id);
	
	public List<MozzlePostDto> selectMyMozzlePost(MozzlePostDto post);
	
	public List<MozzlePostDto> searchMozzlePost(MozzlePostDto post);
	
	public List<MozzlePostDto> selectMozzleReplyByRefer(int refer);
	
	public boolean insertMozzlePost(MozzlePostDto post);
	
	public boolean insertFirstReply(MozzlePostDto post);
	
	public boolean replyIn(MozzlePostDto post);
	
	public boolean deleteMozzlePost(String post_id);
	

	/* public List<MozzlePostDto> selectMyPost(Map<String, String> map); */
	
	public boolean updateMozzlePost(MozzlePostDto post);

	public List<Map<String, String>> selectMyPost(Map<String, String> map);


}
