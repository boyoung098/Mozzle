package com.mozzle.web.ctrl.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mozzle.web.dto.board.Board;
import com.mozzle.web.dto.manage.MozzleDto;
import com.mozzle.web.dto.users.MozzleUserDto;
import com.mozzle.web.service.board.IBoardService;
import com.mozzle.web.service.manage.ICategoryService;
import com.mozzle.web.service.manage.IManageService;
import com.mozzle.web.service.schedule.IScheduleServiceImpl;
import com.mozzle.web.service.users.IMozzleUserService;

@Controller
public class FirstBoardCtrl {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IBoardService serviceImple;
	
	@Autowired
	private IManageService mService;
	
	@Autowired
	private ICategoryService cService;
	
	@Autowired
	private IMozzleUserService mozzleUserService;
	
	//처음에 모즐클릭햇을때 뜨는화면에 필요한 값들을 보내준다.
	@RequestMapping(value="/firstmozzle.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String firstmozzle(Model model, @ModelAttribute("mozzle_id") String mozzle_id, HttpServletRequest req, @ModelAttribute("moveTo") String moveTo, HttpSession session) {
		
		//임현경 - 비공개 모즐의 경우 멤버 확인
		MozzleDto myMozzle = mService.selectMozzleByMozzleId(mozzle_id);
		String user_id = (String) session.getAttribute("userId");
		
		Map<String, String> checkInfoMap = new HashMap<String, String>();
		checkInfoMap.put("user_id", user_id);
		checkInfoMap.put("mozzle_id", mozzle_id);

		if(user_id != null && !user_id.equals("")) {
			boolean memberCheck = mService.checkMember(checkInfoMap);
			logger.info("checkMember {}", memberCheck);
				
			model.addAttribute("memberCheck", memberCheck);
			//임현경 - 모즐의 리더인지 확인
			boolean LederCheck = mService.checkMozzleLeader(checkInfoMap);
			logger.info("checkMozzleLeader {}", LederCheck);
			
			model.addAttribute("LederCheck", LederCheck);
		} 
		//김보영-모즐내회원리스트뿌리기
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id", mozzle_id);
		List<MozzleUserDto> mozzleuserList = mozzleUserService.selectListMozzleUser(map);
		model.addAttribute("mozzleuserList",mozzleuserList);
		//model.addAttribute("mozzle_id", mozzle_id);
		
		logger.info("moveTo의 값은==============={}",moveTo);
		logger.info("mozzle_id의 값은==============={}",mozzle_id);
		//이미지경로 뿌리기
		//String imagepath = "C:eclipse\workspace_Spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Mozzle\storage";
		//C:home\images\study.png
		
		//String path = req.getSession().getServletContext().getRealPath("/");
		//*************이미지 경로나옴!!!!!!!!!!!!!
	//끝
		
		//임현경 - mozzle 정보 + 카테고리 정보
		
		String create_date_origin = myMozzle.getCreate_date();
		int idx = create_date_origin.indexOf(" ");
		String create_date_posted = create_date_origin.substring(0, idx);
		myMozzle.setCreate_date(create_date_posted);
	
		model.addAttribute("myMozzle", myMozzle);
		
		List<String> categoryList = cService.selectMozzleCategoryName(mozzle_id);
		model.addAttribute("categoryList", categoryList);
	
		//김보영 - 모즐내 회원인지 select하여 값보내기
		String sessionid = (String)req.getSession().getAttribute("userId");
		System.out.println("============================="+sessionid);
		
			if(sessionid!=null) {
			map.put("user_id", sessionid);
			MozzleUserDto mozzleUserdto = mozzleUserService.selectMozzleUserByUserId(map);
			System.out.println("========================모즐내 회원인가 mozzleUserdto"+mozzleUserdto.toString());
			model.addAttribute("mozzleUserdto",mozzleUserdto);
			} else {
				
			}
			
			//김보영 모즐운영자정보
			MozzleUserDto mozzleLeader = mozzleUserService.selectmozzleUserLeader(mozzle_id);
			model.addAttribute("mozzleLeader",mozzleLeader);
//		
//		
//		if(mozzleUserdto !=null) {
//			model.addAttribute(mozzleUserdto);
//		}
//		
//		System.out.println("session=========="+mozzleUserdto.toString());
		return "mozzle/firstmozzle";
	}
	
	
	@Autowired
	private IScheduleServiceImpl schedule;

	/**
	 * 일정 전체 리스트
	 * @return
	 */
	@RequestMapping(value = "/calendar2.do", method = RequestMethod.GET)
	public String scheduleselectAll(HttpServletRequest request) {
		logger.info("ScheduleController 캘린더 출력");
		
		return "schedule/calendar2";
	}
	
	
	
}