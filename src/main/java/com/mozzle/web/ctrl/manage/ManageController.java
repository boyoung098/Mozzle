package com.mozzle.web.ctrl.manage;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mozzle.web.dto.manage.CategoryDto;
import com.mozzle.web.dto.manage.MozzleDto;
import com.mozzle.web.service.manage.ICategoryService;
import com.mozzle.web.service.manage.IManageService;

import org.springframework.core.io.Resource;

@Controller
@RequestMapping("/{manage}/")
public class ManageController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private IManageService mService;
	
	@Autowired
	private ICategoryService cService;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@RequestMapping(value = "/registMozzleForm.do", method= RequestMethod.GET)
	public String registMozzleForm() {

		return "manage/registMozzleForm";
	}
	
	@Transactional
	@PostMapping("/registMozzle.do")
	public String registMozzle(MozzleDto mozzle, Model model, HttpServletRequest request) throws IllegalStateException, IOException{
		
		logger.info("imageUpload.do");
		logger.info("ManageCtrl의 registMozzle {}", mozzle);
		
		//리더 id를 담아줌
		String user_id = (String)request.getSession().getAttribute("userId");
		logger.info("HttpServletRequest에서 받아온 userId {}", user_id);
		//user_id를 leader_id로 지정
		mozzle.setLeader_id(user_id);
		
		String image_origin = null; 
		String image_saved= null; 
		MultipartFile uploadImage = mozzle.getUploadFile();
	  
		if(!uploadImage.isEmpty()) { 
			image_origin = uploadImage.getOriginalFilename(); 
			String image_origin_extension = image_origin.substring(image_origin.lastIndexOf(".")); 
			image_saved = UUID.randomUUID().toString().replace("-", "") + image_origin_extension;

			Resource resource = resourceLoader.getResource("resources/upload/");	
	
			File file = new File(resource.getFile().getPath() +"\\"+ image_saved);
			
			uploadImage.transferTo(file);
			
			mozzle.setImage_origin(image_origin);
			mozzle.setImage_saved(image_saved);
		}
		
		if(mozzle.getState() != null) {
			mozzle.setState("Y");	
		} else {
			mozzle.setState("N");
		}
		
		String mozzle_name = mozzle.getMozzle_name();
		String mozzle_name_escaped = mozzle_name.replace("<", "&lt;").replace("&", "&amp;");
		mozzle.setMozzle_name(mozzle_name_escaped);
		
		String mozzle_intro = mozzle.getMozzle_intro();
		String mozzle_intro_escaped = mozzle_intro.replace("<", "&lt;").replace("&", "&amp;");
		mozzle.setMozzle_intro(mozzle_intro_escaped);
		

		String mozzle_id = mService.createMozzleId();
		mozzle.setMozzle_id(mozzle_id);

		int checkNum01 = mService.registMozzle(mozzle);
		
		String category_code = mozzle.getCategory_code();
		String[] category_code_list = category_code.split(",");
		System.out.println(category_code_list.length);
		
		int checkNum02 = 0;
		for (String category_code_element : category_code_list) {
			System.out.println(category_code_element);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("category_code", category_code_element);
			map.put("mozzle_id", mozzle_id);
			
			checkNum02 += cService.registMozzleCategory(map);
		}

		model.addAttribute("mozzle_id", mozzle_id);

		if (checkNum01 == 2 && checkNum02 == category_code_list.length) {
			model.addAttribute("result", "true");
			return "manage/registMozzleForm";
		} else {
			model.addAttribute("result", "false");
			return "manage/registMozzleForm";
		}	
	}
	
	@RequestMapping(value="/mozzleNameCheck.do", method= RequestMethod.POST)
	@ResponseBody
	public int mozzleNameCheck(@RequestParam("mozzle_name") String mozzle_name) {
		logger.info("mozzleNameCheck {}", mozzle_name);
		int checkNum = mService.mozzleNameCheck(mozzle_name);
	
		return checkNum;
	}
	
	@RequestMapping(value = "/modifyMozzleForm.do", method= RequestMethod.GET)
	public String modifyMozzleForm(Model model, HttpServletRequest request) {
		
		String mozzle_id = (String) request.getParameter("mozzle_id");
		logger.info("modifyMozzleForm {}", mozzle_id);
		
		MozzleDto mDto = mService.selectMozzleByMozzleId(mozzle_id);
		
		List<String> categoryList = cService.selectMozzleCategoryName(mozzle_id);

		if(mDto.getState().equals("Y")) {
			mDto.setState("checked");
			
		} else {
			mDto.setState(null);
		}
	
		model.addAttribute("mozzle", mDto);
		model.addAttribute("mozze_id", mozzle_id);
		model.addAttribute("categoryList", categoryList);
		
		return "manage/modifyMozzleForm";
	}
	
	@Transactional
	@RequestMapping(value = "/modifyMozzle.do", method= RequestMethod.POST)
	public String modifyMozzle(MozzleDto mozzle, Model model, HttpServletRequest request) throws IOException {
		
		logger.info("ManageCtrl의 modifyMozzle {}", mozzle);
		
		String image_origin = null; 
		String image_saved= null; 
		MultipartFile uploadImage = mozzle.getUploadFile();
		
		if(!uploadImage.isEmpty()) { 
			image_origin = uploadImage.getOriginalFilename(); 
			String image_origin_extension = image_origin.substring(image_origin.lastIndexOf(".")); 
			image_saved = UUID.randomUUID().toString().replace("-", "") + image_origin_extension;

			Resource resource = resourceLoader.getResource("resources/upload/");	
	
			File file = new File(resource.getFile().getPath() +"\\"+ image_saved);
			
			uploadImage.transferTo(file);
			
			mozzle.setImage_origin(image_origin);
			mozzle.setImage_saved(image_saved);
		}	
		
		if(mozzle.getState() != null) {
			mozzle.setState("Y");	
		} else {
			mozzle.setState("N");
		}
		
		String mozzle_name = mozzle.getMozzle_name();
		String mozzle_name_escaped = mozzle_name.replace("<", "&lt;").replace("&", "&amp;");
		mozzle.setMozzle_name(mozzle_name_escaped);
		
		String mozzle_intro = mozzle.getMozzle_intro();
		String mozzle_intro_escaped = mozzle_intro.replace("<", "&lt;").replace("&", "&amp;");
		mozzle.setMozzle_intro(mozzle_intro_escaped);
		
		int checkNum01 = mService.updateMozzle(mozzle);
		
		String category_code = mozzle.getCategory_code();
		String[] category_code_list = category_code.split(",");
		
		String mozzle_id = mozzle.getMozzle_id();
		model.addAttribute("mozzle_id", mozzle_id);
		
		if (!category_code.equals("") && category_code != null) {	
			int deleteCategoryNum = cService.deleteMozzleCategory(mozzle_id);		
		
			for (String category_code_element : category_code_list) {
				System.out.println(category_code_element);
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("category_code", category_code_element);
				map.put("mozzle_id", mozzle_id);
				
				int insertCategoryNum = cService.registMozzleCategory(map);		
			}
		}
		
		if(checkNum01 == 1) {
			model.addAttribute("result", "true");
			return "manage/modifyMozzleForm";
			
		} else {
			model.addAttribute("result", "false");
			return "manage/modifyMozzleForm";
		}	
	}
	
	@RequestMapping(value = "/searchCategory.do", method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> searchCategory() {
		
		logger.info("AdminController의 home");
		List<CategoryDto> cList = cService.seletCategoryAll();
		Map<String, Object> response = new HashMap<String, Object>();
		response.put("cList", cList);

		return response;
	};
	
	@RequestMapping(value= "/deleteMozzle.do", method= RequestMethod.GET)
	@ResponseBody
	public boolean deleteMozzle(HttpServletRequest request) {
		
		String mozzle_id = request.getParameter("mozzle_id");
		
		boolean result = mService.deleteMozzle(mozzle_id);
		
		return result;
	}
}
