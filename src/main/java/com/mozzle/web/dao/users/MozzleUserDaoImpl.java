package com.mozzle.web.dao.users;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
