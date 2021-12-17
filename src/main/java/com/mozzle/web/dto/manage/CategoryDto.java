package com.mozzle.web.dto.manage;

public class CategoryDto {

	private String category_code;
	private String category_name;
	private String create_date;

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
}
