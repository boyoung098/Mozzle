package com.mozzle.web.dto.board;

public class MozzlePostDto {

	private String post_id;
	private String mozzle_id;
	private String user_id;
	private String content;
	private int refer;
	private int step;
	private int depth;
	private String regdate;
	private String delflag;
	private String keyword;
	private String user_img;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getMozzle_id() {
		return mozzle_id;
	}
	public void setMozzle_id(String mozzle_id) {
		this.mozzle_id = mozzle_id;
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
	public int getRefer() {
		return refer;
	}
	public void setRefer(int refer) {
		this.refer = refer;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	@Override
	public String toString() {
		return "MozzlePostDto [post_id=" + post_id + ", mozzle_id=" + mozzle_id + ", user_id=" + user_id + ", content=" + content + ", refer=" + refer + ", step=" + step + ", depth=" + depth
				+ ", regdate=" + regdate + ", delflag=" + delflag + "]";
	}
}
