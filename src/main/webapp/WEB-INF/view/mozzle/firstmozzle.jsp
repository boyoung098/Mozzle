<%@page import="org.springframework.http.HttpRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>모즐메인</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<%@ include file="../comm/import.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/mozzlemainkby.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
          
	});
	
	$("#invite-user").click(function(){
		location.href="./guestInvite.do?mozzle_id=1";
	})
});
</script>
</head>
<body>
	<div id="header"></div>
	<section class="container mt-3" id="new-mozzle2">
		<div class="row content">
			<div class="col-sm-9">
				<div class="mo-img">
					<img src="<%=request.getContextPath()%>/resources/images/main.png"
						alt="메인" />
					<div class="mo-text">
						<h4>로아하는 로아인 모여!<a href="./manage/modifyMozzleForm.do" style="color:red; font-size:12px;">모즐 설정</a></h4>
						<p>그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지
							못하고그림자가 사라지지 않는 것이다 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되
							 <c:if test="${empty mozzleUserdto}">
							 	모즐유저디티오없다
							 </c:if>
							
							 
						</p>
						<div class="mo-member">
							<ul>
								<li>리더 : 로아로아</li>
								<li>멤버 : 101</li>
							</ul>
							<c:if test="${mozzleUserdto.auth_code == null || mozzleUserdto.auth_code == '3'}">
							<button class="join-btn"  onclick="userSessionCheck()" id="joinbtn">가입요청</button>
							</c:if>
							
						</div>
					</div>
					<div class="mo-list">
						<ul>
							<li><a  href="#" id="default-move">게시글<input type="hidden" name="move" value="board"></a></li>
							<li>사진첩</li>
							<li><a href="#">일정<input type="hidden" name="move" value="calendar"></a></li>
							<c:if test="${mozzleUserdto.auth_code == '1' || mozzleUserdto.auth_code == '2'}">
							<li><a href="#">내정보<input type="hidden" name="move" value="mozzleuserMypage"></a></li>
							</c:if>
						</ul>
					</div>
				</div>
	<%@include file= "/WEB-INF/view/mozzle/mozzleJoinForm.jsp"  %>
	
	
		<div id="load_mozzle">
		</div>
	
	


			</div>
			<div class="col-sm-3 sidenav">
				<div class="input-group input-search" style="width: 86%;">
					<form action="" method="post">
						<input type="text" class="form-control" name="keyword"
							id="keyword" placeholder="모즐 게시글 검색"> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button"
								onclick="searchboard()">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</form>
				</div>
				<div class="new-photo">
					<h4>최신 사진</h4>
					<ul>
						<!-- <li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li> -->
					</ul>
				</div>
				
				<!-- 모즐멤버리스트 뿌리는 곳 -->
				<%@ include file="/WEB-INF/view/mozzle/mozzleMemberList.jsp" %>


			</div>
		</div>

	</section>

<div id="footer"></div>



	
 <% String mozzle_id = request.getParameter("mozzle_id");  %>
 <%=mozzle_id%>
<script type="text/javascript">

//리스트 jquery onload 사용하기
$(function(){
	//var menu = "M_borad2";
	$(".mo-list ul li a").each((idx,item)=>{
		$(item).click(function(e){
			e.preventDefault();
			//console.log($(this).children("input").val());
			//console.log("mozzle_id=<%=mozzle_id%>");
			$("#load_mozzle").load($(item).children("input").val()+".do?mozzle_id=<%=mozzle_id%>");
			//menu = $(item).children("input").val();

		})
	});
	
});

$(function(){
	$("#btninvite").click(function(e){
		e.preventDefault();
		$("#load_mozzle").load("guestInvite.do?mozzle_id=<%=mozzle_id%>");
		
	})
	
})


//모즐가입클릭시
function userSessionCheck(){
	var userId = '<%=(String)session.getAttribute("userId")%>';
	console.log(userId);
	var auth = "<c:out value='${mozzleUserdto.auth_code}'/>";
	console.log(auth);
	if(userId=='null'){
//			console.log(userId+"ss");
		alert('로그인이 되어있지 않습ㄴ디ㅏ.');
		location.href='./loginPage.do'; //로그인페이지로 이동해야함
	} else if(auth==3){
		
		alert('강퇴당한 회원입니다. 가입이 불가합니다.');
		
	}else{
		//console.log(auth);
		 $('#joinModal').modal();
	}
	
}


function inputComment() {
	var content = $("#summernote").val();
	console.log(content);
	$.ajax({
		type:'POST',
		url : './insertBoard.do',
		data: {
			"incontent":content,
			},
		dataType:"JSON",
		async:true,
		success : function(reinsert){
			
        		
		}
	})
}
	

</script>

</body>
</html>