package com.mozzle.web.ctrl.manage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
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
		
		return "manage/adminIndex";
	}
	
	@RequestMapping(value = "/searchCategory.do", method= RequestMethod.POST)
	public String searchCategory(@RequestParam String searchName, Model model) {
		
		logger.info("AdminController의 home");
		List<CategoryDto> cList = service.searchCategory(searchName);
		model.addAttribute("cList", cList);
		
		return "manage/adminIndex";
	}

	
	@RequestMapping(value = "/registIndex.do", method= RequestMethod.GET)
	public String registCategory(CategoryDto cDto) {
		
		logger.info("AdminController의 home");
		int num = service.registCategory(cDto);

		return "manage/adminIndex";
		
	}
}
