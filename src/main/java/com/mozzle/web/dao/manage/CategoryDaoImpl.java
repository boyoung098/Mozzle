package com.mozzle.web.dao.manage;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mozzle.web.dto.manage.CategoryDto;
import com.mozzle.web.dto.manage.MozzleDto;

@Repository
public class CategoryDaoImpl implements ICategoryDao {

	@Autowired
	private SqlSessionTemplate session;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS ="com.mozzle.web.dao.manage.CategoryDaoImpl.";

	public int registCategory(String category) {
		logger.info("registCategory {}", category);
		return session.insert(NS + "registCategory", category);
	}
	
	@Override
	public int registMozzleCategory(Map<String, Object> map) {
		logger.info("registMozzleCategory {}", map);
		return session.insert(NS + "registMozzleCategory", map);
	}
	
	@Override
	public List<String> selectMozzleCategoryName(String mozzle_id) {
		logger.info("selectMozzleCategory {}", mozzle_id);
		return session.selectList(NS + "selectMozzleCategoryName", mozzle_id);
	}
	
	@Override
	public int deleteMozzleCategory(String mozzle_id) {
		logger.info("selectMozzleCategory {}", mozzle_id);
		return session.delete(NS + "deleteMozzleCategory", mozzle_id);
	}

	@Override
	public List<CategoryDto> seletCategoryAll() {
		logger.info("seletCategoryAll");
		return session.selectList(NS + "seletCategoryAll");
	}

	@Override
	public List<CategoryDto> seletCategoryByInitial01(Map<String, String> map) {
		logger.info("seletCategoryByInitial {}", map);
		return session.selectList(NS + "seletCategoryByInitial01", map);
	}
	
	@Override
	public List<CategoryDto> seletCategoryByInitial02(Map<String, String> map) {
		logger.info("seletCategoryByInitial {}", map);
		return session.selectList(NS + "seletCategoryByInitial02", map);
	}

	@Override
	public List<CategoryDto> searchCategory(String searchName) {
		logger.info("searchCategory {}", searchName);
		return session.selectList(NS + "searchCategory", searchName);
	}

	@Override
	public int selectCategoryCnt() {
		logger.info("selectCategoryCnt ");
		return session.selectOne(NS + "selectCategoryCnt");
	}
	
	@Override
	public int selectCategoryCnt01(Map<String, String> map) {
		logger.info("selectCategoryCnt01 {}", map);
		return session.selectOne(NS + "selectCategoryCnt01", map);
	}
	
	@Override
	public int selectCategoryCnt02(Map<String, String> map) {
		logger.info("selectCategoryCnt02 {}", map);
		return session.selectOne(NS + "selectCategoryCnt02", map);
	}

	@Override
	public int deleteCatogory(String category) {
		logger.info("deleteCatogory {}", category);
		return session.delete(NS + "deleteCatogory", category);
	}

	@Override
	public List<CategoryDto> selectCategoryByCnt() {
		logger.info("selectCategoryByCnt");
		return session.selectList(NS + "selectCategoryByCnt");
	}

	@Override
	public boolean duplicateCheck(String category_name) {
		logger.info("duplicateCheck {}", category_name);
		int cnt = session.selectOne(NS + "duplicateCheck", category_name);
		
		return (cnt==1)? true:false;
	}
}
