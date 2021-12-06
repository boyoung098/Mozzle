package com.mozzle.web.ctrl.manage;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class ManageCtrl {
	
	@RequestMapping(value = "/resiterMozzle", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> multiUpload(MultipartHttpServletRequest multi,HttpServletResponse response) throws IOException {

		List<MultipartFile> mf = multi.getFiles("photo");		
		
		for (int i = 0; i < mf.size(); i++) {

			String genId = UUID.randomUUID().toString();

			String originName = mf.get(i).getOriginalFilename();
			String savedName = "chalkack-" + genId + "." + originName;
			String resizeFileName_medium = "medium-" + savedName;

			//DB 연결 후 
			//S3Util.uploadImageToS3(mf.get(i),saveFileName);
            
			BufferedImage image = ImageIO.read(mf.get(i).getInputStream());
			double getWidth = image.getWidth();
			double getHeight = image.getHeight();

			double resizeRatio = getWidth / getHeight;

			int mediumHeight = 550;				
			int mediumWidth = (int)(resizeRatio * mediumHeight);
			
			//dependency 추가
			/*
			 * BufferedImage thumbnail_medium =
			 * Thumbnails.of(image).size(mediumWidth,mediumHeight).asBufferedImage();
			 */

			//DB 연결 후 
			//S3Util_Thumbs.uploadImageToS3(thumbnail_medium, resizeFileName_medium);

			Map uploadMap = new HashMap();
            	     
			uploadMap.put("p_height", (int)getHeight);
			
		}
		//int res = filedao.upload(uploadMap);
		boolean res = true;
		if (!res) {
			return new ResponseEntity<String>("사진 업로드 중 문제가 발생했습니다", HttpStatus.CONFLICT);
		} else {
			return new ResponseEntity<String>(mf.size()+ "프로필 사진이 업로드되었습니다", HttpStatus.CREATED);
		} // end for
	}

}
