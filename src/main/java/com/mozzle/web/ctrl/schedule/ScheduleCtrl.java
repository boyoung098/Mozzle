package com.mozzle.web.ctrl.schedule;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mozzle.web.dto.schedule.ScheduleDto;
import com.mozzle.web.service.schedule.IScheduleServiceImpl;

/**
 * @since 2021-12-12
 * @author hyuns
 *
 */

@Controller
public class ScheduleCtrl{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IScheduleServiceImpl schedule;
	
	@RequestMapping(value="/scheduleselectAll", method = RequestMethod.GET)
	public String scheduleselectAll(Model model) {
		logger.info("ScheduleController 캘린더 출력");
		List<ScheduleDto> list = schedule.scheduleselectAll(null);
		model.addAttribute("list", list);
		return "list";
	}
	
	
}
