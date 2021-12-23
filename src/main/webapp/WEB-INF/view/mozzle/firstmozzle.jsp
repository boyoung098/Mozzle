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
<script src="<%=request.getContextPath()%>/resources/js/mozzlemainkby.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
<script type="text/javascript">
$(document).ready(function() {
	$("#invite-user").click(function(){
		location.href="./guestInvite.do?mozzle_id=1";
	})
});
</script>
<style>
#hash-tag{
	width: 10px;
	height: 10px;
}

</style>
</head>
<body>
	<div id="header"></div>
	<section class="container mt-3" id="new-mozzle2">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<div class="new-photo">
					<h4>내 정보</h4>
					<div class="profil-image">
						<img src="<%=request.getContextPath()%>/resources/upload/${myMozzle.image_saved}"
						alt="메인" />
					</div>
					<div>
						운영자<br>
						이메일<br>
						가입일<br>
						모즐 신고<br>
						모즐 탈퇴<br>
					</div>
				</div>
				
				<%-- <!-- 모즐멤버리스트 뿌리는 곳 -->
				<%@ include file="/WEB-INF/view/mozzle/mozzleMemberList.jsp" %> --%>
			</div>
			<div class="col-sm-9">
				<div class="mo-img">
					<div id= "image-wrap">
						<img id="cover-image" src="<%=request.getContextPath()%>/resources/upload/${myMozzle.image_saved}"
						alt="메인" />
					</div>
					<div class="mo-text">
						<div class="mozzle-title-icon">
							<h4>${myMozzle.mozzle_name}</h4>
							<a href="./manage/modifyMozzleForm.do"><i class="xi-cog  xi-x"></i></a>
						</div>
						<p>${myMozzle.mozzle_intro}
							 <c:if test="${empty mozzleUserdto}">
							 	<!-- 모즐유저디티오없다 -->
							 </c:if>
						</p>
						<div class="mo-member">
							<div>
								<div>
									<c:forEach var="category" items="${categoryList}">
										<a style="color: #aaa"><img id="hash-tag" alt="hash-tag" src="<%=request.getContextPath()%>/resources/images/hashtag.png">${category}</a>&nbsp;
									</c:forEach>
								 </div> 								
								<div>생성일자: ${myMozzle.create_date}</div>
								<div>멤버 : ${myMozzle.memberCnt}</div>
							</div>
							<c:if test="${mozzleUserdto.auth_code == null || mozzleUserdto.auth_code == '3'}">
								<button class="join-btn"  onclick="userSessionCheck()" id="joinbtn">가입요청</button>
							</c:if>
							
						</div>
					</div>
				</div>
				<div class="mo-list">
					<ul>
						<li><a  href="#" id="default-move">신고관리<input type="hidden" name="move" value="postreportList"></a></li>
						<li><a  href="#" id="default-move">게시글<input type="hidden" name="move" value="board"></a></li>
						<!-- <li>사진첩</li>
-->							<li><a href="#">일정<input type="hidden" name="move" value="calendar"></a></li>
						<c:if test="${mozzleUserdto.auth_code == '1' || mozzleUserdto.auth_code == '2'}">
						<li><a href="#">내정보<input type="hidden" name="move" value="mozzleuserMypage"></a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<%@include file= "/WEB-INF/view/mozzle/mozzleJoinForm.jsp"  %>
			<div id="load_mozzle" class="col-sm-9 clear mt-3"></div>
		</div>
	</section>

	<div id="footer"></div>



	
 <% String mozzle_id = request.getParameter("mozzle_id");  %>
 <%=mozzle_id%>
 
 <ul>
 <li class="lilili">
 <input type="hidden" value="96" class="post_id">
 누르기
 </li>
 </ul>
 
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
		
	});
	
	$(".lilili").click(function(e){
		e.preventDefault();
		var postid =($(this).children("input").eq(0).val());
		
		$.ajax({
			type:"get",
			url:"./checkPostId.do",
			data:"post_id="+postid,
			success:function(msg){
				if(msg.count=="true"){
					console.log("true");
					console.log(postid);
					var url = './reportPostForm.do?post_id='+postid;
					var title = '글 신고하기';
					var attr = 'width = 450px, height = 550px';
					window.open(url,title,attr);
					
				} else{
					swal("신고","이미 신고접수가 되었습니다.");
				}
				},
			error : function(){
					alert("문제가 발생하였습니다.");
				}
			
		})
		
	
	});
	
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





</script>

</body>
</html>