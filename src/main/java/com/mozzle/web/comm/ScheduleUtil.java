package com.mozzle.web.comm;

import java.util.Calendar;

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
	
	//1자리 문자열을 2자리 문자열로 변환하는 메서드
	public static String isTwo(String msg) {
		
		
		
		return msg.length()<2?"0"+msg:msg;
	}

}
