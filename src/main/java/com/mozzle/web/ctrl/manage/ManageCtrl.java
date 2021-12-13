package com.mozzle.web.ctrl.manage;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mozzle.web.dto.manage.MozzleDto;
import com.mozzle.web.service.manage.IManageService;

import org.springframework.core.io.Resource;

@Controller
@RequestMapping("/{manage}/")
public class ManageCtrl {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private IManageService service;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@RequestMapping(value = "/home.do", method= RequestMethod.GET)
	public String home(Model model) {
		
		List<MozzleDto> mList = service.selectMozzleByCreatDate();
		
		model.addAttribute("mList", mList);
		
		return "manage/index";
	}
	
	@RequestMapping(value = "/registMozzleForm.do", method= RequestMethod.GET)
	public String registMozzleForm() {

		return "manage/registMozzleForm";
	}
	
	@PostMapping("/imageUpload.do")
	public String registMozzle(MozzleDto mozzle, Model model, HttpServletRequest request
			/*
								 * HttpServletRequest request, HttpServletResponse
								 * response, @RequestParam("uploadFile") MultipartFile file
								 */) throws IllegalStateException, IOException{
		
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
//			out.println("<script>alert('모즐이 성공적으로 등록되었습니다');</script>");
//			out.flush();
//			return "redirect:/manage/home.do";
			return "manage/registMozzleForm";
		} else {
			model.addAttribute("result", "false");
//			out.println("<script>alert('등록을 실패했습니다');</script>");
//			out.flush();
			return "manage/registMozzleForm";
		}	
	}
	
	@RequestMapping(value = "/modifyMozzleForm.do", method= RequestMethod.GET)
	public String modifyMozzleForm(@RequestParam String mozzle_id, Model model) {
		
		logger.info("modifyMozzleForm.do");
		
		MozzleDto mDto = service.selectMozzleByMozzleId(mozzle_id);
		model.addAttribute("mDto", mDto);
		
		return "manage/modifyMozzleForm";
	}
	
}
