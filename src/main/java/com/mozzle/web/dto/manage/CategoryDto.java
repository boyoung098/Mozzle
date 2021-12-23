package com.mozzle.web.dto.manage;

public class CategoryDto {

	private String category_code;
	private String category_name;
	private String create_date;
	private String cnt;

	public CategoryDto() {
		
	}
	public CategoryDto(String category_code, String category_name) {
		super();
		this.category_code = category_code;
		this.category_name = category_name;
	}
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "CategoryDto [category_code=" + category_code + ", category_name=" + category_name + ", create_date="
				+ create_date + ", cnt=" + cnt + "]";
	}
}
