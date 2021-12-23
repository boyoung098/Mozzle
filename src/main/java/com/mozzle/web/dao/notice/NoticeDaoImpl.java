package com.mozzle.web.dao.notice;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mozzle.web.dto.notice.NotificationDto;

@Repository
public class NoticeDaoImpl implements INoticeDao{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final static String NS = "com.mozzle.web.Notice.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Map<String, Object>> noticeSelectAll(String userId) {
		return session.selectList(NS + "noticeSelectAll", userId);
	}

	@Override
	public int registerMozzleNotice(Map<String, String> map) {
		return session.insert(NS + "registerMozzleNotice", map);
	}

}
