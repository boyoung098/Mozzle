package com.mozzle.web.ctrl.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mozzle.web.dto.board.PostReportDto;
import com.mozzle.web.dto.board.RowNum_Dto;
import com.mozzle.web.service.board.IPostReportService;

@RestController
public class PageCtrl {

	@Autowired
	IPostReportService reportservice;
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	
	@PostMapping(value = "/page.do", produces = "application/text; charset=UTF-8;")
	public String paging(HttpSession session,RowNum_Dto rowDto, @ModelAttribute("mozzle_id") String mozzle_id, 
							HttpServletRequest req) {
		log.info("페이징 컨트롤러 세션 확인 페이지 {}",session.getAttribute("row"));
		log.info("페이징 컨트롤러 화면 요청값 {}", rowDto);
		log.info("페이징 컨트롤러 모즐아이디 {}", mozzle_id);
		JSONObject json = null;
		
		rowDto.setTotal(reportservice.postReportListTotal(mozzle_id));
		rowDto.setMozzle_id(mozzle_id);
		json = objectJSON(reportservice.selectPostReportList(rowDto),rowDto, mozzle_id);
		//session.removeAttribute("row");
		session.setAttribute("row", rowDto);
		
		return json.toString();
	}
	
	
	@SuppressWarnings({ "unchecked", "null" })
	public JSONObject objectJSON(List<PostReportDto> lists, //"lists" : [{},{}..],
			RowNum_Dto row, // "row",{"","",""}
			String mozzle_id) {
		JSONObject json = new JSONObject(); // 전체 JSON 객체 {"lists": , "row":}
		JSONArray jlist = new JSONArray(); // lists의 여러개의 dto JSONObject를 담고 있는객체  [{},{}..]
		JSONObject jdto = null; // row에 관련된 JSONObject {"","",""}
		
		for (PostReportDto o : lists) {
			jdto = new JSONObject();
			jdto.put("report_id", o.getReport_id());
			jdto.put("report_time", o.getReport_time());
			jdto.put("reporter", o.getReporter());
			jdto.put("reason", o.getReason());
			jdto.put("process", o.getProcess());
			jdto.put("user_id", o.getUser_id());
			jdto.put("content", o.getContent());
			jlist.add(jdto);
		}
		
		
		// 페이징에 관련된 처리
		jdto = new JSONObject();
		row.setMozzle_id(mozzle_id);
		
		jdto.put("pagelist", row.getPageList());
		jdto.put("index", row.getIndex());
		jdto.put("pagenum", row.getPageNum());
		jdto.put("listnum", row.getListNum());
		jdto.put("total", row.getTotal());
		jdto.put("count", row.getCount());
		
		json.put("lists", jlist);
		json.put("row", jdto);
		
		
		return json;
	}
	
	//신고 다중 부적절처리
	@PostMapping(value = "/inappropriate.do", produces = "application/text; charset=UTF-8;")
	public String inappropriate(HttpSession session,RowNum_Dto rowDto, @ModelAttribute("mozzle_id") String mozzle_id, 
			HttpServletRequest req, String[] chkArray){
		Map<String,String[]> map = new HashMap<String,String[]>();
		map.put("report_ids", chkArray);
		System.out.println("폼에서 받아온 chkArray"+chkArray);
		log.info("페이징 컨트롤러 세션 확인 페이지 {}",session.getAttribute("row"));
		log.info("페이징 컨트롤러 화면 요청값 {}", rowDto);
		log.info("페이징 컨트롤러 모즐아이디 {}", mozzle_id);
		//String user_id =  (String) req.getSession().getAttribute("userId");
		
		JSONObject json = null;
		reportservice.inappropriatePostReport(map);
		rowDto.setTotal(reportservice.postReportListTotal(mozzle_id));
		rowDto.setMozzle_id(mozzle_id);
		json = objectJSON(reportservice.selectPostReportList(rowDto),rowDto, mozzle_id);
		//session.removeAttribute("row");
		session.setAttribute("row", rowDto);
		
		return json.toString();
		
	}
	
	//삭제 다중 부적절처리
	@PostMapping(value = "/deleteadmin.do", produces = "application/text; charset=UTF-8;")
	public String deleteadmin(HttpSession session,RowNum_Dto rowDto, @ModelAttribute("mozzle_id") String mozzle_id, 
			HttpServletRequest req, String[] chkArray){
		Map<String,String[]> map = new HashMap<String,String[]>();
		map.put("report_ids", chkArray);
		System.out.println("폼에서 받아온 chkArray"+chkArray);
		log.info("페이징 컨트롤러 세션 확인 페이지 {}",session.getAttribute("row"));
		log.info("페이징 컨트롤러 화면 요청값 {}", rowDto);
		log.info("페이징 컨트롤러 모즐아이디 {}", mozzle_id);
		//String user_id =  (String) req.getSession().getAttribute("userId");
		
		JSONObject json = null;
		reportservice.deleteadminPostReport(map);
		rowDto.setTotal(reportservice.postReportListTotal(mozzle_id));
		rowDto.setMozzle_id(mozzle_id);
		json = objectJSON(reportservice.selectPostReportList(rowDto),rowDto, mozzle_id);
		//session.removeAttribute("row");
		session.setAttribute("row", rowDto);
		
		return json.toString();
		
	}
}
