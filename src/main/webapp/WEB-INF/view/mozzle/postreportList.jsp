<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.table>tbody>tr>td {
    border-bottom: 1px solid #ddd;
    text-align: center;
    font-weight: 200;
}
</style>

<div>
	<form action="./multiDelflag.do" method="post" id="frm" onsubmit="return chkbox()">
	
		<div>
			<!-- <input type="submit" class="btn btn-danger" value="관리자삭제"> -->
			<input type='button' class="join-btn"  value='사유부적절' onclick='inappropriate()'>
			<input type='button' class="join-btn" value='관리자삭제' onclick='deleteadmin()'>
		</div>

  
		<table class="table table-border table_b">
			<thead>
			<tr>
				<th><input type="checkbox" id="checkAll" onclick="checkAllFn(this.checked)"></th>
				<th>신고번호</th>
				<th>작성자</th>
				<th>사유</th>
				<th>신고일자</th>
				<th>신고처리</th>
				<th>상세보기</th>
			</tr>
			</thead>
			
			<tbody>
			<jsp:useBean id="format" class="com.mozzle.web.dto.board.InputList" scope="page"/>
					<jsp:setProperty property="lists" name="format" value="${lists}"/>
					<jsp:getProperty property="listForm" name="format"/>
			</tbody>
			
		</table>
		
			<input type="hidden" name="index" id="index" value="${row.index}">
			<input type="hidden" name="pageNum" id="pageNum" value="${row.pageNum}">
			<input type="hidden" name="listNum" id="listNum" value="${row.listNum}">
	
			<div style="text-align: center;">
				<ul class="pagination">
				  <li><a href="#" onclick="pageFirst()"><span class="glyphicon glyphicon-fast-backward"></span> </a></li>
				  <li><a href="#" onclick="pagePrev(${row.pageNum},${row.pageList})"><span class="glyphicon glyphicon-step-backward"></span></a></li>
				  
				  <c:forEach var="i" begin="${row.pageNum}" end="${row.count}" step="1" >
					  <li><a href="#" onclick="pageIndex('${i}')">${i}</a></li>
				  </c:forEach>
				  
				  <li><a href="#" onclick="pageNext(${row.pageNum},${row.total},${row.listNum},${row.pageList})"><span class="glyphicon glyphicon-step-forward"></span> </a></li>
				  <li><a href="#" onclick="pageLast(${row.pageNum},${row.total},${row.listNum},${row.pageList})"><span class="glyphicon glyphicon-fast-forward"></span> </a></li>
				</ul>
			</div>
			
				
	
	</form>
</div>
<% String mozzle_id = request.getParameter("mozzle_id");  %>
<script type="text/javascript">
//게시글에서 title을 클릭했을 경우 context가 생성되고 선랙된 title외의 다른 content를 class를 변경하여 닫기게 한다
/* var collapse = function(seq){
   $(".panel-collapse").not("#collapse"+seq).each(function(){
      $(this).attr("class","panel-collapse collapse");
   })
} */

//부적적처리
function inappropriate(){
	
    var chkArray = new Array(); // 배열 선언

    $("input:checkbox[name='chkVal']:checked").each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
        chkArray.push(this.value);
    });
    console.log(chkArray);
    
	   $.ajax({
		      url : "./inappropriate.do?mozzle_id=<%=mozzle_id%>&chkArray="+chkArray,
		      type:"post",
		      async:true,
		      data: $("#frm").serialize(),
		      dataType : "json",
		      success : function(msg){ //{"lists" : [{},{}, ..],"row",{"","",""}}
		         console.log(msg);
		         
		         $.each(msg,function(key,value){
		        	 var varHtml = "";
		        	 var n = 7;
		        	 
						if(key =='lists'){
							//thead
							varHtml += "<thead>                ";
							varHtml += "	<tr>               ";
								varHtml +="<th>";
								varHtml +="<input type='checkbox' id='checkAll' onclick='checkAllFn(this.checked)'>";
								varHtml +="</th>";
							varHtml += "		<th>신고번호</th>";
							varHtml += "		<th>작성자</th>  ";
							varHtml += "		<th>사유</th>";
							varHtml += "		<th>신고일자</th>";
							varHtml += "		<th>신고처리</th>";
							varHtml += "		<th>상세보기</th>";
							varHtml += "	</tr>              ";
							varHtml += "</thead>               ";
							//tbody
							varHtml += "<tbody>               ";
							$.each(value,function(k,v){
								varHtml+="<tr>                                                                                                                                                     "  ;
								if(v.process == '미처리'){
								varHtml+="	<td><input type='checkbox' name='chkVal' value='"+v.report_id+"'></td>                                                                                              "  ;
								}else{
									varHtml+="	<td></td>                                                                                              "  ;
								}
								varHtml+="	<td>"+v.report_id+"</td>                                                                                                                                            "  ;
								varHtml+="	<td>"+v.user_id+"</td>                                                                                                                                          ";
								varHtml+="	<td>"+v.reason+"</td>                                                                                                                                          ";
								varHtml+="	<td>"+v.report_time+"</td>                                                                                                                                               ";
								
								if(v.process == '미처리'){
									varHtml+="	<td  style='color:blue;'>"+v.process+"</td>                                                           	                                                                                 ";
									}else{
									varHtml+="	<td>"+v.process+"</td>                                                           	                                                                                 ";
									}
								
								varHtml+="	<td><a data-toggle='collapse' href='#collapse"+v.report_id+"' onclick='collapse("+v.report_id+")'>상세보기</a></td>";
								varHtml+="</tr>                                                                                                                                                      ";
								
								varHtml+="<tr>                                                                                    ";
								varHtml+="	<td colspan=7>                                                                       ";
								varHtml+="		<div id='collapse"+v.report_id+"' class='panel-collapse collapse'>                 ";
								varHtml+="			<div class='form-group'>                                                       ";
								varHtml+="				<label>내용</label>                                                        ";
								varHtml+="				<textarea rows='5'  class='form-control' >"+v.content+"</textarea>   ";
								varHtml+="			</div>                                                                         ";
								varHtml+="		</div>                                                                             ";
								varHtml+="	</td>                                                                                  ";
								varHtml+="</tr> ";
								
							});                                                                                                                                                                      
							varHtml += "</tbody>               ";
							
						}else{
							
						  varHtml += "<li><a href='#' onclick='pageFirst()'><span class='glyphicon glyphicon-fast-backward'></span> </a></li>                                                        ";
						  varHtml += "<li><a href='#' onclick='pagePrev("+value.pagenum+","+value.pagelist+")'><span class='glyphicon glyphicon-step-backward'></span></a></li>                            ";
						  varHtml += "                                                                                                                                                               ";
							for(let i= value.pagenum; i<=value.count; i++){
							  varHtml += "  <li><a href='#' onclick='pageIndex("+i+")'>"+i+"</a></li>                                                                                                    ";
							}				  
						  varHtml += "                                                                                                                                                               ";
						  varHtml += "<li><a href='#' onclick='pageNext("+value.pagenum+","+value.total+","+value.listnum+","+value.pagelist+")'><span class='glyphicon glyphicon-step-forward'></span> </a></li>";
						  varHtml += "<li><a href='#' onclick='pageLast("+value.pagenum+","+value.total+","+value.listnum+","+value.pagelist+")'><span class='glyphicon glyphicon-fast-forward'></span> </a></li>";
							
						}
						
						if(key == 'lists'){
							$(".table").html(varHtml);
						}else{
							$(".pagination").html(varHtml);
						}
						
		        	 
		         });
		      },
		      error:function(){
		         alert("선택해주세요.");
		      }
		   });

}

//부적적처리
function deleteadmin(){
	
    var chkArray = new Array(); // 배열 선언

    $("input:checkbox[name='chkVal']:checked").each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
        chkArray.push(this.value);
    });
    console.log(chkArray);
    
	   $.ajax({
		      url : "./deleteadmin.do?mozzle_id=<%=mozzle_id%>&chkArray="+chkArray,
		      type:"post",
		      async:true,
		      data: $("#frm").serialize(),
		      dataType : "json",
		      success : function(msg){ //{"lists" : [{},{}, ..],"row",{"","",""}}
		         console.log(msg);
		         
		         $.each(msg,function(key,value){
		        	 var varHtml = "";
		        	 var n = 7;
		        	 
						if(key =='lists'){
							//thead
							varHtml += "<thead>                ";
							varHtml += "	<tr>               ";
								varHtml +="<th>";
								varHtml +="<input type='checkbox' id='checkAll' onclick='checkAllFn(this.checked)'>";
								varHtml +="</th>";
							varHtml += "		<th>신고번호</th>";
							varHtml += "		<th>작성자</th>  ";
							varHtml += "		<th>사유</th>";
							varHtml += "		<th>신고일자</th>";
							varHtml += "		<th>신고처리</th>";
							varHtml += "		<th>상세보기</th>";
							varHtml += "	</tr>              ";
							varHtml += "</thead>               ";
							//tbody
							varHtml += "<tbody>               ";
							$.each(value,function(k,v){
								varHtml+="<tr>                                                                                                                                                     "  ;
								if(v.process == '미처리'){
								varHtml+="	<td><input type='checkbox' name='chkVal' value='"+v.report_id+"'></td>                                                                                              "  ;
								}else{
									varHtml+="	<td></td>                                                                                              "  ;
								}
								varHtml+="	<td>"+v.report_id+"</td>                                                                                                                                            "  ;
								varHtml+="	<td>"+v.user_id+"</td>                                                                                                                                          ";
								varHtml+="	<td>"+v.reason+"</td>                                                                                                                                          ";
								varHtml+="	<td>"+v.report_time+"</td>                                                                                                                                               ";
								
								if(v.process == '미처리'){
									varHtml+="	<td  style='color:blue;'>"+v.process+"</td>                                                           	                                                                                 ";
									}else{
									varHtml+="	<td>"+v.process+"</td>                                                           	                                                                                 ";
									}
								
								varHtml+="	<td><a data-toggle='collapse' href='#collapse"+v.report_id+"' onclick='collapse("+v.report_id+")'>상세보기</a></td>";
								varHtml+="</tr>                                                                                                                                                      ";
								
								varHtml+="<tr>                                                                                    ";
								varHtml+="	<td colspan=7>                                                                       ";
								varHtml+="		<div id='collapse"+v.report_id+"' class='panel-collapse collapse'>                 ";
								varHtml+="			<div class='form-group'>                                                       ";
								varHtml+="				<label>내용</label>                                                        ";
								varHtml+="				<textarea rows='5'  class='form-control' >"+v.content+"</textarea>   ";
								varHtml+="			</div>                                                                         ";
								varHtml+="		</div>                                                                             ";
								varHtml+="	</td>                                                                                  ";
								varHtml+="</tr> ";
								
							});                                                                                                                                                                      
							varHtml += "</tbody>               ";
							
						}else{
							
						  varHtml += "<li><a href='#' onclick='pageFirst()'><span class='glyphicon glyphicon-fast-backward'></span> </a></li>                                                        ";
						  varHtml += "<li><a href='#' onclick='pagePrev("+value.pagenum+","+value.pagelist+")'><span class='glyphicon glyphicon-step-backward'></span></a></li>                            ";
						  varHtml += "                                                                                                                                                               ";
							for(let i= value.pagenum; i<=value.count; i++){
							  varHtml += "  <li><a href='#' onclick='pageIndex("+i+")'>"+i+"</a></li>                                                                                                    ";
							}				  
						  varHtml += "                                                                                                                                                               ";
						  varHtml += "<li><a href='#' onclick='pageNext("+value.pagenum+","+value.total+","+value.listnum+","+value.pagelist+")'><span class='glyphicon glyphicon-step-forward'></span> </a></li>";
						  varHtml += "<li><a href='#' onclick='pageLast("+value.pagenum+","+value.total+","+value.listnum+","+value.pagelist+")'><span class='glyphicon glyphicon-fast-forward'></span> </a></li>";
							
						}
						
						if(key == 'lists'){
							$(".table").html(varHtml);
						}else{
							$(".pagination").html(varHtml);
						}
						
		        	 
		         });
		      },
		      error:function(){
		         alert("선택해주세요.");
		      }
		   });

}


//페이징 request인 row에서 전달받은 값을 사용하여 화면의 게시글의 리스트 갯수를 자동으로 선택되도록 함
$(document).ready(function(){
	var listNum = $("#listNum").val();
	$("#list option").each(function(){
		if(listNum == $(this).val()){
			$(this).prop("selected",true);
		}else{
			$(this).prop("selected",false);
		}
	});


//3) 선택된 chkval 모든 checkbox가 선택이 되면 자동으로 checkAll의 checkbox 해제/선택되도록 함	
	var chkval = document.getElementsByName("chkVal");
	var checkAll = document.getElementById("checkAll");
	for(let i=0; i<chkval.length; i++){
		chkval[i].onclick = function(){
			if(chkval.length == chsConfirm()){
				checkAll.checked = true;
			}else{
				checkAll.checked = false;
			}
		}
	}
	
});


//다중삭제 관련 기능
//1) 선택된 chkval의 갯수를 확인 하는 기능
function chsConfirm(){
	var chkval = document.getElementsByName("chkVal");
	var choiceCnt = 0;
	for(let i=0; i< chkval.length; i++){
		if(chkval[i].checked){
			choiceCnt++;
		} 
	}
	return choiceCnt;
}

//2)전체 선택 기능
function checkAllFn(bool){
	var chkval = document.getElementsByName("chkVal");
//	console.log(chkval.length);
	for(let i=0; i< chkval.length; i++){
		chkval[i].checked = bool;
	}
}

/* function submitForm(){
   document.forms[0].submit();
} */

/* function chkbox(){
      var isc = false;
      if(chsConfirm() > 0){
         swal({
           title: "다중삭제",
           text: "삭제를 진행하시겠습니까?",
           type: "warning",
           showCancelButton: true,
           confirmButtonCless: "btn-danger",
           confirmButtonText: "예",
           cancelButtonText: "아니오",
           closeOnConfirm: true,
           closeOnCancel: false 
       },
       function(isConfirm) {
           if (isConfirm) {
               swal("","삭제를 실행합니다.");
            submitForm();
           } else {
               swal("", "삭제를 취소합니다.");
           }
       }
   );
}else{
   swal("삭제 오류","선택된 게시글이 없습니다.");
}
   
   return isc;
} */


//페이징 처리를 통한 SPA 화면 구현

function pageFirst(){
	console.log("pageFirst");
	var index = document.getElementById("index"); // 현재 눌려진 페이지 0부터 시작
	var pageNum = document.getElementById("pageNum"); // 보여지는 페이지 시작번호
	index.value=0;
	pageNum.value=1;
	pageAjax();
}

//pagePrev(1,5)
function pagePrev(num,pageList){
	console.log(num, pageList);
	if(0<num-pageList){
		num -= pageList;
		var index = document.getElementById("index"); // 현재 눌려진 페이지 0부터 시작
		var pageNum = document.getElementById("pageNum");
		index.value=num-1;
		pageNum.value=num;
	}
	pageAjax();
	
}
//pageNext
function pageNext(num, total, listNum, pageList){
	console.log(num, total, listNum, pageList);
	
	var idx = Math.ceil(total/listNum);
	var max = Math.ceil(idx/pageList);
	
	if(max*pageList > num+pageList){
		num += pageList;
		var index = document.getElementById("index"); // 현재 눌려진 페이지 0부터 시작
		var pageNum = document.getElementById("pageNum");
		
		index.value = num-1;
		pageNum.value = num;
	}
	pageAjax();
}
//pageLast
function pageLast(num, total, listNum, pageList){
	console.log(num, total, listNum, pageList);
	var idx = Math.ceil(total/listNum);//
	var max = Math.ceil(idx/pageList)//
	
	while(max*pageList > num+pageList){
		num += pageList;
	}
	
	var index = document.getElementById("index"); // 현재 눌려진 페이지 0부터 시작
	var pageNum = document.getElementById("pageNum");
		
	index.value = idx-1;
	pageNum.value = num;
	
	pageAjax();
}

//pageIndex
function pageIndex(pagenum){
	var index = document.getElementById("index");
	index.value = pagenum-1;
	pageAjax();
}

//pageList
function pageList(){
	var index = document.getElementById("index"); 
	var pageNum = document.getElementById("pageNum");
	var listNum = document.getElementById("listNum");
	
	index.value=0;
	pageNum.value = 1;
	listNum.value = document.getElementById("list").value;
	
	pageAjax();
	
}




var pageAjax = function(){
	console.log($("#frm").serialize);
	   $.ajax({
	      url : "./page.do?mozzle_id=<%=mozzle_id%>",
	      type:"post",
	      async:true,
	      data: $("#frm").serialize(),
	      dataType : "json",
	      success : function(msg){ //{"lists" : [{},{}, ..],"row",{"","",""}}
	         console.log(msg);
	         
	         $.each(msg,function(key,value){
	        	 var varHtml = "";
	        	 var n = 7;
	        	 
					if(key =='lists'){
						//thead
						varHtml += "<thead>                ";
						varHtml += "	<tr>               ";
							varHtml +="<th>";
							varHtml +="<input type='checkbox' id='checkAll' onclick='checkAllFn(this.checked)'>";
							varHtml +="</th>";
						varHtml += "		<th>신고번호</th>";
						varHtml += "		<th>작성자</th>  ";
						varHtml += "		<th>사유</th>";
						varHtml += "		<th>신고일자</th>";
						varHtml += "		<th>신고처리</th>";
						varHtml += "		<th>상세보기</th>";
						varHtml += "	</tr>              ";
						varHtml += "</thead>               ";
						//tbody
						varHtml += "<tbody>               ";
						$.each(value,function(k,v){
							varHtml+="<tr>                                                                                                                                                     "  ;
							if(v.process=='미처리'){
							varHtml+="	<td><input type='checkbox' name='chkVal' value='"+v.report_id+"'></td>                                                                                              "  ;
							} else{
								varHtml+="	<td></td>                                                                                              "  ;
							}
							varHtml+="	<td>"+v.report_id+"</td>                                                                                                                                            "  ;
							varHtml+="	<td>"+v.user_id+"</td>                                                                                                                                          ";
							varHtml+="	<td>"+v.reason+"</td>                                                                                                                                          ";
							varHtml+="	<td>"+v.report_time+"</td>                                                                                                                                          ";
							if(v.process == '미처리'){
								varHtml+="	<td  style='color:blue;'>"+v.process+"</td>                                                           	                                                                                 ";
								}else{
								varHtml+="	<td>"+v.process+"</td>                                                           	                                                                                 ";
								}
							
							varHtml+="	<td><a data-toggle='collapse' href='#collapse"+v.report_id+"' onclick='collapse("+v.report_id+")'>상세보기</a></td>";
							varHtml+="</tr>                                                                                                                                                      ";
							
							varHtml+="<tr>                                                                                    ";
							varHtml+="	<td colspan=7>                                                                       ";
							varHtml+="		<div id='collapse"+v.report_id+"' class='panel-collapse collapse'>                 ";
							varHtml+="			<div class='form-group'>                                                       ";
							varHtml+="				<label>내용</label>                                                        ";
							varHtml+="				<textarea rows='5'  class='form-control' >"+v.content+"</textarea>   ";
							varHtml+="			</div>                                                                         ";
							varHtml+="		</div>                                                                             ";
							varHtml+="	</td>                                                                                  ";
							varHtml+="</tr> ";
							
						});                                                                                                                                                                      
						varHtml += "</tbody>               ";
						
					}else{
						
					  varHtml += "<li><a href='#' onclick='pageFirst()'><span class='glyphicon glyphicon-fast-backward'></span> </a></li>                                                        ";
					  varHtml += "<li><a href='#' onclick='pagePrev("+value.pagenum+","+value.pagelist+")'><span class='glyphicon glyphicon-step-backward'></span></a></li>                            ";
					  varHtml += "                                                                                                                                                               ";
						for(let i= value.pagenum; i<=value.count; i++){
						  varHtml += "  <li><a href='#' onclick='pageIndex("+i+")'>"+i+"</a></li>                                                                                                    ";
						}				  
					  varHtml += "                                                                                                                                                               ";
					  varHtml += "<li><a href='#' onclick='pageNext("+value.pagenum+","+value.total+","+value.listnum+","+value.pagelist+")'><span class='glyphicon glyphicon-step-forward'></span> </a></li>";
					  varHtml += "<li><a href='#' onclick='pageLast("+value.pagenum+","+value.total+","+value.listnum+","+value.pagelist+")'><span class='glyphicon glyphicon-fast-forward'></span> </a></li>";
						
					}
					
					if(key == 'lists'){
						$(".table").html(varHtml);
					}else{
						$(".pagination").html(varHtml);
					}
					
	        	 
	         });
	      },
	      error:function(){
	         alert("잘못된 요청입니다.");
	      }
	   });
	} 
	
	
	

</script>
