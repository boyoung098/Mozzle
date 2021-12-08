package com.mozzle.web.ctrl.manage;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mozzle.web.dto.manage.ManageDto;

@Controller
public class ManageCtrl {
	
	@RequestMapping(value = "/registerMozzle.do", method = RequestMethod.GET)
	public String resiterMozzle(ManageDto mDto) {
		
		
		return "registerMozzle";
	}
	
	@RequestMapping(value = "/imageUpload.do", method = RequestMethod.POST)
	public String imageUpload() {
		
		/*
		 * String realPath = request.getServletContext().getRealPath("image"); int id;
		 * String fileName = null; String contextPath =
		 * request.getServletContext().getContextPath(); String userProfile = null;
		 * 
		 * try { MultipartRequest multi = new MultipartRequest( request, realPath,
		 * 1024*1024*2, "UTF-8", new DefaultFileRenamePolicy()); fileName =
		 * multi.getFilesystemName("userProfile"); System.out.println("fileName : " +
		 * fileName);
		 * 
		 * id = Integer.parseInt(multi.getParameter("id"));
		 * 
		 * userProfile = contextPath + "/image/" + fileName; UsersRepository
		 * usersRepository = UsersRepository.getInstance(); int result =
		 * usersRepository.update(id, userProfile);
		 * 
		 * if (result == 1) { HttpSession session = request.getSession(); Users
		 * principal = usersRepository.findById(id); session.setAttribute("principal",
		 * principal);
		 * 
		 * Script.href("사진 변경완료","/blog/index.jsp" , response); } else {
		 * Script.back("사진변경실패", response); } } catch (Exception e) {
		 * e.printStackTrace(); Script.getMessage("요류 : " + e.getMessage() , response);
		 * }
		 */
		return null;
	   }

}
