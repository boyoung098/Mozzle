package com.mozzle.web.ctrl.manage;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mozzle.web.dto.manage.CategoryDto;
import com.mozzle.web.service.manage.ICategoryService;

@Controller
public class CategoryController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ICategoryService service;
	
	@RequestMapping(value = "/adminIndex.do", method= RequestMethod.GET)
	public String home(Model model) {
		
		logger.info("AdminController의 home");
		List<CategoryDto> cList = service.seletCategoryAll();
		model.addAttribute("cList", cList);
		
		int cnt = service.selectCategoryCnt();
		model.addAttribute("cnt", cnt);
		
		return "manage/adminIndex";
	}
	
	@RequestMapping(value = "/searchCategory.do", method= RequestMethod.POST)
	public String searchCategory(@RequestParam String searchName, Model model) {
		
		logger.info("AdminController의 home");
		List<CategoryDto> cList = service.searchCategory(searchName);
		model.addAttribute("cList", cList);
		
		return "manage/adminIndex";
	}

	
	@RequestMapping(value = "/registIndex.do", method= RequestMethod.POST)
	@ResponseBody
	public boolean registCategory(@RequestParam("category[]") List<String> categoryList) {
		
		logger.info("AdminController의 registCategory");
		
		int insertCnt = 0;
		boolean result = false;
		
		for (String category : categoryList) {
			insertCnt += service.registCategory(category);
		}
		
		if (categoryList.size() == insertCnt) {
			result = true;
		}

		return result;
	}
	
	@RequestMapping(value= "/deleteCategory.do", method= RequestMethod.POST)
	@ResponseBody
	public boolean deleteCategory(@RequestParam("category[]") List<String> categoryList) {
			
		logger.info("AdminController의 deleteCategory");
		
		int deleteCnt = 0;
		boolean result = false;
		
		for (String category : categoryList) {
			deleteCnt += service.deleteCatogory(category);
		}
		
		if(categoryList.size() == deleteCnt) {
			result = true;
		}

		return result;
	}
	
}
