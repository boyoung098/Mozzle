package com.mozzle.web.ctrl.manage;

import java.io.File;
import java.util.Iterator;
import java.util.Map;

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
	
	@RequestMapping(value = "/registMozzleForm.do", method = RequestMethod.GET)
	public String registMozzleForm() {

		return "manage/registMozzleForm";
	}
	
	@RequestMapping(value = "/imageUpload.do")
	@ResponseBody
	public String imageUpload(MultipartHttpServletRequest multipartHttpServletRequest) {
		
		logger.info("ManageCtrl의 imageUpload {}");
		Iterator<String> itr = multipartHttpServletRequest.getFileNames();
		
		String filePath = "c:/test"
;		while (itr.hasNext()) {
			
			MultipartFile image = multipartHttpServletRequest.getFile(itr.next());
			
			// 원 파일명
			String image_orgin = image.getOriginalFilename();
			String image_saved = filePath+"/"+image_orgin; 
			
			 try {
	                image.transferTo(new File(image_saved)); //파일저장 실제로는 service에서 처리
	                
	                System.out.println("image_orgin======================= => "+image_orgin);
	                System.out.println("image_saved========================= => "+image_saved);
	     
	            } catch (Exception e) {
	                System.out.println("ERROR======>"+image_saved);
	                e.printStackTrace();
	            }
		}
		
		return "success";
	}
	
	@RequestMapping(value = "/registMozzle.do", method = RequestMethod.POST)
	public String registMozzle(MozzleDto mozzle) {
	
		return null;
	}
	
}
