package com.mozzle.web.ctrl.schedule;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mozzle.web.dto.schedule.ScheduleDto;
import com.mozzle.web.service.schedule.IScheduleService;


@Controller
public class ScheduleCtrl {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleCtrl.class);

	@Autowired
	private IScheduleService service;
	
	//view/mozzle/Calendar.jsp 를 불러온다
	@GetMapping(value="/calendar.do")
	public String scheduleForm() {
		logger.info("scheduleForm TEST");
		
		
		return "mozzle/Calendar";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/calendarselectAll.do",method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	//로드
	public String scheduleselectAll(Map<String,String> map) throws ParseException{
		
		JSONArray jlist = new JSONArray();
		ScheduleDto dto = null;
		
		List<ScheduleDto> lists = service.scheduleselectAll(map);
		
		if (lists == null || lists.size() == 0) {
			logger.info("nothing found to selectAll");
		}else {
			logger.info("lists 값:\t {}",lists);
			
			for (int i = 0; i < lists.size(); i++) {
				dto = lists.get(i);
				JSONObject jdto = new JSONObject();
				jdto.put("schedule_id", dto.getSchedule_id());
				jdto.put("mozzle_id", dto.getMozzle_id());
				jdto.put("writer", dto.getWriter());   
				jdto.put("title", dto.getTitle());
				jdto.put("content", dto.getContent());    
				jdto.put("schedule_date", dto.getSchedule_date());
				jdto.put("regdate", dto.getRegdate());
				jdto.put("delflag", dto.getDelflag());
				jdto.put("location_code", dto.getLocation_code());
				jlist.add(jdto);		
		}
			logger.info("jlist??????????????????????: \t"+jlist.toString());
		}
		return jlist.toString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/scheduleupdate.do",method = RequestMethod.POST)
	@ResponseBody
	//업데이트
	public String update(String schedule_id, String title, String content, String schedule_date, int location_code) {
		//2021/12/23/10:00
		String sd = schedule_date.substring(10, schedule_date.length()-2);
		ScheduleDto dto = new ScheduleDto();
		
		System.out.println("받은 데이터 : ????????????"+title);
		dto.setSchedule_id(schedule_id);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setSchedule_date(sd);
		dto.setLocation_code(0);
		
		logger.info("변경된 dto 값은?????????????????????????????: \t"+dto);
		boolean isc = service.scheduleupdate(dto);
		System.out.println(isc);
		
		JSONObject jObj = new JSONObject();
		
		jObj.put("schedule_id", schedule_id);
		jObj.put("title", title);
		jObj.put("content", content);
		jObj.put("sd", sd);
		jObj.put("location_code", location_code);
		
		logger.info(jObj.toString());
		
		return jObj.toString();
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/scheduleinsert.do",method = RequestMethod.POST, produces = "applicaton/text; charset=UTF-8;")
	@ResponseBody
	//insert 저장부분
	public String save(ScheduleDto dto,String schedule_id, String title, String content, String schedule_date, int location_code) throws ParseException {
		
		String sd = schedule_date.substring(10, schedule_date.length()-2);
		
		dto.setSchedule_id(schedule_id);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setSchedule_date(sd);
		dto.setLocation_code(0);
		
		logger.info("dto 값은?????????????????????????????: \t"+dto);
		boolean isc = service.scheduleinsert(dto);
//		System.out.println(isc);
		
		JSONObject json = new JSONObject();
		
		json.put("schedule_id", schedule_id);
		json.put("title", title);
		json.put("content", content);
		json.put("sd", sd);
		json.put("location_code", location_code);
		
		logger.info(json.toString());
		
		return json.toString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/scheduledelete.do",method = RequestMethod.POST)
	@ResponseBody
	//삭제
	public String delete(ScheduleDto dto,String schedule_id) {
		System.out.println(schedule_id);
		
		dto.setSchedule_id(schedule_id);
		
		logger.info("삭제될 dto id값은?????????????????????????????: \t"+dto);
		boolean isc = service.scheduledelete(schedule_id);
		System.out.println(isc);
		
		JSONObject jObj = new JSONObject();
		
		jObj.put("schedule_id", schedule_id);
		
		logger.info(jObj.toString());
		
		return jObj.toString();
	}
	
}
