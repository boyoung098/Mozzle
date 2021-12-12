package com.mozzle.web.dto.manage;

public class CategoryDto {

	private String category_code;
	private String category_name;
	private int searchNum;

	public CategoryDto() {
		super();
		// TODO Auto-generated constructor stub
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
	public int getSearchNum() {
		return searchNum;
	}
	public void setSearchNum(int searchNum) {
		this.searchNum = searchNum;
	}
	@Override
	public String toString() {
		return "CategoryDto [category_code=" + category_code + ", category_name=" + category_name + "]";
	}
	
}
