package com.mozzle.web.dto.schedule;

import java.io.Serializable;

/**
 * Model Schedule 게시판에서 사용하는 Data Transfer Object POJO DTO 혹은 VO
 * 
 * @author hyuns
 * @since 2021-12-06
 */

public class ScheduleDto implements Serializable {

	private static final long serialVersionUID = 5523621886230321821L;

	/**
	 * SCHEDULE_ID,MOZZLE_ID,WIRTER,TITLE,CONTENT,SCHEDULE_DATE,REGDATE,
	 */
	private String schedule_id;//(pk)
	private String mozzle_id;//mozzle 아이디
	private String writer;//작성자(이름)
	private String title;//일정제목
	private String content;//일정내용
	private String schedule_date;//일정날짜
	private String regdate;//일정작성일
	
	//날짜 정보 파라미터를 받을 용도
	private String year;
	private String month;
	private String date;
	private String hour;
	private String min;
	
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

	public String getMin() {
		return min;
	}

	public void setMin(String min) {
		this.min = min;
	}

	public ScheduleDto() {
		super();

	}

	public String getSchedule_id() {
		return schedule_id;
	}

	public void setSchedule_id(String schedule_id) {
		this.schedule_id = schedule_id;
	}

	public String getMozzle_id() {
		return mozzle_id;
	}

	public void setMozzle_id(String mozzle_id) {
		this.mozzle_id = mozzle_id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSchedule_date() {
		return schedule_date;
	}

	public void setSchedule_date(String schedule_date) {
		this.schedule_date = schedule_date;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public ScheduleDto(String schedule_id, String mozzle_id, String writer, String title, String content,
			String schedule_date, String regdate) {
		super();
		this.schedule_id = schedule_id;
		this.mozzle_id = mozzle_id;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.schedule_date = schedule_date;
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ScheduleDto [schedule_id=" + schedule_id + ", mozzle_id=" + mozzle_id + ", writer=" + writer
				+ ", title=" + title + ", content=" + content + ", schedule_date=" + schedule_date + ", regdate="
				+ regdate + ", year=" + year + ", month=" + month + ", date=" + date + ", hour=" + hour + ", min=" + min
				+ "]";
	}

	



}