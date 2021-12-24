package com.mozzle.web.ctrl.manage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

	@RequestMapping(value = "/adminIndex.do", method = RequestMethod.GET)
	public String home(Model model) {

		logger.info("AdminController의 home");
		List<CategoryDto> cList = service.seletCategoryAll();
		model.addAttribute("cList", cList);

		int cnt = service.selectCategoryCnt();
		model.addAttribute("cnt", cnt);

		return "manage/adminIndex";
	}

	@RequestMapping(value = "/searchCategory.do", method = RequestMethod.POST)
	public String searchCategory(@RequestParam String searchName, Model model) {

		logger.info("AdminController의 home");
		List<CategoryDto> cList = service.searchCategory(searchName);
		model.addAttribute("cList", cList);

		return "manage/adminIndex";
	}

	@RequestMapping(value = "/selectCategoryByCnt.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectCategoryByCnt() {

		logger.info("selectCategoryByCnt");
		List<CategoryDto> cList = service.selectCategoryByCnt();

		boolean isc = false;
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("cList", cList);
		resultMap.put("isc", true);

		return resultMap;
	}

	@RequestMapping(value = "/registIndex.do", method = RequestMethod.POST)
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
	
	
	@RequestMapping(value= "/duplicateCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean duplicateCheck(@RequestParam("category_name") String category_name) {
		
		logger.info("AdminController의 duplicateCheck {}", category_name);
		
		boolean result = service.duplicateCheck(category_name);
		
		return result; 
	}
	

	@RequestMapping(value = "/deleteCategory.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean deleteCategory(@RequestParam("category[]") List<String> categoryList) {

		logger.info("AdminController의 deleteCategory");

		int deleteCnt = 0;
		boolean result = false;

		for (String category : categoryList) {
			deleteCnt += service.deleteCatogory(category);
		}

		if (categoryList.size() == deleteCnt) {
			result = true;
		}

		return result;
	}

	@RequestMapping(value = "/selectInitial.do", method = RequestMethod.GET)
	public String selectInitial(HttpServletRequest request, Model model) {

		int cNum = Integer.parseInt(request.getParameter("cNum"));
		
		logger.info("selectInitial {}", cNum);

		Map<String, String> map = new HashMap<String, String>();

		if (cNum < 15) {
			if (cNum == 1) {

				map.put("initial_first", "가");
				map.put("initial_last", "낗");

			} else if (cNum == 2) {

				map.put("initial_first", "나");
				map.put("initial_last", "닣");

			} else if (cNum == 3) {

				map.put("initial_first", "다");
				map.put("initial_last", "띻");

			} else if (cNum == 4) {
				map.put("initial_first", "라");
				map.put("initial_last", "맇");

			} else if (cNum == 5) {

				map.put("initial_first", "마");
				map.put("initial_last", "밓");

			} else if (cNum == 6) {

				map.put("initial_first", "바");
				map.put("initial_last", "빟");

			} else if (cNum == 7) {

				map.put("initial_first", "사");
				map.put("initial_last", "싷");

			} else if (cNum == 8) {

				map.put("initial_first", "아");
				map.put("initial_last", "잏");

			} else if (cNum == 9) {

				map.put("initial_first", "자");
				map.put("initial_last", "찧");

			} else if (cNum == 10) {

				map.put("initial_first", "차");
				map.put("initial_last", "칳");

			} else if (cNum == 11) {

				map.put("initial_first", "카");
				map.put("initial_last", "킿");

			} else if (cNum == 12) {

				map.put("initial_first", "타");
				map.put("initial_last", "팋");

			} else if (cNum == 13) {

				map.put("initial_first", "파");
				map.put("initial_last", "핗");

			} else if (cNum == 14) {

				map.put("initial_first", "하");
				map.put("initial_last", "힣");

			}
			
			List<CategoryDto> cList = service.seletCategoryByInitial01(map);
			model.addAttribute("cList", cList);
			
			int cnt = service.selectCategoryCnt01(map);
			model.addAttribute("cnt", cnt);
		}

		if (cNum >= 15) {
			
			if (cNum == 15) {
				
				map.put("initial_lower", "a");
				map.put("initial_upper", "A");
			
			} else if (cNum == 16) {
				
				map.put("initial_lower", "b");
				map.put("initial_upper", "B");

			} else if (cNum == 17) {
				
				map.put("initial_lower", "c");
				map.put("initial_upper", "C");

			} else if (cNum == 18) {
				
				map.put("initial_lower", "d");
				map.put("initial_upper", "D");

			} else if (cNum == 19) {
				
				map.put("initial_lower", "e");
				map.put("initial_upper", "E");

			} else if (cNum == 20) {
				
				map.put("initial_lower", "f");
				map.put("initial_upper", "F");

			} else if (cNum == 21) {
				
				map.put("initial_lower", "g");
				map.put("initial_upper", "G");

			} else if (cNum == 22) {
				
				map.put("initial_lower", "h");
				map.put("initial_upper", "H");
				
			} else if (cNum == 23) {

				map.put("initial_lower", "i");
				map.put("initial_upper", "I");

			} else if (cNum == 24) {
				
				map.put("initial_lower", "j");
				map.put("initial_upper", "J");

			} else if (cNum == 25) {

				map.put("initial_lower", "k");
				map.put("initial_upper", "K");

			} else if (cNum == 26) {
				
				map.put("initial_lower", "l");
				map.put("initial_upper", "L");

			} else if (cNum == 27) {
				
				map.put("initial_lower", "m");
				map.put("initial_upper", "M");

			} else if (cNum == 28) {
				
				map.put("initial_lower", "n");
				map.put("initial_upper", "N");

			} else if (cNum == 29) {
				
				map.put("initial_lower", "o");
				map.put("initial_upper", "O");

			} else if (cNum == 30) {
				
				map.put("initial_lower", "p");
				map.put("initial_upper", "P");
				
			} else if (cNum == 31) {

				map.put("initial_lower", "q");
				map.put("initial_upper", "Q");
				
			} else if (cNum == 32) {

				map.put("initial_lower", "r");
				map.put("initial_upper", "R");
				
			} else if (cNum == 33) {

				map.put("initial_lower", "s");
				map.put("initial_upper", "S");
				
			} else if (cNum == 34) {

				map.put("initial_lower", "t");
				map.put("initial_upper", "T");
				
			} else if (cNum == 35) {

				map.put("initial_lower", "u");
				map.put("initial_upper", "U");
				
			} else if (cNum == 36) {

				map.put("initial_lower", "v");
				map.put("initial_upper", "V");
				
			} else if (cNum == 37) {

				map.put("initial_lower", "w");
				map.put("initial_upper", "W");
				
			} else if (cNum == 38) {

				map.put("initial_lower", "x");
				map.put("initial_upper", "X");
				
			} else if (cNum == 39) {

				map.put("initial_lower", "y");
				map.put("initial_upper", "Y");
				
			} else if (cNum == 40) {

				map.put("initial_lower", "z");
				map.put("initial_upper", "Z");
				
			}
			
			List<CategoryDto> cList = service.seletCategoryByInitial02(map);
			model.addAttribute("cList", cList);
			
			int cnt = service.selectCategoryCnt02(map);
			model.addAttribute("cnt", cnt);
		}

		return "manage/adminIndex";
	}

}
