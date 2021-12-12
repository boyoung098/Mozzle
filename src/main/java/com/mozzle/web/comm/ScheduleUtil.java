package com.mozzle.web.comm;

//달력에서 사용하는 공통 기능을 정의
public class ScheduleUtil {
	
	//한자리를 두가지로 변경 202112 -> 20211212
	public static String isTwo(String month) {
		
		return (month.length()<2)?("0"+month):month;
		
	}
	
}
