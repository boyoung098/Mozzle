package com.mozzle.web.ctrl.users;

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
import org.springframework.web.bind.annotation.RestController;

import com.mozzle.web.dto.board.PostReportDto;
import com.mozzle.web.dto.board.RowNum_Dto;
import com.mozzle.web.dto.users.MozzleUserDto;
import com.mozzle.web.service.users.IMozzleUserService;

@RestController
public class mozzleUserAdmin {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IMozzleUserService mozzleUserService;
	
	//신고 다중 부적절처리
	
	@PostMapping(value = "/adminmozzleOut2.do", produces = "application/text; charset=UTF-8;")
	public String adminmozzleOut2(HttpSession session, String outuserId, @ModelAttribute("mozzle_id") String mozzle_id, 
			HttpServletRequest req){
		Map<String,String[]> map = new HashMap<String,String[]>();
		log.info("삭제할 아이디를 받아옴??========={}",outuserId);
		MozzleUserDto userdto = new MozzleUserDto();
		userdto.setAuth_code("3");
		userdto.setUser_id(outuserId);
		userdto.setMozzle_id(mozzle_id);
		mozzleUserService.updateMozzleUserAuth(userdto);
		
		Map<String, String> mozzlemap = new HashMap<String, String>();
		mozzlemap.put("mozzle_id", mozzle_id);
		List<MozzleUserDto> mozzleuserList = mozzleUserService.selectListadminMozzleUser(mozzlemap);
		
		JSONObject json = null;
		
		json = objectJSON(mozzleuserList);
		//session.removeAttribute("row");
		//session.setAttribute("row", rowDto);
		
		return json.toString();
		
	}
	
	@SuppressWarnings({ "unchecked", "null" })
	public JSONObject objectJSON(List<MozzleUserDto> lists) //"lists" : [{},{}..],
			//RowNum_Dto row, // "row",{"","",""}
			//String mozzle_id) 
	{
		JSONObject json = new JSONObject(); // 전체 JSON 객체 {"lists": , "row":}
		JSONArray jlist = new JSONArray(); // lists의 여러개의 dto JSONObject를 담고 있는객체  [{},{}..]
		JSONObject jdto = null; // row에 관련된 JSONObject {"","",""}
		
		for (MozzleUserDto o : lists) {
			jdto = new JSONObject();
			jdto.put("user_id", o.getUser_id());
			jdto.put("auth_code", o.getAuth_code());
			jdto.put("birthday_show", o.getBirthday_show());
			jdto.put("image_origin", o.getImage_origin());
			jdto.put("image_saved", o.getImage_saved());
			jdto.put("joined_date", o.getJoined_date());
			jdto.put("mozzle_id", o.getMozzle_id());
			jdto.put("nickname", o.getNickname());
			
			jlist.add(jdto);
		}
		
		
		// 페이징에 관련된 처리
		//jdto = new JSONObject();
//		row.setMozzle_id(mozzle_id);
//		
//		jdto.put("pagelist", row.getPageList());
//		jdto.put("index", row.getIndex());
//		jdto.put("pagenum", row.getPageNum());
//		jdto.put("listnum", row.getListNum());
//		jdto.put("total", row.getTotal());
//		jdto.put("count", row.getCount());
//		
		json.put("lists", jlist);
//		json.put("row", jdto);
//		
		
		return json;
	}
}
