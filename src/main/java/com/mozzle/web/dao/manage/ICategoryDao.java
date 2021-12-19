package com.mozzle.web.dao.manage;

import java.util.List;

import com.mozzle.web.dto.manage.CategoryDto;

public interface ICategoryDao {
	
	public int registCategory(String category);
	public List<CategoryDto> seletCategoryAll();
	public List<CategoryDto> seletCategoryByInitial(int num);
	public List<CategoryDto> searchCategory(String searchName);
	public int selectCategoryCnt();

}
