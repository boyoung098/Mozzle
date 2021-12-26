package com.mozzle.web.ctrl.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.mozzle.web.dto.board.PostReportDto;
import com.mozzle.web.dto.board.RowNum_Dto;
import com.mozzle.web.service.board.IPostReportService;

@Controller
public class PostReportCtrl {

	@Autowired
	IPostReportService reportservice;
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/postreportList.do") 
	public String postreportList(Model model, HttpSession session, @ModelAttribute("mozzle_id") String mozzle_id, HttpServletRequest req) {
		List<PostReportDto> lists = null;
		RowNum_Dto rowDto = null;
		
		if(req.getAttribute("row") == null) {
			rowDto = new RowNum_Dto();
		}else {
			rowDto = (RowNum_Dto)req.getAttribute("row");
		}
		rowDto.setMozzle_id(mozzle_id);
		rowDto.setTotal(reportservice.postReportListTotal(mozzle_id));
		lists = reportservice.selectPostReportList(rowDto);
		model.addAttribute("lists", lists);
		//model.addAttribute("row", rowDto);
		session.setAttribute("row", rowDto);
		return "mozzle/postreportList";
	}
	
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
	
	@RequestMapping(value="/reportPost.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String,String> reportPost(String post_id, String reason, HttpServletRequest req){
		Map<String,String> returnmap = new HashMap<String,String>();
		
		log.info("폼에서 받아온 post_id{}",post_id);
		log.info("폼에서 받아온 reason{}",reason);
		String user_id =  (String) req.getSession().getAttribute("userId");
		
		PostReportDto prDto = new PostReportDto();
		prDto.setPost_id(post_id);
		prDto.setReason(reason);
		prDto.setReporter(user_id);
		log.info("신고 DTO=========={}",prDto);
		int n= reportservice.insertPostReport(prDto);
		
		String result = null;
		if(n>0) {
			result = "true";
			
		} else {
			result = "false";
		}
		
		
		returnmap.put("count", result);
		return returnmap;
	}
	
	


	
}
