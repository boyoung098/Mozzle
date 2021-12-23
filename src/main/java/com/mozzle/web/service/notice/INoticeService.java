package com.mozzle.web.service.notice;

import java.util.List;
import java.util.Map;

public interface INoticeService {
	public List<Map<String, Object>> noticeSelectAll(String userId);
	
	public int registerMozzleNotice(Map<String, String> map);

}
