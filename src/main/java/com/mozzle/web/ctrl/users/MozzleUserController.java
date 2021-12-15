package com.mozzle.web.ctrl.users;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.mozzle.web.dto.users.MozzleUserDto;
import com.mozzle.web.service.users.IMozzleUserService;

@Controller
public class MozzleUserController {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IMozzleUserService mozzleUserService;
	
	//모즐로 이동
	@GetMapping(value="/mozzle/mozzleMove.do")
	public String mozzleMove(String mozzle_id, Model model) {
		log.info("이동할 mozzle_id는{}",mozzle_id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id", mozzle_id);
		List<MozzleUserDto> mozzleuserList = mozzleUserService.selectListMozzleUser(map);
		model.addAttribute("mozzleuserList",mozzleuserList);
		model.addAttribute("mozzle_id", mozzle_id);
		return "mozzle/board";
	}
	
	//ajax로 닉네임서치값을 받아서 map 형태로 찾은 리스트들 보내기
	@RequestMapping(value="/mozzle/mozzleUserSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,List<MozzleUserDto> > mozzleUserSearch(String nickname){
		Map<String, String> map = new HashMap<String, String>();
		map.put("mozzle_id", "1");
		map.put("nickname", nickname);
		List<MozzleUserDto> mozzleuserList = mozzleUserService.selectListMozzleUser(map);
		Map<String,List<MozzleUserDto>> returnmap = new HashMap<String,List<MozzleUserDto>>();
		returnmap.put("mozzleuserList", mozzleuserList);
		return returnmap;
	}
	
	//유저가 모즐내 가입할때
	@PostMapping(value = "/mozzle/mozzleUserRegist.do")
	public String mozzleUserRegist(HttpServletRequest req, Model model, MozzleUserDto mozzleUserDto,
										BindingResult result, String mozzle_id) {
		
		MultipartFile file = mozzleUserDto.getFile();
		System.out.println("*************file:"+file); 
		//org.springframework.web.multipart.commons.CommonsMultipartFile@515a98d6
		
		String fileName = file.getOriginalFilename();
		System.out.println("************fileName:"+fileName); //Capture001.png
		mozzleUserDto.setImage_origin(fileName);
		
		String userId = (String)req.getSession().getAttribute("userId");
		mozzleUserDto.setUser_id(userId);
		
		String image_saved = UUID.randomUUID().toString();
		mozzleUserDto.setImage_saved(image_saved);
		
		
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
			System.out.println("====mozzleUserDto:"+mozzleUserDto.toString());
			
			//만약 저장위치가 없다
			File storage = new File(path);
			if(!storage.exists()) {
				storage.mkdirs();
			}
			
			//저장할 파일이 없다면 만들어주고 override함
			File newfile = new File(path+"/"+image_saved);
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
		
		model.addAttribute("mozzle_id", mozzle_id);
		
		return "redirect:/mozzle/mozzleMove.do";
	}
}
