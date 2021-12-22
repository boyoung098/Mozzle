package com.mozzle.web.ctrl.schedule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mozzle.web.dao.schedule.IScheduleDaoImpl;
import com.mozzle.web.dto.schedule.ScheduleDto;
import com.mozzle.web.service.schedule.IScheduleService;

/**
 * @since 2021-12-12
 * @author hyuns
 *
 */

@Controller
public class ScheduleCtrl {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private IScheduleService schedule;

	/**
	 * 일정 전체 리스트
	 * 
	 * @return
	 */
	@RequestMapping(value = "/calendar.do", method = RequestMethod.GET)
	public String scheduleselectAll(Model model, HttpSession session) {
		logger.info("ScheduleController 캘린더 출력 {}");
		Map<String, String> map = new HashMap<String, String>();
		List<ScheduleDto> lists = schedule.scheduleselectAll(map);
		model.addAttribute("lists", lists);
		return "mozzle/calendar";
	}

	@RequestMapping(value = "/scheduleinsert.do", method = RequestMethod.GET)
	public String scheduleinsert() {
		logger.info("ScheduleController insert 출력 {}");
		
		return "mozzle/scheduleinsert";
	}

}