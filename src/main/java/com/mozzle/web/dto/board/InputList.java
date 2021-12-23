package com.mozzle.web.dto.board;


import java.util.List;

public class InputList {

	private List<PostReportDto> lists;
	
	public void setLists(List<PostReportDto> lists) {
		this.lists = lists;
	}

	//전체리스트
	public String getListForm() {
		StringBuffer sb = new StringBuffer();
		
		for (int i = 0; i < lists.size(); i++) {
			sb.append(trform(lists.get(i))); // 한 <tr>의 내용을 작성하는 메소드
		}
		return sb.toString();
	}
	
	// 화면을 구성
	private Object trform(PostReportDto dto) {
		StringBuffer sb = new StringBuffer();
		
		
			sb.append("	<tr>                                                                                   ") ;
			sb.append("	<td><input type='checkbox' name='chkVal' value='"+dto.getReport_id()+"'> </td>                ") ;
			sb.append("	<td>"+dto.getPost_id()+"</td>                                                               ") ;
			sb.append("	<td>"+dto.getUser_id()+"</td>                                                               ") ;
			sb.append("	<td>"+dto.getReason()+"</td>                                                                ") ;
			sb.append("	<td>"+dto.getReport_time()+"</td>  ") ;
			sb.append("	<td>"+dto.getProcess()+"</td>     ") ;
			sb.append("	<td><a data-toggle='collapse' href='#collapse"+dto.getReport_id()+"' onclick='collapse(\""+dto.getReport_id()+"\")'>상세보기</a></td>") ;
			
			sb.append("</tr>                                                                                   ") ;
			sb.append("<tr>                                                                                    ") ;
			sb.append("	<td colspan=6>                                                                       ") ;
			sb.append("		<div id='collapse"+dto.getReport_id()+"' class='panel-collapse collapse'>                 ") ;
			sb.append("			<div class='form-group'>                                                       ") ;
			sb.append("				<label>내용</label>                                                        ") ;
			sb.append("				<textarea rows='5'  class='form-control' >"+dto.getContent()+"</textarea>   ") ;
			sb.append("			</div>                                                                         ") ;
			sb.append("		</div>                                                                             ") ;
			sb.append("	</td>                                                                                  ") ;
			sb.append("</tr>                                                                                   ") ;
		
		return sb.toString();
	}
	
	
}









