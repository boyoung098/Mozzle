package com.mozzle.web.dao.users;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mozzle.web.dto.manage.MozzleDto;
import com.mozzle.web.dto.users.MozzleUserDto;

@Repository
public class MozzleUserDaoImpl implements IMozzleUserDao {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	private final String NS = "com.mozzle.web.dao.users.MozzleUserDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override
	public List<MozzleUserDto> selectListMozzleUser(Map<String, String> map) {
		log.info("전체회원리트스 뿌리기전 넣는 값{}",map);
		List<MozzleUserDto> list = session.selectList(NS+"selectListMozzleUser",map);
		//return (list.size()==0?(List<MozzleUserDto>) new MozzleUserDto():list);
		return list;
	}


	@Override
	public int insertMozzleUser(MozzleUserDto dto) {
		log.info("모즐 내 회원가입 dto값{}",dto);
		
		return session.insert(NS+"insertMozzleUser", dto);
	}


	@Override
	public MozzleUserDto selectMozzleUser(Map<String, String> map) {
		log.info("회원리스트조회 하기 위해 넣는값{}",map);
		
		return session.selectOne(NS+"selectMozzleUser",map);
	}

	//------------------------------------------------------
	@Override
	public MozzleUserDto selectMozzleUserByUserId(Map<String, String> map) {
		log.info("모즐 유저 userid로 조회 {}",map);
		MozzleUserDto userdto = session.selectOne(NS+"selectMozzleUserByUserId",map);
		return userdto==null?new MozzleUserDto():userdto;
	}


	@Override
	public int insertMozzleHost(MozzleDto dto) {
		log.info("모즐 유저 운영자 생성 {}",dto);
		
		return session.insert(NS+"insertMozzleHost",dto);
	}


	@Override
	public int deleteMozzleUser(MozzleUserDto dto) {
		log.info("모즐 유저 본인이 탈퇴{}",dto);
		return session.delete(NS+"deleteMozzleUser",dto);
	}


	@Override
	public int updateMozzleUser(MozzleUserDto dto) {
		log.info("모즐유저 회원정보수정 본인이{}",dto);
		return session.update(NS+"updateMozzleUser",dto);
	}


	@Override
	public int updateMozzleUserAuth(MozzleUserDto dto) {
		log.info("모즐내 회원 권한수정 운영자가 {}",dto);
		return session.update(NS+"updateMozzleUserAuth",dto);
	}


	// 이종표 추가
	@Override
	public List<Map<String, Object>> leaderCheck(String userId) {
		return session.selectList(NS + "leaderCheck", userId);
	}


	@Override
	public int changeMozzleAuth(Map<String, String> map) {
		return session.update(NS + "changeMozzleAuth", map);
	}


	@Override
	public List<MozzleUserDto> selectListadminMozzleUser(Map<String, String> map) {
		log.info("전체회원리트스 뿌리기전 넣는 값{}",map);
		List<MozzleUserDto> list = session.selectList(NS+"selectListadminMozzleUser",map);
		//return (list.size()==0?(List<MozzleUserDto>) new MozzleUserDto():list);
		return list;
	}


	@Override
	public MozzleUserDto selectmozzleUserLeader(String mozzle_id) {
		// TODO Auto-generated method stub
		return session.selectOne(NS + "selectmozzleUserLeader", mozzle_id);
	}


	@Override
	public int deleteAllUserMozzleById(String userId) {
		return session.delete(NS + "deleteAllUserMozzleById", userId);
	}


	@Override
	public List<MozzleUserDto> selectListadminMozzleUser2(Map<String, String> map) {
		log.info("전체회원리트스 뿌리기전 넣는 값{}",map);
		List<MozzleUserDto> list = session.selectList(NS+"selectListadminMozzleUser2",map);
		//return (list.size()==0?(List<MozzleUserDto>) new MozzleUserDto():list);
		return list;
	}

	
}
