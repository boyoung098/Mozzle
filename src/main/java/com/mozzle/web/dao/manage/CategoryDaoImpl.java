package com.mozzle.web.dao.manage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mozzle.web.dto.manage.CategoryDto;

@Repository
public class CategoryDaoImpl implements ICategoryDao {

	@Autowired
	private SqlSessionTemplate session;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS ="com.mozzle.web.dao.manage.CategoryDaoImpl.";

	public int registCategory(CategoryDto cDto) {
		logger.info("registCategory {}", cDto);
		return session.insert(NS + "registCategory") ;
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


}
