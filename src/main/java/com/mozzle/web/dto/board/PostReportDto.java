package com.mozzle.web.dto.board;

public class PostReportDto {

	private String report_id;
	private String post_id;
	private String report_time;
	private String reporter;
	private String reason;
	private String process;
	
	
	
	
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
		return "PostReportDto [report_id=" + report_id + ", post_id=" + post_id + ", report_time=" + report_time
				+ ", reporter=" + reporter + ", reason=" + reason + ", process=" + process + "]";
	}
	public PostReportDto(String report_id, String post_id, String report_time, String reporter, String reason,
			String process) {
		super();
		this.report_id = report_id;
		this.post_id = post_id;
		this.report_time = report_time;
		this.reporter = reporter;
		this.reason = reason;
		this.process = process;
	}
	
	public PostReportDto() {}
	
}
