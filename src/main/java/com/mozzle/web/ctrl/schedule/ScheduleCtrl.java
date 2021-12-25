package com.mozzle.web.ctrl.schedule;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mozzle.web.comm.ScheduleUtil;
import com.mozzle.web.dto.schedule.ScheduleDto;
import com.mozzle.web.service.schedule.IScheduleService;


@Controller
public class ScheduleCtrl {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleCtrl.class);

	@Autowired
	private IScheduleService service;
	
	@RequestMapping(value = "/calendar.do", method = RequestMethod.GET)
	public String CalendarForm(Locale locale,Model model,String year, String month) {
		logger.info("달력 보기 {} ", locale);
		
		//월별 일정에 대해 하루마다 일정 3개씩 표시하기 기능 구현
		
		return "mozzle/Calendar";
	}
	
	@RequestMapping(value = "/scheduleselectAll.do", method = RequestMethod.GET)
	public String scheduleselectAll(HttpServletRequest request, Locale locale,Model model,
									@RequestParam Map<String,String> ymd) {
		logger.info("일정 목록 보기 {} ", locale);
		
		//년월일을 8자리로 만들기 위해 1자리 값은 2자리로 만들어서 8자리로 만든다.
//		String yyyyMMdd = ymd.get("year")
//					+(ymd.get("month").length()<2?"0"+ymd.get("month"):ymd.get("month"))
//					+(ymd.get("date").length()<2?"0"+ymd.get("date"):ymd.get("date"));
		String yyyyMMdd = ymd.get("year")
				+ ScheduleUtil.isTwo(ymd.get("month"))
				+ ScheduleUtil.isTwo(ymd.get("date"));
		
		//모즐아이디 전달
//		HttpSession session = request.getSession();
//		String mozzle_id = (String)session.getAttribute("mozzle_id");
		String mozzle_id = "2";
		
		List<ScheduleDto> list = service.scheduleselectAll(mozzle_id, yyyyMMdd);
		model.addAttribute("list",list);
		
		return "mozzle/scheduleselectAll";
	}
	
	@RequestMapping(value = "/scheduleinsert.do", method = RequestMethod.GET)
	public String scheduleinsert(Locale locale,Model model) {
		logger.info("일정 추가 폼 이동 {} ", locale);
		
		//월별 일정에 대해 하루마다 일정 3개씩 표시하기 기능 구현
		
		return "mozzle/scheduleinsert";
	}
	
}
