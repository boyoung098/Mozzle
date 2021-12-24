package com.mozzle.web.service.board;

import java.util.List;

import com.mozzle.web.dto.board.MozzlePostDto;

public interface IMozzlePostService {

	public List<MozzlePostDto> selectMozzlePostByMozzleId(String mozzle_id);
	
	public List<MozzlePostDto> selectMozzleReplyByPostId(String post_id);
	
	public int insertMozzlePost(MozzlePostDto post);

}
