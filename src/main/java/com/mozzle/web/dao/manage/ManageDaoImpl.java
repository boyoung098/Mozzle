package com.mozzle.web.dao.manage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mozzle.web.dto.manage.MozzleDto;

@Repository
public class ManageDaoImpl implements IManageDao{
	
	@Autowired
	private SqlSessionTemplate session;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS ="com.mozzle.web.dao.manage.ManageDaoImpl.";

	@Override
	public int registMozzle(MozzleDto mozzle) {
		logger.info("registMozzle {} ", mozzle);
		return session.insert(NS + "registMozzle", mozzle);
	}

	@Override
	public List<MozzleDto> selectMozzleByCreatDate() {
		logger.info("selectMozzleByCreatDate ");
		return session.selectList(NS + "selectMozzleByCreatDate");
	}

	@Override
	public MozzleDto selectMozzleByMozzleId(String mozzle_id) {
		logger.info("selectMozzleByCreatDate {} ", mozzle_id);
		return session.selectOne(NS + "selectMozzleByMozzleId", mozzle_id) ;
	}

	@Override
	public List<MozzleDto> selectMozzleByUserNumber() {
		logger.info("selectMozzleByUserNumber");
		return session.selectList(NS + "selectMozzleByUserNumber") ;
	}

	
}
