package com.mozzle.web.dao.manage;

import java.util.List;
import java.util.Map;

import com.mozzle.web.dto.manage.CategoryDto;
import com.mozzle.web.dto.manage.MozzleDto;

public interface ICategoryDao {
	
	public int registCategory(String category);
	
	public int registMozzleCategory(Map<String, Object> map);
	
	public List<String> selectMozzleCategoryName(String mozzle_id);
	
	public int deleteMozzleCategory(String mozzle_id);
	
	public List<CategoryDto> seletCategoryAll();
	
	public List<CategoryDto> seletCategoryByInitial01(Map<String, String> map);
	
	public List<CategoryDto> seletCategoryByInitial02(Map<String, String> map);
	
	public List<CategoryDto> searchCategory(String searchName);
	
	public int selectCategoryCnt();
	
	public int selectCategoryCnt01(Map<String, String> map);
	
	public int selectCategoryCnt02(Map<String, String> map);
	
	public int deleteCatogory(String category);
	
	public List<CategoryDto> selectCategoryByCnt();
	
	public boolean duplicateCheck(String category_name);

}
