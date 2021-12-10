package com.mozzle.web.dao.users;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mozzle.web.dto.users.GuestDto;

@Repository
public class GuestDaoImpl implements IGuestDao {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SqlSessionTemplate session;
	
	private final String NS = "com.mozzle.web.dao.users.IGuestDao.";
	
	@Override
	public GuestDto selectByUUID(String uuid) {
		log.info("GuestDaoImpl UUID넣어서 select {}",uuid);
		GuestDto guestDto = session.selectOne(NS+"selectByUUID", uuid);
		if(guestDto==null) {
			guestDto = new GuestDto();
		}
		return guestDto;
	}

	@Override
	public List<GuestDto> selectGuest() {
		log.info("GuestDaoImpl selectGuest");
		List<GuestDto> list = session.selectList(NS+"selectGuest");
		return list;
	}

	@Override
	public int guestInsert(GuestDto guestDto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
