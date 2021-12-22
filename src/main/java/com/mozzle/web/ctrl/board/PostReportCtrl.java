package com.mozzle.web.ctrl.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mozzle.web.dto.users.MozzleUserDto;
import com.mozzle.web.service.board.IPostReportService;

@Controller
public class PostReportCtrl {

	@Autowired
	IPostReportService reportservice;
	
	@RequestMapping(value="/checkPostId.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String,String> mozzleUpdateBefore(String post_id){
		int n = reportservice.selectCntByPostId(post_id);
		String result = null;
		if(n==0) {
			result = "true";
			
		} else {
			result = "false";
		}
		
		Map<String,String> returnmap = new HashMap<String,String>();
		returnmap.put("count", result);
		return returnmap;
	}
	
	@RequestMapping(value="/reportPostForm.do")
	public String reportPostForm() {
		
		return "mozzle/reportPostForm";
	}
	
	
}
