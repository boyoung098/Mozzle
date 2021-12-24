package com.mozzle.web.ctrl.board;

public class ReplyImage {
	
	private int depth;

	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	public String getImage() {
		String img = "<img alt='답글' src='<%=request.getContextPath()%>/resources/images/reply.png' title='답글' >";
		String blank = "&nbsp;&nbsp;&nbsp;&nbsp;";
		String result = "";
		
		if(depth > 0){
			for(int i =0; i<depth; i++) {
				result += blank;	
			}
			result += img;
		}
		return result;
	}
}
