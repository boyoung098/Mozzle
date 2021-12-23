package com.mozzle.web.service.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mozzle.web.dao.notice.INoticeDao;
@Service
public class NoticeServiceImpl implements INoticeService {

	@Autowired
	private INoticeDao dao;
	
	@Override
	public List<Map<String, Object>> noticeSelectAll(String userId) {
		return dao.noticeSelectAll(userId);
	}

	@Override
	public int registerMozzleNotice(Map<String, String> map) {
		return dao.registerMozzleNotice(map);
	}

}
