package com.mozzle.web.ctrl.users;

import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.uuid.Generators;
import com.mozzle.web.dao.users.UuidUtil;

@Controller
public class GuestController {

	@RequestMapping(value="/guestInvite.do", method = RequestMethod.GET)
	public String guestInvite() {
		
		return "mozzle/guestInvite";
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
		
		UUID ud = UUID.fromString("e2b10cc1-58c8-11ec-bade-d9ac7fd025b4");
		
		//현재날짜
		Date today = new Date();
		System.out.println(today);
		
		//날짜비교하기
		System.out.println(UuidUtil.getDateFromUuid(ud).compareTo(today)); //-1
		System.out.println(today.compareTo(UuidUtil.getDateFromUuid(ud))); //1
		//System.out.println(nowdate.toString());
	}
}
