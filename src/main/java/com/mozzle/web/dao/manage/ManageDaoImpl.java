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
	public List<String> selectMozzleIdByUserNumber() {
		logger.info("selectMozzleByUserNumber");
		return session.selectList(NS + "selectMozzleIdByUserNumber") ;
	}

	@Override
	public List<MozzleDto> selectMozzleByUserNumber(List<String> lists) {
		logger.info("selectMozzleByUserNumber {}", lists);
		return session.selectList(NS + "selectMozzleByUserNumber", lists) ;
	}

	@Override
	public List<MozzleDto> selectMyMozzle(String user_id) {
		logger.info("selectMyMozzle {}", user_id);
		return session.selectList(NS + "selectMyMozzle", user_id);
	}

	@Override
	public List<MozzleDto> selectMozzleBySearchBasedOnImportance(String keyword) {
		logger.info("selectMozzleBySearchBasedeOnImportance {}", keyword);
		return session.selectList(NS + "selectMozzleBySearchBasedOnImportance", keyword);
	}

	@Override
	public List<MozzleDto> selectMozzleBySearchFromTheLastest(String keyword) {
		logger.info("selectMozzleBySearchFromTheLastest {}", keyword);
		return session.selectList(NS + "selectMozzleBySearchFromTheLastest", keyword);
	}

	@Override
	public String[] selectCategory() {
		logger.info("selectCategory");
		return null;
	}

	@Override
	public int updateMozzle(MozzleDto mozzle) {
		logger.info("updateMozzle {}", mozzle);
		return session.update(NS + "updateMozzle", mozzle);
	}

	@Override
	public String selectMozzleIdByMozzleName(String mozzleName) {
		logger.info("selectMozzleIdByLeaderId {}", mozzleName);
		return session.selectOne(NS + "selectMozzleIdByMozzleName", mozzleName);
	}

	@Override
	public int registLeader(MozzleDto mozzle) {
		logger.info("registLeader {}", mozzle);
		return session.insert(NS + "registLeader", mozzle);
	}
}
