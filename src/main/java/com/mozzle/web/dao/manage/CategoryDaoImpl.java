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
	public List<CategoryDto> seletCategoryByInitial(int num) {
		logger.info("seletCategoryByInitial {}", num);
		return session.selectList(NS + "seletCategoryByInitial", num);
	}

	@Override
	public List<CategoryDto> searchCategory(String searchName) {
		logger.info("searchCategory {}", searchName);
		return session.selectList(NS + "searchCategory", searchName);
	}

	@Override
	public int selectCategoryCnt() {
		logger.info("selectCategoryCnt {}");
		return session.selectOne(NS + "selectCategoryCnt");
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
}
