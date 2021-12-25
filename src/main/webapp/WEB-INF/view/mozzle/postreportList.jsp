<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<form action="./multiDelflag.do" method="post" id="frmPaging" onsubmit="return chkbox()">
		
		<table class="table table-border">
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
			
			</tbody>
			
		</table>
		<div>
			<!-- <input type="submit" class="btn btn-danger" value="관리자삭제"> -->
			<input type='button' class='btn btn-success' value='사유부적절' onclick='updateVal()'>
			<input type='button' class='btn btn-warning' value='관리자삭제' onclick='()'>
		</div>
			<input type="text" name="index" id="index" value="${row.index}">
			<input type="text" name="pageNum" id="pageNum" value="${row.pageNum}">
			<input type="text" name="listNum" id="listNum" value="${row.listNum}">
	
			<div style="text-align: center;">
				<ul class="pagination pagination-lg">
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
<script type="text/javascript">
//게시글에서 title을 클릭했을 경우 context가 생성되고 선랙된 title외의 다른 content를 class를 변경하여 닫기게 한다
/* var collapse = function(seq){
   $(".panel-collapse").not("#collapse"+seq).each(function(){
      $(this).attr("class","panel-collapse collapse");
   })
} */

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

function submitForm(){
   document.forms[0].submit();
}

function chkbox(){
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
}


//페이징처리를 통한 SPA 화면 구현
/* function pageFirst(){
	console.log("pageFirst");
	var index = document.getElementById('index'); //현재 눌려진 페이지 0부터 시작
	var pageNum = document.getElementById('pageNum'); //보여지는 페이지 시작번호
	index.value = 0;
	pageNum.value = 1;
	pageAjax();
}

var pageAjax = function(){
	   $.ajax({
	      url : "./page.do",
	      type:"post",
	      async:true,
	      data: $("#frmPaging").serialize,
	      dataType : "json",
	      success : function(msg){ //{"lists" : [{},{}, ..],"row",{"","",""}}
	         console.log(msg);
	         
	         $.each(msg,function(key,value){
	        	 var varHtml = "";
	        	 var n = $(".table tr:eq(0) th").length;
	        	 
	        	 if(key == 'lists'){
	        		 
	        	 }
	        	 
	         })
	      },
	      error:function(){
	         alert("잘못된 요청입니다.");
	      }
	   });
	} */
	
	
	
//paging submit 공통

	function frmPaging(){
		document.getElementById("frmPaging").submit();
	}

	function pageFirst(){
		var index = document.getElementById("index");
		var pageStartNum = document.getElementById("pageStartNum");
		index.value = 0;
		pageStartNum.value = 1;
		frmPaging();
	}

	function pagePre(num, pageCnt){ // num : 출력할 페이지의 시작 번호, pageCnt : 출력할 페이지 번호 갯수
		if(0 < num - pageCnt){
			num -= pageCnt;
			var index = document.getElementById("index");
			var pageStartNum = document.getElementById("pageStartNum");
			index.value = num - 1;
			pageStartNum.value = num;
		}
		frmPaging();
	}

	function pageIndex(idx){
		var index = document.getElementById("index");
		index.value = idx - 1;
		frmPaging();
	}

	function pageNext(num, total, listNum, pageCnt){ // 출력할 페이지의 시작 번호, 리스트의 총 갯수, 출력할 리스트의 갯수, 출력한 페이지 번호 갯수
		var index = Math.ceil(total / listNum);
		var max = Math.ceil(index / pageCnt);
		
		if(max * pageCnt > num + pageCnt){
			num += pageCnt;
			var index = document.getElementById("index");
			var pageStartNum = document.getElementById("pageStartNum");
			
			pageStartNum.value = num;
			index.value = num - 1;
		}
		frmPaging();
	}

	function pageLast(num, total, listNum, pageCnt){ // 출력할 페이지의 시작 번호, 리스트의 총 갯수, 출력할 리스트의 갯수, 출력한 페이지 번호 갯수
		var index = Math.ceil(total / listNum);
		var max = Math.ceil(index / pageCnt);
		
		while(max * pageCnt > num + pageCnt){
			num += pageCnt;

		}
		var index = document.getElementById("index");
			var pageStartNum = document.getElementById("pageStartNum");
			
			pageStartNum.value = num;
			index.value = num - 1;
		frmPaging();
	}

	function listCnt(){
		document.getElementById('index').value = 0;
		document.getElementById('pageStartNum').value = 1;
		document.getElementById('listCnt').value = document.getElementById('listCount').value;
		frmPaging();
	}
	
	
</script>
