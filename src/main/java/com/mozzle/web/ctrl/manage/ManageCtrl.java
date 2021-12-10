package com.mozzle.web.ctrl.manage;

import java.io.File;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mozzle.web.dto.manage.MozzleDto;

@Controller
@RequestMapping("/{manage}/")
public class ManageCtrl {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private String image_saved;
	
	@RequestMapping(value = "/registMozzleForm.do", method = RequestMethod.GET)
	public String registMozzleForm() {

		return "manage/registMozzleForm";
	}
	
	@RequestMapping(value = "/registMozzle.do", method = RequestMethod.POST)
	public String registMozzle(MozzleDto mozzle, @RequestParam("image_origin") MultipartFile image){
	
		logger.info("ManageCtrl의 imageUpload {}");
		
		String image_origin = image.getOriginalFilename();
		String image_origin_extension = image_origin.substring(image_origin.lastIndexOf("."));
		String image_saved = UUID.randomUUID().toString().replace("-", "") + image_origin_extension;
		
		/* File file = new File(filePath + storedFileName); */
		

		return image_origin_extension;
		
		
		
		
		
	}
}
