package com.mozzle.web.ctrl.schedule;

import java.util.Calendar;
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
//import com.mozzle.web.dto.schedule.ScheduleLocationInfoDto;
import com.mozzle.web.service.schedule.IScheduleService;


@Controller
public class ScheduleCtrl {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleCtrl.class);

	@Autowired
	private IScheduleService service;
	
	@RequestMapping(value = "/calendar.do", method = RequestMethod.GET)
	public String CalendarForm(Locale locale,Model model,String year, String month, String mozzle_id) {
		logger.info("달력 보기 {} ", locale);
		
		//컨트롤/Calendar.jsp/ 
		
//		String mozzle_id = "1";
//		calendar를 요청할 때 년,월의 값을 전달하지 않으면 현재 달을 보여준다.
		if(year==null||month==null) {
			Calendar cal = Calendar.getInstance();
			year = cal.get(Calendar.YEAR)+"";
			month = cal.get(Calendar.MONTH)+1+"";
		}else {
			//크기를 비교하기 위해 정수형으로 변환 : month>12, month<1
			int yearInt = Integer.parseInt(year);
			int monthInt = Integer.parseInt(month);
			
			//월이 증가하다가 12보다 커진다면 13,14,15,16,17...넘어가는 현상을 처리
			if(monthInt>12){
				monthInt=1;	//1월로 변경
				yearInt++;		//년도는 다음해로 넘어가서 년도 +1 증가시킨다.
			}
			if(monthInt<1){
				monthInt=12;
				yearInt--;
			}
			
			year = yearInt+"";
			month = String.valueOf(monthInt);
		}
		
		//월별 일정에 대해 하루마다 일정 3개씩 표시하기 기능 구현
		String yyyyMM = year+ScheduleUtil.isTwo(month);
		System.out.println(yyyyMM);
		List<ScheduleDto> slist = service.scheduleselectViewAll(mozzle_id, yyyyMM);
		for (ScheduleDto scheduleDto : slist) {
			System.out.println(scheduleDto.toString());
		}
		System.out.println(slist);
		model.addAttribute("slist", slist);
		model.addAttribute("yyyyMM", yyyyMM);
		model.addAttribute("mozzle_id", mozzle_id);
		return "mozzle/Calendar";
	}
	
	@RequestMapping(value = "/scheduleselectAll.do", method = RequestMethod.GET)
	public String scheduleselectAll(HttpServletRequest request, Locale locale,Model model, String mozzle_id,
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
//		String mozzle_id = "2";
		model.addAttribute("mozzle_id", mozzle_id);
		
		List<ScheduleDto> list = service.scheduleselectAll(mozzle_id, yyyyMMdd);
		model.addAttribute("list",list);
		
		return "mozzle/scheduleselectAll";
	}
	
	@RequestMapping(value = "/scheduleinsertForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String scheduleinsertForm(Locale locale,Model model, String mozzle_id) {
		logger.info("일정 추가 폼 이동 {} ", locale);
		
		//월별 일정에 대해 하루마다 일정 3개씩 표시하기 기능 구현
		model.addAttribute("mozzle_id",mozzle_id);
		return "mozzle/scheduleinsertForm";
	}
	
	@RequestMapping(value = "/scheduleinsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String scheduleinsert(ScheduleDto dto, Locale locale,Model model) {
		logger.info("일정 추가 {} ", locale);

		System.out.println(dto);
		//schedule_date 는 12자리로 만들어서 DB에 저장해야 한다.
		String schedule_date = dto.getYear()
				+ ScheduleUtil.isTwo(dto.getMonth())
				+ ScheduleUtil.isTwo(dto.getDate())
				+ ScheduleUtil.isTwo(dto.getHour())
				+ ScheduleUtil.isTwo(dto.getMin());
//		boolean isS1 = service.scheduleinfoinsert(
//					dto2
//				);
		boolean isS = service.scheduleinsert(
					new ScheduleDto("", dto.getMozzle_id(), dto.getWriter(),
							dto.getTitle(), dto.getContent(),
							schedule_date, null)
				);
		System.out.println("===========================dto.getMozzle_id()======================");
		System.out.println(dto.getMozzle_id());

		if(isS) {
			//이부분 연결 제대로하기
			return "forward:firstmozzle.do?mozzle_id"+dto.getMozzle_id();
		}else {
			model.addAttribute("msg", "일정등록실패!!");
			return "error";
		}
	}
	
//	@RequestMapping(value = "/scheduledelete.do", method = RequestMethod.GET)
//	public String scheduledelete(String[] schedule_id,ScheduleDto dto, Locale locale, Model model) {
//		logger.info("일정 삭제 {} , locale");
//		
//		String source = "year="+dto.getYear()+"&month="+dto.getMonth()
//								+"&date="+dto.getDate();
//		
//		boolean isS = service.scheduledelete(schedule_id);
//		if(isS) {
//			return "mozzle/scheduleselectAll"+source;
//		}else {
//			model.addAttribute("msg","일정삭제실패");
//			return "error";
//		}
//	}
//	
//	@RequestMapping(value = "/scheduleselectOne.do", method = RequestMethod.GET)
//	public String scheduleselectOne(int Schedule_id, Locale locale, Model model) {
//		logger.info("일정상세내용보기{}", locale);
//		ScheduleDto dto = service.scheduledetail(Schedule_id);
//		model.addAttribute("dto",dto);
//		
//		return "scheduleselectOne";
//	}
//	
	@RequestMapping(value = "/scheduleupdate.do", method = RequestMethod.GET)
	public String scheduleupdate(ScheduleDto dto, Locale locale, Model model) {
		logger.info("일정 수정 이동{}", locale);
		//insert 과 똑같이 작성
		
		String schedule_date = dto.getYear()
				+ ScheduleUtil.isTwo(dto.getMonth())
				+ ScheduleUtil.isTwo(dto.getDate())
				+ ScheduleUtil.isTwo(dto.getHour())
				+ ScheduleUtil.isTwo(dto.getMin());
//		boolean isS1 = service.scheduleinfoinsert(
//					dto2
//				);
		
		boolean isS = service.scheduleupdate(
					//schedule_id / mozzle_id / writer / 
					new ScheduleDto("0", dto.getMozzle_id(),dto.getWriter(),
							dto.getTitle(), dto.getContent(),
							schedule_date, null)
				);

		if(isS) {
			//이부분 연결 제대로하기
			return "redirect:scheduleselectOne.do?schedule_id="+dto.getSchedule_id();
		}else {
			model.addAttribute("msg", "일정수정실패!!");
			return "error";
		}
		
	}
}