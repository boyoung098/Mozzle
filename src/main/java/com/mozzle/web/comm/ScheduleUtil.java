package com.mozzle.web.comm;

//달력에서 사용하는 공통 기능을 정의
public class ScheduleUtil {
	
	//한자리를 두가지로 변경 202112 -> 20211212
	public static String isTwo(String month) {
		
		return (month.length()<2)?("0"+month):month;
		
	}
	
	//달력에 토요일 일요일 평일 글자색 변경
	public static String fontColor(int date, int dayofWeek) {
		int dayCal = (dayofWeek-1+date)%-7;
		if(dayCal==0) {
			//토요일
			return "bule";
		}else if(dayCal==1) {
			//일요일
			return "red";
			//평일
		}else {
			return "";
		}
	}
}
