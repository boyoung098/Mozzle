package com.mozzle.web.dao.board;

import java.util.List;
import java.util.Map;

import com.mozzle.web.dto.board.MozzlePostDto;

public interface IMozzlePostDao {
	
	public List<MozzlePostDto> selectMozzlePostByMozzleId(String mozzle_id);
	
	public List<MozzlePostDto> selectMyMozzlePost(MozzlePostDto post);
	
	public List<MozzlePostDto> searchMozzlePost(MozzlePostDto post);
	
	public List<MozzlePostDto> selectMozzleReplyByRefer(int refer);
	
	public int insertMozzlePost(MozzlePostDto post);
	
	public int insertFirstReply(MozzlePostDto post);
	
	public int replyUp(MozzlePostDto post);
	
	public int replyIn(MozzlePostDto post);
	
	public int deleteMozzlePost(String post_id);
	
	public List<Map<String, String>> selectMyPost(Map<String, String> map);

	public int deleteadminPosts(Map<String,String[]> map);
	
	public int updateMozzlePost(MozzlePostDto post);
}
