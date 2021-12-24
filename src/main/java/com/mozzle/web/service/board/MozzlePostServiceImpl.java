package com.mozzle.web.service.board;

import java.util.List;

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
	public List<MozzlePostDto> selectMozzleReplyByRefer(int refer) {
		return dao.selectMozzleReplyByRefer(refer);
	}

	@Override
	public int insertMozzlePost(MozzlePostDto post) {
		return 0;
	}
	
}
