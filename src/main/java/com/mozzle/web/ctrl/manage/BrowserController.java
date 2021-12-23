package com.mozzle.web.ctrl.manage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String searchMozzleByWord(HttpServletRequest request, Model model, HttpSession session) {
		
		String keyword = request.getParameter("keyword");
		logger.info("BrowserController의 searchMozzleByWord {}" , keyword);
		List<MozzleDto> mLists = service.selectMozzleBySearchFromTheLastest(keyword);
		model.addAttribute("mLists", mLists);
		session.setAttribute("keyword", keyword);
		
		return "manage/browseMozzlePage";
	}
	
	@RequestMapping(value = "/browseMozzleFromTheLastest.do", method= RequestMethod.GET)
	public String MozzleFromTheLastest(@RequestParam("keyword") String keyword, Model model, HttpSession session, HttpServletRequest request) {
		
		logger.info("BrowserController의 searchMozzleByWord2");
		List<MozzleDto> mLists = service.selectMozzleBySearchFromTheLastest(keyword);
		model.addAttribute("mLists", mLists);
		session.setAttribute("keyword", keyword);
		
		return "manage/browseMozzlePage";
	}
	
	@RequestMapping(value = "/MozzleFromTheImportance.do", method= RequestMethod.GET) 
	
	public String MozzleFromTheImportance(@RequestParam("keyword") String keyword, Model model, HttpSession session) {
		
		logger.info("BrowserController의 searchMozzleByWord2");
		List<MozzleDto> mLists = service.selectMozzleBySearchBasedeOnImportance(keyword);
		session.setAttribute("keyword", keyword);
		model.addAttribute("mLists", mLists);
		
		return "manage/browseMozzlePage";
	}
}
