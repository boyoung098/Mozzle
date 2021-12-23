package com.mozzle.web.dao.notice;

import java.util.List;
import java.util.Map;

import com.mozzle.web.dto.notice.NotificationDto;

public interface INoticeDao {
	public List<Map<String, Object>> noticeSelectAll(String userId);
	
	public int registerMozzleNotice(Map<String, String> map);
}
