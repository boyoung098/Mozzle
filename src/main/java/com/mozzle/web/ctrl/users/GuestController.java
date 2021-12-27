package com.mozzle.web.ctrl.users;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.uuid.Generators;
import com.mozzle.web.dao.users.UuidUtil;
import com.mozzle.web.dto.users.GuestDto;
import com.mozzle.web.dto.users.MozzleUserDto;
import com.mozzle.web.service.users.IGuestService;
import com.mozzle.web.service.users.IMozzleUserService;

@Controller
public class GuestController {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IGuestService guestService;
	
	@Autowired
	private IMozzleUserService mozzleUserService;
	
	@RequestMapping(value="/guestInvite.do", method = RequestMethod.GET)
	public String guestInvite(Model model, HttpServletRequest req, @ModelAttribute("mozzle_id") String mozzle_id) {
		UUID newuuid = UuidUtil.getTimeBasedUuid();
		String uuid = newuuid.toString();
		GuestDto guestDto = new GuestDto(mozzle_id,uuid);
		guestService.guestInsert(guestDto);
		
		String url = req.getRequestURL().toString();
		int n = url.lastIndexOf("/");
		String nowurl = url.substring(0,n);
		//임의로 추가한 mozzleEnter.do
		String guesturl = nowurl+"/guestEnter.do?uuid="+uuid;
		model.addAttribute("guesturl",guesturl);
		
		//모즐 리스트 뿌리기
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id", mozzle_id);
		List<MozzleUserDto> mozzleuserList = mozzleUserService.selectListMozzleUser(map);
		model.addAttribute("mozzleuserList",mozzleuserList);
		//=================
		
		
		return "mozzle/guestInviteURL";
	}
	
	@GetMapping(value="/guestEnter.do")
	public String guestCheck(String uuid,HttpServletResponse resp, Model model) throws IOException {
		UUID ud = UUID.fromString(uuid); //String -> UUID(형변환)
		Date date = (Date) UuidUtil.getDateFromUuid(ud); //UUID->Date
		Date today = new Date();
		int betweenDate = today.compareTo(UuidUtil.getDateFromUuid(ud));
		log.info("오늘이랑 받은 값 날짜 비교 {}",betweenDate);
		
		if(betweenDate > 7) {
			
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.println("<script>alert('링크의 유효기간인 7일이 경과되었습니다.'); location.href='../MozzleProject';</script>");
			writer.flush();
			//return "redirect:/";
		} else {
			//게스트가 들어갈수 있는 모즐메인페이지를 return시킨다
			GuestDto guestDto = guestService.selectByUUID(uuid);
			log.info("UUID를 통해 조회한 guestDto{}",guestDto);
			String mozzle_id = guestDto.getMozzle_id();
			model.addAttribute("mozzle_id",mozzle_id);
			return "redirect:/firstmozzle.do";
		}
		return null;
		
		
	}
	
	@GetMapping("/moveCheck.do")
	public String moveCheck() {
		
		return "mozzle/mozzleCheck";
	}
	
	@GetMapping("/moveguest.do")
	public String moveguest() {
		
		return "mozzle/boardmain";
	}
	
	
	public static void main(String[] args) {
		//String uuid = UUID.randomUUID().toString();
		
		//System.out.println(uuid);
		//789f5eea-dcdb-4956-90ce-1b5317b8d27b
		
		//시간기반
		//UUID uuid = Generators.timeBasedGenerator().generate();
		//System.out.println(uuid.toString());
		//7df9dcd5-5697-11ec-8672-85a69b93fd65
		//843048e3-5697-11ec-89eb-ed46ff8eebc2
		//33bb7c37-569a-11ec-b70d-2f2c2cf04c89
		
		//UUID uuidtime = generateType1UUID();
		//System.out.println(uuidtime.toString());
		
		//01ec56ed-c4eb-15e0-9978-7b275d1b7251
		//01ec56ee-35a3-11c5-9ff5-d3bab6144fdb
		//01ec56e6-abc0-1833-b9dc-5d74ac9e0caa
		
		
		//UUID생성 , 날짜로변환
		//UUID tuid = UuidUtil.getTimeBasedUuid();
		//System.out.println(tuid.toString());
//e2b10cc1-58c8-11ec-bade-d9ac7fd025b4
		//Date date = (Date) UuidUtil.getDateFromUuid(tuid);
		//System.out.println(date.toLocaleString());
		
		//String -> UUID
		
		//UUID ud = UUID.fromString("e2b10cc1-58c8-11ec-bade-d9ac7fd025b4");
		
		//현재날짜
		//Date today = new Date();
		//System.out.println(today);
		
		//날짜비교하기
		//System.out.println(UuidUtil.getDateFromUuid(ud).compareTo(today)); //-1
		//System.out.println(today.compareTo(UuidUtil.getDateFromUuid(ud))); //1
		//System.out.println(nowdate.toString());
	}
}
