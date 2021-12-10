package com.mozzle.web.dao.manage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mozzle.web.dto.manage.MozzleDto;

@Repository
public class ManageDaoImpl implements IManageDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NS ="com.mozzle.web.dao.manage.ManageDaoImpl.";

	@Override
	public int registMozzle(MozzleDto mozzle) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MozzleDto> selectMozzleByCreatDate() {
		// TODO Auto-generated method stub
		return null;
	}

	
}
