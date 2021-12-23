package com.mozzle.web.dto.board;

public class PostReportDto {

	private String report_id;//신고번호
	private String post_id; 
	private String report_time; //신고일자
	private String reporter; //신고자
	private String reason; //사유
	private String process; //신고처리
	private String user_id; //작성자
	private String content; //상세보기(글내용)
	
	
	
	
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
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	@Override
	public String toString() {
		return "PostReportDto [report_id=" + report_id + ", post_id=" + post_id + ", report_time=" + report_time
				+ ", reporter=" + reporter + ", reason=" + reason + ", process=" + process + ", user_id=" + user_id
				+ ", content=" + content + "]";
	}
	public PostReportDto(String report_id, String post_id, String report_time, String reporter, String reason,
			String process, String user_id, String content) {
		super();
		this.report_id = report_id;
		this.post_id = post_id;
		this.report_time = report_time;
		this.reporter = reporter;
		this.reason = reason;
		this.process = process;
		this.user_id = user_id;
		this.content = content;
	}
	public PostReportDto() {}
	
}
