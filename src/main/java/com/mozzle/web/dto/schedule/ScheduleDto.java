package com.mozzle.web.dto.schedule;

import java.io.Serializable;
import java.util.Date;

/**
 * Schedule 게시판에서 사용하는 Data Transfer Object
 * POJO
 * DTO 혹은 VO
 * @author hyuns
 * @since 2021-12-06
 */

public class ScheduleDto implements Serializable{
	
	private static final long serialVersionUID = 5523621886230321821L;
	
	/**
	 * SCHEDULE_ID,MOZZLE_ID,WIRTER,TITLE,CONTENT,SCHEDULE_DATE,REGDATE,
	 * DELFLAG,LOCATION_CODE
	 */
	private String schedule_id;
	private int mozzle_id;
	private String writer;
	private String title;
	private String content;
	private Date schedule_date;
	private Date regdate;
	private String delflag;
	private String location_code;
	
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

	public Date getSchedule_date() {
		return schedule_date;
	}

	public void setSchedule_date(Date schedule_date) {
		this.schedule_date = schedule_date;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getDelflag() {
		return delflag;
	}

	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}

	public String getLocation_code() {
		return location_code;
	}

	public void setLocation_code(String location_code) {
		this.location_code = location_code;
	}

	public ScheduleDto(String schedule_id, int mozzle_id, String writer, String title, String content,
			Date schedule_date, Date regdate, String delflag, String location_code) {
		super();
		this.schedule_id = schedule_id;
		this.mozzle_id = mozzle_id;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.schedule_date = schedule_date;
		this.regdate = regdate;
		this.delflag = delflag;
		this.location_code = location_code;
	}

	@Override
	public String toString() {
		return "ScheduleDto [schedule_id=" + schedule_id + ", mozzle_id=" + mozzle_id + ", writer=" + writer
				+ ", title=" + title + ", content=" + content + ", schedule_date=" + schedule_date + ", regdate="
				+ regdate + ", delflag=" + delflag + ", location_code=" + location_code + "]";
	}
	
	
	
}
