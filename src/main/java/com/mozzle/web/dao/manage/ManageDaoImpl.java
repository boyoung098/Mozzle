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
	public String createMozzleId() {
		logger.info("createMozzleId {} ");
		return session.selectOne(NS + "createMozzleId");
	}

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
		logger.info("selectMozzleByUserNumber {}");
		return session.selectList(NS + "selectMozzleByUserNumber") ;
	}
	

	@Override
	public String searchLeaderNickname(String mozzle_id) {
		logger.info("searchLeaderNickname {}", mozzle_id);
		return session.selectOne(NS + "searchLeaderNickname", mozzle_id);
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

	@Override
	public int mozzleNameCheck(String mozzle_name) {
		logger.info("mozzleIdCheck {}", mozzle_name);
		return session.selectOne(NS + "mozzleNameCheck", mozzle_name);
	}

	@Override
	public int selectUserNum(String mozzle_id) {
		logger.info("selectUserNum {}", mozzle_id);
		return session.selectOne(NS + "selectUserNum", mozzle_id);
	}

	@Override
	public int checkMember(String user_id) {
		logger.info("checkMember {}", user_id);
		return session.selectOne(NS + "checkMember", user_id);
	}
}
