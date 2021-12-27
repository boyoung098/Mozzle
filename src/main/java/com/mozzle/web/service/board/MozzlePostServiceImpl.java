package com.mozzle.web.service.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mozzle.web.dao.board.IMozzlePostDao;
import com.mozzle.web.dto.board.MozzlePostDto;

@Service
public class MozzlePostServiceImpl implements IMozzlePostService{
	
	@Autowired
	IMozzlePostDao dao;

	@Override
	public List<MozzlePostDto> selectMozzlePostByMozzleId(String mozzle_id) {
		return dao.selectMozzlePostByMozzleId(mozzle_id);
	}
	
	@Override
	public List<MozzlePostDto> selectMyMozzlePost(MozzlePostDto post) {
		return dao.selectMyMozzlePost(post);
	}

	@Override
	public List<MozzlePostDto> searchMozzlePost(MozzlePostDto post) {
		return dao.searchMozzlePost(post);
	}


	@Override
	public List<MozzlePostDto> selectMozzleReplyByRefer(int refer) {
		return dao.selectMozzleReplyByRefer(refer);
	}

	@Override
	public boolean insertMozzlePost(MozzlePostDto post) {
		int n = dao.insertMozzlePost(post);
		
		return (n==1) ? true:false;
				
	}

	@Override
	public boolean insertFirstReply(MozzlePostDto post) {
		int n = dao.insertFirstReply(post);
		return (n==1) ? true:false;
	}

	@Override
	public boolean replyIn(MozzlePostDto post) {
		int n = dao.replyUp(post);
		int m = dao.replyIn(post);
		return (n+m != 0) ? true:false;
	}

	@Override
	public boolean deleteMozzlePost(String post_id) {
		int n = dao.deleteMozzlePost(post_id);
		return (n == 1) ? true:false;
	}

	@Override
	public List<Map<String, String>> selectMyPost(Map<String, String> map) {
		return dao.selectMyPost(map);
	}

	@Override
	public boolean updateMozzlePost(MozzlePostDto post) {
		int n = dao.updateMozzlePost(post);
		return (n == 1) ?  true:false;
	}
}
