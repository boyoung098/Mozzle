package com.mozzle.web.ctrl.manage;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
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
public class ManageCtrl {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private IManageService service;
	
	@Autowired
	private ICategoryService service2;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@RequestMapping(value = "/home.do", method= RequestMethod.GET)
	public String home(Model model) {
		
		//임시 저장
		String user_id = "user01";
		//My 모즐
		List<MozzleDto> myMozzleList = service.selectMyMozzle(user_id);
		//새로 생긴 모즐
		List<MozzleDto> newMozzleList = service.selectMozzleByCreatDate();
		//HOT 모즐
		List<MozzleDto> hotMozzleList = service.selectMozzleByUserNumber();
		
		model.addAttribute("myMozzleList", myMozzleList);
		model.addAttribute("newMozzleList", newMozzleList);
		model.addAttribute("hotMozzleList", hotMozzleList);
		
		return "manage/index";
	}
	
	@RequestMapping(value = "/registMozzleForm.do", method= RequestMethod.GET)
	public String registMozzleForm() {

		return "manage/registMozzleForm";
	}
	
	@PostMapping("/imageUpload.do")
	public String registMozzle(MozzleDto mozzle, Model model, HttpServletRequest request) throws IllegalStateException, IOException{
		
		logger.info("imageUpload.do");
		logger.info("ManageCtrl의 registMozzle {}", mozzle);
		
//		logger.info(request.getParameter("mozzle_name"));
//		logger.info(request.getParameter("mozzle_intro"));
//		
//		logger.info(file.getName());
//		logger.info(String.valueOf(file.getSize()));
//		logger.info(file.getOriginalFilename());
		String image_origin = null; 
		String image_saved= null; 
		MultipartFile uploadImage = mozzle.getUploadFile();
	  
		if(!uploadImage.isEmpty()) { 
			image_origin = uploadImage.getOriginalFilename(); 
			String image_origin_extension = image_origin.substring(image_origin.lastIndexOf(".")); 
			image_saved = UUID.randomUUID().toString().replace("-", "") + image_origin_extension;

			Resource resource = resourceLoader.getResource("resources/upload/");	
	
			File file = new File(resource.getFile().getPath() +"\\"+ image_saved);
			
			System.out.println("====================================>"+ image_origin);
			System.out.println(resource.getFile().getPath() + "\\"+ image_saved);
			System.out.println("====================================>"+ image_saved); 
			
			uploadImage.transferTo(file);
			
			mozzle.setImage_origin(image_origin);
			mozzle.setImage_saved(image_saved);
		}
		
		if(mozzle.getState() != null) {
			mozzle.setState("Y");	
		} else {
			mozzle.setState("N");
		}
	
		int n = service.registMozzle(mozzle);
	
		if (n == 1) {
			model.addAttribute("result", "true");
			return "manage/registMozzleForm";
		} else {
			model.addAttribute("result", "false");
			return "manage/registMozzleForm";
		}	
	}
	
	@RequestMapping(value = "/modifyMozzleForm.do", method= RequestMethod.GET)
	public String modifyMozzleForm(Model model) {
		//모즐 아이디 1로 설정 (연결 후 삭제)
		String mozzle_id ="1";
		logger.info("modifyMozzleForm.do");
		
		MozzleDto mDto = service.selectMozzleByMozzleId(mozzle_id);
		
		if(mDto.getState().equals("Y")) {
			mDto.setState("checked");
			
		} else {
			mDto.setState(null);
		}
		
		model.addAttribute("mozzle", mDto);
		model.addAttribute("mozze_id", mozzle_id);
		
		return "manage/modifyMozzleForm";
	}
	
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
			
			System.out.println("====================================>"+ image_origin);
			System.out.println(resource.getFile().getPath() + "\\"+ image_saved);
			System.out.println("====================================>"+ image_saved); 
			
			uploadImage.transferTo(file);
			
			mozzle.setImage_origin(image_origin);
			mozzle.setImage_saved(image_saved);
		}	
		
		if(mozzle.getState() != null) {
			mozzle.setState("Y");	
		} else {
			mozzle.setState("N");
		}
			
		int n = service.updateMozzle(mozzle);
		
		if(n==1) {
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
		List<CategoryDto> cList = service2.seletCategoryAll();
		Map<String, Object> response = new HashMap<String, Object>();
		response.put("cList", cList);

		return response;
	}
	

}
