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

#reply-show-button{
	width: 100%;
	height: 100%;
	border: 1px solid #ddd;
	text-align: center;
	padding: 10px;
}

#reply-show-button p {
	margin: 0px;
}

#reply-show-button:hover {
	box-shadow: 1px 1px 1px #aaa;
	cursor: pointer;
	transition-duration: 0.1s;
}

#content{
  width: 100%;
  }
  
.profil-image{
    width: 200px;
    height: 200px;
    object-fit: cover;
    border-radius: 100%;
}

#mozzleout{
	background: #e82d55;
    color: #fff;
    font-size: 14px;
    border-radius: 4px;
    border: none;
    width: 75px;
}

</style>
</head>
<body>
	<div id="header"></div>
	<section class="container mt-3" id="new-mozzle2">
	<c:choose>
		<c:when test="${memberCheck eq true || myMozzle.state == 'Y'}">
		<div class="row content">
			<div class="col-sm-3 sidenav" id="fixed-info">
			<div >
			<ul class="nav nav-tabs">
			  <li class="active"><a data-toggle="tab" href="#home">운영자</a></li>
			  <c:if test="${mozzleUserdto.auth_code == '2'}">
			  <li><a data-toggle="tab" href="#menu1">내정보</a></li>
			  </c:if>
			</ul>
			<div class="tab-content"> <!-- 운영자정보 -->
			  <div id="home" class="tab-pane fade in active" style="text-align: center;">
			    <div style=" display: inline-block;">
					<c:if test="${mozzleLeader.image_saved == null}">
						<img src="<%=request.getContextPath()%>/resources/images/default_profile.png" alt="" style="width: 160px; height: 160px; object-fit: cover; border-radius: 100%;" class="leaderinfoimg">
						</c:if>
						<c:if test="${mozzleLeader.image_saved != null}">
						<img src="<%=request.getContextPath()%>/storage/${mozzleUserdto.image_saved}" alt="" style="width: 160px; height: 160px; object-fit: cover; border-radius: 100%;" class="leaderinfoimg">
						</c:if>
					</div>
					<div class="userinfodiv">
				<h5 id="leadernickname">닉네임 : ${mozzleLeader.nickname}</h5>
					<fmt:parseDate var="leaderjoindate" value="${mozzleLeader.joined_date}" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="leaderjoindate2" value="${leaderjoindate}" pattern="yyyy-MM-dd"/>
					<h5>Email : ${mozzleLeader.email}</h5>
					
					<c:if test="${mozzleLeader.user_id == mozzleUserdto.user_id}">
					<h5>가입일자 : ${leaderjoindate2}</h5>
					<h5>글 작성수 : ${mozzleUserdto.postcnt}</h5>
					<button class="join-btn" type="button" id="btnupdatemy" style="width: 75px;">정보수정</button>
					</c:if>
					
				</div>
					
			  </div>
			  <!-- 내정보 -->
			  <div id="menu1" class="tab-pane fade" style="text-align: center;">
			    <div style=" display: inline-block;">
						<c:if test="${mozzleUserdto.image_saved == null}">
						<img src="<%=request.getContextPath()%>/resources/images/default_profile.png" alt="" style="width: 160px; height: 160px; object-fit: cover; border-radius: 100%;" class="memberinfoimg">
						</c:if>
						<c:if test="${mozzleUserdto.image_saved != null}">
						<img src="<%=request.getContextPath()%>/storage/${mozzleUserdto.image_saved}" alt="" style="width: 160px; height: 160px; object-fit: cover; border-radius: 100%;" class="memberinfoimg">
						</c:if>
				</div>
				
				<div class="userinfodiv">
				<h5  id="membernickname">닉네임 : ${mozzleUserdto.nickname}</h5>
					<c:if test="${mozzleUserdto.auth_code == '2'}">
					<h5>등급 : 일반회원</h5>
					</c:if>
					<fmt:parseDate var="userjoindate" value="${mozzleUserdto.joined_date}" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="userjoindate2" value="${userjoindate}" pattern="yyyy-MM-dd"/>
					<h5>가입일자 : ${userjoindate2}</h5>
					<h5>글 작성수 : ${mozzleUserdto.postcnt}</h5>
				</div>
				
				<button class="join-btn" type="button" id="btnupdatemy" style="width: 75px;">정보수정</button>
				<button class="join-btn" id="mozzleout" style="width: 75px;">탈퇴하기</button>
			  </div>
			  </div>
			</div>
			
				
				<%-- <!-- 모즐멤버리스트 뿌리는 곳 -->
				<%@ include file="/WEB-INF/view/mozzle/mozzleMemberList.jsp" %> --%>
			</div>
			
			
			<div class="col-sm-9">
				<div class="mo-img">
					<div id= "image-wrap">
					<c:choose>
					<c:when test="${!empty myMozzle.image_saved}">
						<img id="cover-image" src="<%=request.getContextPath()%>/resources/upload/${myMozzle.image_saved}"
							alt="메인" />	
					</c:when>
					<c:otherwise>
						<img id="cover-image" src="<%=request.getContextPath()%>/resources/upload/basic.png"
							alt="메인" />	
					</c:otherwise>
					</c:choose>
					</div>
					<div class="mo-text">
						<div class="mozzle-title-icon">
							<h4>${myMozzle.mozzle_name}</h4>
							<c:if test="${LederCheck eq true}">
								<a href="./manage/modifyMozzleForm.do?mozzle_id=${myMozzle.mozzle_id}"><i class="xi-cog  xi-x"></i></a>
							</c:if>						
						</div>
						<p>${myMozzle.mozzle_intro}
							 <c:if test="${empty mozzleUserdto}">
							 	<!-- 모즐유저디티오없다 -->
							 </c:if>
						</p>
						<div class="mo-member">
							<div>
								<div class="mb-1">
									<c:forEach var="category" items="${categoryList}">
										<a style="color: #aaa"><img id="hash-tag" alt="hash-tag" src="<%=request.getContextPath()%>/resources/images/hashtag.png">${category}</a>&nbsp;
									</c:forEach>
								 </div> 								
								<div>생성일자: ${myMozzle.create_date}</div>
								<div>멤버 : ${myMozzle.memberCnt}</div>
							</div>
							<c:if test="${mozzleUserdto.auth_code == null || mozzleUserdto.auth_code == '3'}">
							<button class="join-btn"  onclick="userSessionCheck()" id="joinbtn">모즐가입</button>
							</c:if>
							<c:if test="${mozzleUserdto.auth_code == '1' || mozzleUserdto.auth_code == '2'}">
							<button class="join-btn" type="button" id="btninvite">멤버 초대</button>
							</c:if>
							
						</div>
					</div>
				</div>
				
				<div class="mo-list">
					<ul>
					
						<li><a  href="#" id="default-move">게시글<input type="hidden" name="move" value="mozzlePost"></a></li>
						<!-- <li>사진첩</li>-->
            			<li><a href="#">일정<input type="hidden" name="move" value="calendar"></a></li>
						<%-- <c:if test="${mozzleUserdto.auth_code == '1' || mozzleUserdto.auth_code == '2'}">
						<li><a href="#">내정보<input type="hidden" name="move" value="mozzleuserMypage"></a></li>
						</c:if> --%>
						<c:if test="${mozzleUserdto.auth_code == '2' || mozzleUserdto.auth_code == null}">
						<li><a href="#">멤버<input type="hidden" name="move" value="mozzlememberList"></a></li>
						</c:if>
						<c:if test="${mozzleLeader.user_id == mozzleUserdto.user_id}">
						<li><a  href="#" id="default-move">멤버관리<input type="hidden" name="move" value="adminmozzleMemberList2"></a></li>
						<li><a  href="#" id="default-move">신고관리<input type="hidden" name="move" value="postreportList"></a></li>
					</c:if>	
					</ul>
				</div>
				
			</div>
			<%@include file= "/WEB-INF/view/mozzle/mozzleJoinForm.jsp"  %>
			<div id="load_mozzle" class="col-sm-9 clear mt-3"></div>
		</div>
		</c:when>
		<c:otherwise>
			<p>비공개 모즐입니다</p>
		</c:otherwise>
		</c:choose>
	</section>


	<div id="footer"></div>



	
 <% String mozzle_id = request.getParameter("mozzle_id");  %>
 <%=mozzle_id%>
 
<!--  <ul>
 <li class="lilili">
 <input type="hidden" value="61" class="post_id">
 61누르기
 </li>
 </ul> -->
 
<script type="text/javascript">
 $(document).ready(function(){
	 
	var moveTo = "<%=(String)session.getAttribute("moveTo")%>";
	console.log(moveTo);
	if(moveTo=='' || moveTo == "null"){
		 $("#load_mozzle").load("mozzlePost.do?mozzle_id=<%=mozzle_id%>");
		 
		<%-- $("#load_mozzle").load("postreportList.do?mozzle_id=<%=mozzle_id%>"); --%>
	} else if(moveTo=="adminmozzleMemberList"){
		 $("#load_mozzle").load("adminmozzleMemberList2.do?mozzle_id=<%=mozzle_id%>");
	}  
	<% session.removeAttribute("moveTo"); %>
	console.log("<%=(String)session.getAttribute("moveTo")%>");
	}); 




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

		});
	});
	
});

//jquery onload
$(function(){
	$("#btninvite").click(function(e){
		e.preventDefault();
		$("#load_mozzle").load("guestInvite.do?mozzle_id=<%=mozzle_id%>");
		
	});
	
	$("#btnupdatemy").click(function(e){
		e.preventDefault();
		$("#load_mozzle").load("mozzleuserMypage.do?mozzle_id=<%=mozzle_id%>");
		
	});
	
	
	$("#mozzleout").click(function(e){
		if (confirm("정말 탈퇴하시겠습니까?") == true){    //확인
			window.location.href = "./deleteuserMozzle.do?mozzle_id="+<%=request.getParameter("mozzle_id")%>;
		 }else{   //취소
		      return;
		  }
			 
	});
	
	

/* 	
	$(".reportclick").click(function(e){
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
		
	
	}); */
	
})


//모즐가입클릭시
function userSessionCheck(){
	var userId = '<%=(String)session.getAttribute("userId")%>';
	console.log(userId);
	var auth = "<c:out value='${mozzleUserdto.auth_code}'/>";
	console.log(auth);
	if(userId=='null'){
//			console.log(userId+"ss");
		alert('로그인이 되어있지 않습니다.');
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