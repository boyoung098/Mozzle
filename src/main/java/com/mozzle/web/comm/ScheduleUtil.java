package com.mozzle.web.comm;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.mozzle.web.dto.schedule.ScheduleDto;

//달력에서 사용하는 공통 기능을 정의
public class ScheduleUtil {

	// 토요일과 일요일을 확인해서 blue 또는 red 문자열을 반환하는 메서드
	public static String fontColor(int dayOfWeek, int i) {
		String color = "";
		if ((dayOfWeek - 1 + i) % 7 == 0) {// 토요일인 경우
			color = "blue";
		} else if ((dayOfWeek - 1 + i) % 7 == 1) {// 일요일인 경우
			color = "red";
		} else {
			color = "black";
		}

		return color;
	}

	public static String toDates(String schedule_date) {

		// 문자열 ---> date 타입으로 변환 ---> 문자열을 Date패턴으로 수정 --> Date타입으로 변환

		// 날짜형식 : yyyy-MM-dd hh:mm:ss
		String s = schedule_date.substring(0, 4) + "-" + schedule_date.substring(4, 6) + "-"
				+ schedule_date.substring(6, 8) + "" + schedule_date.substring(8, 10) + ":"
				+ schedule_date.substring(10) + ":00";
		System.out.println(s);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분");
		Timestamp tm = Timestamp.valueOf(s); // 문자열을 Date타입으로 변환
		return sdf.format(tm);
	}

	public static String isTwo(String msg) {
		
		return msg.length()<2?"0"+msg:msg;
	}
	

	public static String scheduleselectViewAll(int i, List<ScheduleDto> slist){
		String sd = isTwo(i+""); // schedule_date --> "05"
		String cList = ""; // 달력에 출력해줄 일정 제목을 저장할 변수
		for(ScheduleDto dto:slist) {
			if(dto.getSchedule_date().substring(6,8).equals(sd)) {
				cList+="<p>"
						+dto.getTitle()
						+"</p>";
			}
		}
		return cList; // 결과: "<p>title</p><p>title</p>"
	}

}
