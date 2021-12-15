package com.mozzle.web.ctrl.manage;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mozzle.web.dto.manage.MozzleDto;
import com.mozzle.web.service.manage.IManageService;

@Controller
public class BrowserController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private IManageService service;
	
	@RequestMapping(value = "/browseMozzlePage.do", method= RequestMethod.GET)
	public String searchMozzleByWord(Model model) {
		
		String keyword = "커";
		logger.info("BrowserController의 searchMozzleByWord");
		List<MozzleDto> mLists = service.selectMozzleBySearchFromTheLastest(keyword);
		model.addAttribute("mLists", mLists);
		
		return "manage/browseMozzlePage";
	}
	
	@RequestMapping(value = "/browseMozzleFromTheLastest.do", method= RequestMethod.GET)
	public String searchMozzleByWord2(Model model) {
		
		String keyword = "커";
		logger.info("BrowserController의 searchMozzleByWord2");
		List<MozzleDto> mLists = service.selectMozzleBySearchBasedeOnImportance(keyword);
		model.addAttribute("mLists", mLists);
		
		return "manage/browseMozzlePage";
	}
	
	@RequestMapping(value = "/selectCategoryRank.do", method= RequestMethod.GET)
	public String selectCategoryRank() {
		
		logger.info("BrowserController의 searchMozzleByWord2");;
		
		return null;
	}
}
