package com.mozzle.web.service.manage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mozzle.web.dao.manage.ICategoryDao;
import com.mozzle.web.dto.manage.CategoryDto;

@Service
public class CategoryServiceImpl implements ICategoryService {
	
	@Autowired
	ICategoryDao dao;

	@Override
	public int registCategory(String category) {
		return dao.registCategory(category);
	}
	
	@Override
	public int registMozzleCategory(Map<String, Object> map) {
		return dao.registMozzleCategory(map);
	}
	
	@Override
	public List<String> selectMozzleCategoryName(String mozzle_id) {
		return dao.selectMozzleCategoryName(mozzle_id);
	}

	@Override
	public int deleteMozzleCategory(String mozzle_id) {
		return dao.deleteMozzleCategory(mozzle_id);
	}

	@Override
	public List<CategoryDto> seletCategoryAll() {
		return dao.seletCategoryAll();
	}

	@Override
	public List<CategoryDto> seletCategoryByInitial(int num) {
		return dao.seletCategoryByInitial(num);
	}

	@Override
	public List<CategoryDto> searchCategory(String searchName) {
		return dao.searchCategory(searchName);
	}

	@Override
	public int selectCategoryCnt() {
		return dao.selectCategoryCnt();
	}

	@Override
	public int deleteCatogory(String category) {
		return dao.deleteCatogory(category);
	}

	@Override
	public List<CategoryDto> selectCategoryByCnt() {
		return dao.selectCategoryByCnt();
	}
}
