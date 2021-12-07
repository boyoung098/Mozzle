package com.mozzle.web.dto.manage;

public class ManageDto {

	private String mozzle_id;
	private String mozzle_name;
	private String mozzle_intro;
	private String create_date;
	private String image_origin;
	private String image_saved;
	private String category_code;
	private String state;
	private String delflag;
	private String category_name;
	
	public String getMozzle_id() {
		return mozzle_id;
	}
	public void setMozzle_id(String mozzle_id) {
		this.mozzle_id = mozzle_id;
	}
	public String getMozzle_name() {
		return mozzle_name;
	}
	public void setMozzle_name(String mozzle_name) {
		this.mozzle_name = mozzle_name;
	}
	public String getMozzle_intro() {
		return mozzle_intro;
	}
	public void setMozzle_intro(String mozzle_intro) {
		this.mozzle_intro = mozzle_intro;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getImage_origin() {
		return image_origin;
	}
	public void setImage_origin(String image_origin) {
		this.image_origin = image_origin;
	}
	public String getImage_saved() {
		return image_saved;
	}
	public void setImage_saved(String image_saved) {
		this.image_saved = image_saved;
	}
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
}
