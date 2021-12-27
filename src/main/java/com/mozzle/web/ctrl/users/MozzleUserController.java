package com.mozzle.web.ctrl.users;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.mozzle.web.dto.users.MozzleUserDto;
import com.mozzle.web.service.notice.INoticeService;
import com.mozzle.web.service.users.IMozzleUserService;

@Controller
public class MozzleUserController {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IMozzleUserService mozzleUserService;
	
	@Autowired
	private INoticeService nservice;
	
//	//모즐로 이동
//	@GetMapping(value="/mozzle/mozzleMove.do")
//	public String mozzleMove(@ModelAttribute("mozzle_id") String mozzle_id, Model model, HttpServletRequest req) {
//		log.info("이동할 mozzle_id는{}",mozzle_id);
//		
//		//모즐내 회원인지 확인하는 로직필요*****************
//		
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("mozzle_id", mozzle_id);
//		List<MozzleUserDto> mozzleuserList = mozzleUserService.selectListMozzleUser(map);
//		model.addAttribute("mozzleuserList",mozzleuserList);
//		//model.addAttribute("mozzle_id", mozzle_id);
//		
//		//이미지경로 뿌리기
//		//String imagepath = "C:eclipse\workspace_Spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Mozzle\storage";
//		//C:home\images\study.png
//		
//		//String path = req.getSession().getServletContext().getRealPath("/");
//		//*************이미지 경로나옴!!!!!!!!!!!!!
//		
//		
//		return "mozzle/board";
//	}

	@RequestMapping(value="/mozzlememberList.do", method = RequestMethod.GET)
	public String mozzlememberList(Model model, @ModelAttribute("mozzle_id") String mozzle_id, HttpServletRequest req) {
		//김보영-모즐내회원리스트뿌리기
				Map<String, String> map = new HashMap<String, String>();
				map.put("mozzle_id", mozzle_id);
				List<MozzleUserDto> mozzleuserList = mozzleUserService.selectListMozzleUser(map);
				model.addAttribute("mozzleuserList",mozzleuserList);
				//model.addAttribute("mozzle_id", mozzle_id);
				
				//이미지경로 뿌리기
				//String imagepath = "C:eclipse\workspace_Spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Mozzle\storage";
				//C:home\images\study.png
				
				//String path = req.getSession().getServletContext().getRealPath("/");
				//*************이미지 경로나옴!!!!!!!!!!!!!
			//끝
		return "mozzle/mozzleMemberList";
	}
	
	//운영자권한
	@RequestMapping(value="/adminmozzleMemberList.do", method = RequestMethod.GET)
	public String adminmozzleMemberList(Model model, @ModelAttribute("mozzle_id") String mozzle_id, HttpServletRequest req) {
		//김보영-모즐내회원리스트뿌리기
				Map<String, String> map = new HashMap<String, String>();
				map.put("mozzle_id", mozzle_id);
				List<MozzleUserDto> mozzleuserList = mozzleUserService.selectListadminMozzleUser(map);
				model.addAttribute("mozzleuserList",mozzleuserList);
				//model.addAttribute("mozzle_id", mozzle_id);
				
				//이미지경로 뿌리기
				//String imagepath = "C:eclipse\workspace_Spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Mozzle\storage";
				//C:home\images\study.png
				
				//String path = req.getSession().getServletContext().getRealPath("/");
				//*************이미지 경로나옴!!!!!!!!!!!!!
			//끝
		return "mozzle/adminmozzleMemberList";
	}
	

	//운영자권한 리스트전체 (권한상관없이_)
	@RequestMapping(value="/adminmozzleMemberList2.do", method = RequestMethod.GET)
	public String adminmozzleMemberList2(Model model, @ModelAttribute("mozzle_id") String mozzle_id, HttpServletRequest req) {
		//김보영-모즐내회원리스트뿌리기
				Map<String, String> map = new HashMap<String, String>();
				map.put("mozzle_id", mozzle_id);
				List<MozzleUserDto> mozzleuserList = mozzleUserService.selectListadminMozzleUser2(map);
				model.addAttribute("mozzleuserList",mozzleuserList);
				//model.addAttribute("mozzle_id", mozzle_id);
				
				//이미지경로 뿌리기
				//String imagepath = "C:eclipse\workspace_Spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Mozzle\storage";
				//C:home\images\study.png
				
				//String path = req.getSession().getServletContext().getRealPath("/");
				//*************이미지 경로나옴!!!!!!!!!!!!!
			//끝
		return "mozzle/adminmozzleMemberList2";
  }
	// 리더 위임 권한이 가능한 멤버 리스트
	// 작성자 : 이종표
	@RequestMapping(value = "/delegateMemberList.do", method = RequestMethod.GET)
	public String delegateMemberList(String mozzle_id, String delegate, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id", mozzle_id);
		map.put("delegate", delegate);
		List<MozzleUserDto> mozzleuserList = mozzleUserService.selectListadminMozzleUser(map);
		model.addAttribute("mozzleuserList",mozzleuserList);

		return "mozzle/adminmozzleMemberList";

	}
	
	//ajax로 닉네임서치값을 받아서 map 형태로 찾은 리스트들 보내기
	@RequestMapping(value="/mozzleUserSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,List<MozzleUserDto> > mozzleUserSearch(String nickname, @ModelAttribute("mozzle_id") String mozzle_id){
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id", mozzle_id);
		map.put("nickname", nickname);
		List<MozzleUserDto> mozzleuserList = mozzleUserService.selectListMozzleUser(map);
		Map<String,List<MozzleUserDto>> returnmap = new HashMap<String,List<MozzleUserDto>>();
		returnmap.put("mozzleuserList", mozzleuserList);
		return returnmap;
	}
	
	//운영자권한
	@RequestMapping(value="/adminmozzleUserSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,List<MozzleUserDto> > adminmozzleUserSearch(String nickname, @ModelAttribute("mozzle_id") String mozzle_id){
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id", mozzle_id);
		map.put("nickname", nickname);
		List<MozzleUserDto> mozzleuserList = mozzleUserService.selectListadminMozzleUser(map);
		Map<String,List<MozzleUserDto>> returnmap = new HashMap<String,List<MozzleUserDto>>();
		returnmap.put("mozzleuserList", mozzleuserList);
		return returnmap;
	}
	
	
	//운영자권한 강퇴
	@RequestMapping(value="/adminmozzleOut.do", method = RequestMethod.GET)
	public String adminmozzleOut(String user_id, @ModelAttribute("mozzle_id") String mozzle_id, Model model, HttpSession session){
		log.info("삭제할 아이디를 받아옴??========={}",user_id);
		MozzleUserDto userdto = new MozzleUserDto();
		userdto.setAuth_code("3");
		userdto.setUser_id(user_id);
		userdto.setMozzle_id(mozzle_id);
		mozzleUserService.updateMozzleUserAuth(userdto);
		//model.addAttribute("moveTo","adminmozzleMemberList");
		session.setAttribute("moveTo", "adminmozzleMemberList");
		return "redirect:/firstmozzle.do";
	}
	
	//운영자권한 복구
		@RequestMapping(value="/adminmozzleIn.do", method = RequestMethod.GET)
		public String adminmozzleIn(String user_id, @ModelAttribute("mozzle_id") String mozzle_id, Model model, HttpSession session){
			log.info("복구할 아이디를 받아옴??========={}",user_id);
			MozzleUserDto userdto = new MozzleUserDto();
			userdto.setAuth_code("2");
			userdto.setUser_id(user_id);
			userdto.setMozzle_id(mozzle_id);
			mozzleUserService.updateMozzleUserAuth(userdto);
			//model.addAttribute("moveTo","adminmozzleMemberList");
			session.setAttribute("moveTo", "adminmozzleMemberList");
			return "redirect:/firstmozzle.do";
		}
		
		//운영자권한 권한위임
				@RequestMapping(value="/adminmozzlechangeAuth.do", method = RequestMethod.GET)
				public String adminmozzlechanAuth(String user_id, @ModelAttribute("mozzle_id") String mozzle_id, Model model, HttpSession session){
					log.info("리더로 위임할 아이디를 받아옴??========={}",user_id);
					String leaderId = (String) session.getAttribute("userId");
					Map<String,String> newLeader = new HashMap<String, String>();
					newLeader.put("mozzle_id", mozzle_id);
					newLeader.put("user_id", user_id);
					mozzleUserService.changeMozzleAuth(leaderId, newLeader);
					//session.setAttribute("moveTo", "adminmozzleMemberList");
					return "redirect:/firstmozzle.do";
				}
				
				
				
		//모즐회원탈퇴
				@RequestMapping(value="/deleteuserMozzle.do", method = RequestMethod.GET)
				public String deleteuserMozzle( @ModelAttribute("mozzle_id") String mozzle_id, Model model, HttpSession session){
					String userId = (String) session.getAttribute("userId");
					MozzleUserDto userdto = new MozzleUserDto();
					userdto.setUser_id(userId);
					userdto.setMozzle_id(mozzle_id);
					
					mozzleUserService.deleteMozzleUser(userdto);
					
					
					
					return "redirect:/firstmozzle.do";
				}			
		

	@RequestMapping(value="/mozzleJoinBefore.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String,String> mozzleJoinBefore(String nickname, @ModelAttribute("mozzle_id") String mozzle_id){
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id", mozzle_id);
		map.put("nickname", nickname);
		MozzleUserDto dto = mozzleUserService.selectMozzleUser(map);
		String TF = "true";
		if(dto!=null) {
			TF = "false";
		}
		Map<String,String> returnmap = new HashMap<String,String>();
		returnmap.put("TF", TF);
		return returnmap;
	}
	
	//유저가 모즐내 가입할때
	@PostMapping(value = "/mozzleUserRegist.do")
	public String mozzleUserRegist(HttpServletRequest req, Model model, MozzleUserDto mozzleUserDto,
										BindingResult result, @ModelAttribute("mozzle_id") String mozzle_id, HttpServletResponse resp) throws IOException {
		
		
		MultipartFile file = mozzleUserDto.getFile();
		System.out.println("*************file:"+file); 
		//org.springframework.web.multipart.commons.CommonsMultipartFile@515a98d6
		
		String fileName = file.getOriginalFilename();
		if(fileName!="") {
			mozzleUserDto.setImage_origin(fileName);
			String image_saved = UUID.randomUUID().toString();
//			int point = fileName.indexOf(".");
//			String filepackager = fileName.substring(point);
			String finalimage = image_saved + ".png";
			mozzleUserDto.setImage_saved(finalimage);
			
			
			//파일업로드절차=============================================
			InputStream inputStream = null;
			OutputStream outputStream = null;
			
			String path = null;
			
			try {
				inputStream = file.getInputStream();
				System.out.println("inputStream ======="+inputStream);
				//java.io.FileInputStream@679bb012
				
				//배포전 절대경로 path
				//path = req.getServletPath();
				//path = req.getContextPath(); MozzleProject
				
				//System.out.println(path);
				
				//배포할때 아래 방법쓰기
				path = WebUtils.getRealPath(req.getSession().getServletContext(),"/storage");
				System.out.println("path ======"+path); 
				//C:\eclipse\workspace_Spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Mozzle\storage
				
				
				//만약 저장위치가 없다
				File storage = new File(path);
				if(!storage.exists()) {
					storage.mkdirs();
				}
				
				//저장할 파일이 없다면 만들어주고 override함
				File newfile = new File(path+"/"+finalimage);
				if(!newfile.exists()) {
					newfile.createNewFile();
				}
				
				//파일을 쓸 위치를 지정해줌
				outputStream = new FileOutputStream(newfile);
				
				//파일을 써줌 (우리가 가져온 파일은 0101)
				int read = 0;
				byte[] n = new byte[(int)file.getSize()];
				while((read = inputStream.read(n))!= -1) {
					outputStream.write(n,0,read);
				}
				
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					inputStream.close();
					outputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			//파일업로드절차=============================================
			
		}
		System.out.println("************fileName:"+fileName); //Capture001.png
		
		
		String userId = (String)req.getSession().getAttribute("userId");
		mozzleUserDto.setUser_id(userId);
		System.out.println("====mozzleUserDto:"+mozzleUserDto.toString());
		int resultcnt = mozzleUserService.insertMozzleUser(mozzleUserDto);
		
		if(resultcnt==0) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.println("<script>alert('모즐가입에 실패하셨습니다. 다시 시도해주세요.'); location.href='./firstmozzle.do?mozzle_id="+mozzle_id+"';</script>");
			writer.flush();
		} else {
			Map<String, String> map = new HashMap<String, String>();
			map.put("user_id", userId);
			map.put("mozzle_id", mozzleUserDto.getMozzle_id());
			nservice.registerMozzleNotice(map);
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.println("<script>alert('모즐가입에 성공하셨습니다.'); location.href='./firstmozzle.do?mozzle_id="+mozzle_id+"';</script>");
			writer.flush();
			
		}
		
		
		return null;
	}
	
	@RequestMapping(value="/mozzleUpdateBefore.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String,String> mozzleUpdateBefore(String nickname, @ModelAttribute("mozzle_id") String mozzle_id){
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id", mozzle_id);
		map.put("nickname", nickname);
		MozzleUserDto dto = mozzleUserService.selectMozzleUser(map);
		String TF = "true";
		if(dto!=null) {
			TF = "false";
		}
		Map<String,String> returnmap = new HashMap<String,String>();
		returnmap.put("TF", TF);
		return returnmap;
	}
	
	//유저가 모즐내 업데이트할때(처음)
//		@ResponseBody
//		@PostMapping(value = "/mozzleUpdate.do")
//		public String mozzleUserUpdate(HttpServletRequest req, Model model, MozzleUserDto mozzleUserDto,
//											BindingResult result, @ModelAttribute("mozzle_id") String mozzle_id, HttpServletResponse resp) throws IOException {
//			
//			
//			
//			MultipartFile file = mozzleUserDto.getFile();
//			System.out.println("*************file:"+file); 
//			//org.springframework.web.multipart.commons.CommonsMultipartFile@515a98d6
//			
//			String fileName = file.getOriginalFilename();
//			if(fileName!="") {
//				mozzleUserDto.setImage_origin(fileName);
//				String image_saved = UUID.randomUUID().toString();
////				int point = fileName.indexOf(".");
////				String filepackager = fileName.substring(point);
//				String finalimage = image_saved + ".png";
//				mozzleUserDto.setImage_saved(finalimage);
//				
//				
//				//파일업로드절차=============================================
//				InputStream inputStream = null;
//				OutputStream outputStream = null;
//				
//				String path = null;
//				
//				try {
//					inputStream = file.getInputStream();
//					System.out.println("inputStream ======="+inputStream);
//					//java.io.FileInputStream@679bb012
//					
//					//배포전 절대경로 path
//					//path = req.getServletPath();
//					//path = req.getContextPath(); MozzleProject
//					
//					//System.out.println(path);
//					
//					//배포할때 아래 방법쓰기
//					path = WebUtils.getRealPath(req.getSession().getServletContext(),"/storage");
//					System.out.println("path ======"+path); 
//					//C:\eclipse\workspace_Spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Mozzle\storage
//					
//					
//					//만약 저장위치가 없다
//					File storage = new File(path);
//					if(!storage.exists()) {
//						storage.mkdirs();
//					}
//					
//					//저장할 파일이 없다면 만들어주고 override함
//					File newfile = new File(path+"/"+finalimage);
//					if(!newfile.exists()) {
//						newfile.createNewFile();
//					}
//					
//					//파일을 쓸 위치를 지정해줌
//					outputStream = new FileOutputStream(newfile);
//					
//					//파일을 써줌 (우리가 가져온 파일은 0101)
//					int read = 0;
//					byte[] n = new byte[(int)file.getSize()];
//					while((read = inputStream.read(n))!= -1) {
//						outputStream.write(n,0,read);
//					}
//					
//					
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				} finally {
//					try {
//						inputStream.close();
//						outputStream.close();
//					} catch (IOException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
//				}
//				//파일업로드절차=============================================
//				
//			}
//			System.out.println("************fileName:"+fileName); //Capture001.png
//			
//			
//			String userId = (String)req.getSession().getAttribute("userId");
//			mozzleUserDto.setUser_id(userId);
//			System.out.println("====mozzleUserDto수정!!!!:"+mozzleUserDto.toString());
//			int resultcnt = mozzleUserService.updateMozzleUser(mozzleUserDto);
//			
//			String msg =null;
//			
//			if(resultcnt == 0) {
//				msg="nochange";
//				
//			} else {
//				msg ="change";
//			}
//			
//			
//			return msg;
//		}
	
	
	
	
	
	
	
	//유저가 모즐내 업데이트할때(수정본)
			@ResponseBody
			@PostMapping(value = "/mozzleUpdate.do")
			public Map<String,MozzleUserDto > mozzleUserUpdate(HttpServletRequest req, Model model, MozzleUserDto mozzleUserDto,
												BindingResult result, @ModelAttribute("mozzle_id") String mozzle_id, HttpServletResponse resp) throws IOException {
				
				
				MultipartFile file = mozzleUserDto.getFile();
				System.out.println("*************file:"+file); 
				//org.springframework.web.multipart.commons.CommonsMultipartFile@515a98d6
				
				String fileName = file.getOriginalFilename();
				if(fileName!="") {
					mozzleUserDto.setImage_origin(fileName);
					String image_saved = UUID.randomUUID().toString();
//					int point = fileName.indexOf(".");
//					String filepackager = fileName.substring(point);
					String finalimage = image_saved + ".png";
					mozzleUserDto.setImage_saved(finalimage);
					
					
					//파일업로드절차=============================================
					InputStream inputStream = null;
					OutputStream outputStream = null;
					
					String path = null;
					
					try {
						inputStream = file.getInputStream();
						System.out.println("inputStream ======="+inputStream);
						//java.io.FileInputStream@679bb012
						
						//배포전 절대경로 path
						//path = req.getServletPath();
						//path = req.getContextPath(); MozzleProject
						
						//System.out.println(path);
						
						//배포할때 아래 방법쓰기
						path = WebUtils.getRealPath(req.getSession().getServletContext(),"/storage");
						System.out.println("path ======"+path); 
						//C:\eclipse\workspace_Spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Mozzle\storage
						
						
						//만약 저장위치가 없다
						File storage = new File(path);
						if(!storage.exists()) {
							storage.mkdirs();
						}
						
						//저장할 파일이 없다면 만들어주고 override함
						File newfile = new File(path+"/"+finalimage);
						if(!newfile.exists()) {
							newfile.createNewFile();
						}
						
						//파일을 쓸 위치를 지정해줌
						outputStream = new FileOutputStream(newfile);
						
						//파일을 써줌 (우리가 가져온 파일은 0101)
						int read = 0;
						byte[] n = new byte[(int)file.getSize()];
						while((read = inputStream.read(n))!= -1) {
							outputStream.write(n,0,read);
						}
						
						
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {
						try {
							inputStream.close();
							outputStream.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					//파일업로드절차=============================================
					
				}
				System.out.println("************fileName:"+fileName); //Capture001.png
				
				
				String userId = (String)req.getSession().getAttribute("userId");
				mozzleUserDto.setUser_id(userId);
				System.out.println("====mozzleUserDto수정!!!!:"+mozzleUserDto.toString());
				int resultcnt = mozzleUserService.updateMozzleUser(mozzleUserDto);
				
//				String msg =null;
//				
//				if(resultcnt == 0) {
//					msg="nochange";
//					
//				} else {
//					msg ="change";
//				}
				
				//mozzle_id와 userid로 회원정보찾기
				Map<String, String> userinfo = new HashMap<String, String>();
				userinfo.put("user_id", userId);
				userinfo.put("mozzle_id", mozzle_id);
				MozzleUserDto userdtoInfo = mozzleUserService.selectMozzleUserByUserId(userinfo);
				
				
				Map<String,MozzleUserDto > mapChangedUser = new HashMap<String, MozzleUserDto>();
				mapChangedUser.put("userdtoInfo", userdtoInfo);
				
				log.info("===========수정한 멤버의 dto{}",userdtoInfo);
				
				return mapChangedUser;
			}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//마이페이지 폼 띄울때
	@GetMapping(value="/mozzleuserMypage.do")
	public String mozzleuserMypage(@ModelAttribute("mozzle_id")String mozzle_id, HttpServletRequest req, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id",mozzle_id);
		String sessionid = (String)req.getSession().getAttribute("userId");
		map.put("user_id", sessionid);
		
		MozzleUserDto mozzleUser = mozzleUserService.selectMozzleUserByUserId(map);
		log.info("모즐유저페이지에 보낼 유저정보 출력=================="+mozzleUser);
		
		model.addAttribute("mozzleUser",mozzleUser);
		return "mozzle/mozzleuserMypage";
	}
	
	// 리더 권한 위임(작성자 : 이종표)
	@RequestMapping(value="/delegateLeader.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> delegateLeader(HttpServletRequest req, @RequestBody Map<String, String> newLeader){
		System.out.println(newLeader);
		Map<String, Boolean> delegated = new HashMap<String, Boolean>();
		HttpSession session = req.getSession();
		boolean result = mozzleUserService.changeMozzleAuth(session.getAttribute("userId").toString(), newLeader);
		delegated.put("delegated", result);
		return delegated;
		
	}
}
