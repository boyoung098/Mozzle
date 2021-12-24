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
	 * LOCATION_CODE
	 */
	private String schedule_id;//(pk)
	private int mozzle_id;//mozzle 아이디
	private String writer;//작성자(이름)
	private String title;//일정제목
	private String content;//일정내용
	private String schedule_date;//일정날짜
	private String regdate;//일정작성일
	private int location_code;//지도위치

	public ScheduleDto() {
		super();

	}

	public String getSchedule_id() {
		return schedule_id;
	}

	public void setSchedule_id(String schedule_id) {
		this.schedule_id = schedule_id;
	}

	public int getMozzle_id() {
		return mozzle_id;
	}

	public void setMozzle_id(int mozzle_id) {
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

	public int getLocation_code() {
		return location_code;
	}

	public void setLocation_code(int location_code) {
		this.location_code = location_code;
	}

	public ScheduleDto(String schedule_id, int mozzle_id, String writer, String title, String content,
			String schedule_date, String regdate, int location_code) {
		super();
		this.schedule_id = schedule_id;
		this.mozzle_id = mozzle_id;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.schedule_date = schedule_date;
		this.regdate = regdate;
		this.location_code = location_code;
	}

	@Override
	public String toString() {
		return "ScheduleDto [schedule_id=" + schedule_id + ", mozzle_id=" + mozzle_id + ", writer=" + writer
				+ ", title=" + title + ", content=" + content + ", schedule_date=" + schedule_date + ", regdate="
				+ regdate + ", location_code=" + location_code + "]";
	}



}