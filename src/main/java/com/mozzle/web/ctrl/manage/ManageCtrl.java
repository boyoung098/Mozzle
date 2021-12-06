package com.mozzle.web.ctrl.manage;

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

			BufferedImage thumbnail_medium = Thumbnails.of(image).size(mediumWidth,mediumHeight).asBufferedImage();

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
