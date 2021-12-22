package com.mozzle.web.dto.board;

import com.mozzle.web.dto.users.MozzleUserDto;

public class PostReportJoinDto {

	private String report_id;
	private String post_id;
	private String report_time;
	private String reporter;
	private String reason;
	private String process;
	
	private MozzlePostDto mpdto;
	private MozzleUserDto mudto;
	
	

	public MozzlePostDto getMpdto() {
		return mpdto;
	}

	public void setMpdto(MozzlePostDto mpdto) {
		this.mpdto = mpdto;
	}

	public MozzleUserDto getMudto() {
		return mudto;
	}

	public void setMudto(MozzleUserDto mudto) {
		this.mudto = mudto;
	}

	public String getReport_id() {
		return report_id;
	}

	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}

	public String getPost_id() {
		return post_id;
	}

	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}

	public String getReport_time() {
		return report_time;
	}

	public void setReport_time(String report_time) {
		this.report_time = report_time;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}
	
	
	


	@Override
	public String toString() {
		return "PostReportJoinDto [report_id=" + report_id + ", post_id=" + post_id + ", report_time=" + report_time
				+ ", reporter=" + reporter + ", reason=" + reason + ", process=" + process + ", mpdto=" + mpdto
				+ ", mudto=" + mudto + "]";
	}

	public PostReportJoinDto(String report_id, String post_id, String report_time, String reporter, String reason,
			String process, MozzlePostDto mpdto, MozzleUserDto mudto) {
		super();
		this.report_id = report_id;
		this.post_id = post_id;
		this.report_time = report_time;
		this.reporter = reporter;
		this.reason = reason;
		this.process = process;
		this.mpdto = mpdto;
		this.mudto = mudto;
	}

	public PostReportJoinDto(String report_id, String post_id, String report_time, String reporter, String reason,
			String process) {
		super();
		this.report_id = report_id;
		this.post_id = post_id;
		this.report_time = report_time;
		this.reporter = reporter;
		this.reason = reason;
		this.process = process;
	}


	public PostReportJoinDto() {}
}
