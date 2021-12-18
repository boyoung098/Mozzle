package com.mozzle.web.service.manage;

import java.util.List;

import com.mozzle.web.dto.manage.CategoryDto;

public interface ICategoryService {
	
	public int registCategory(String category);
	public List<CategoryDto> seletCategoryAll();
	public List<CategoryDto> seletCategoryByInitial(int num);
	public List<CategoryDto> searchCategory(String searchName);
	public int selectCategoryCnt();
	

}
