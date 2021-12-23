package com.mozzle.web.ctrl.notice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mozzle.web.dao.notice.INoticeDao;
import com.mozzle.web.service.notice.INoticeService;

@Controller
@RequestMapping(value = "/notice")
public class NotificationController {

	@Autowired
	private INoticeService nservice;
	
	@RequestMapping(value="/notification.do", method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> notification(String userId) {
		List<Map<String, Object>> lists = 
				nservice.noticeSelectAll(userId);
		return lists;
	}
	
	@RequestMapping(value="/addNotification.do", method=RequestMethod.POST)
	public String addNotification() {
		
		return null;
	}
	
}
