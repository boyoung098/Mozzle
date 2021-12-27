<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 	
	String keyword = (String) session.getAttribute("keyword");
	session.setAttribute("keyword", "");
	System.out.println(keyword);
%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript">
$(document).ready(function(){
	$("#search-btn").click(function () {
		var keyword= $('input[name=inputKeyword]').val();
		$(location).attr("href", "./browseMozzlePage.do?keyword="+ keyword);
	});
});

</script>

<script>
	$(function() {
		$("#myPageGo").click(function(e) {
			e.preventDefault();
			$("#myPageGo-form").submit();
		});
		
		$(".dropdown").on("show.bs.dropdown", function(e){
			$(".dropdown-menu").empty();
			$.ajax({
				url : "<%=request.getContextPath()%>/notice/notification.do",
				type : "post",
				data : {
					userId: "${sessionScope.userId}",
				},
				success : function(result) {
					console.log(result);
					$(result).each(function(){
						console.log(this);
						// 알림에 따라 변수 처리
						var link;
						var content;
						if(this.TYPE == "가입"){
							content = this.MOZZLE_NAME + "가입을 환영합니다!";
							link = "<%=request.getContextPath()%>/firstmozzle.do?mozzle_id=" + this.MOZZLE_ID;
						}
						else if(this.TYPE == "탈퇴"){
							content = this.MOZZLE_NAME + "에서 탈퇴되었습니다."
						}
						// HTML Element 생성
						var $noticeli = $("<li></li>").addClass("notice-list");
						var $noticea = $("<a></a>").attr("href", link);
						if(this.READ_CHECKED == 'Y'){
							$noticea.addClass("checked");
						}
						var src = "<%=request.getContextPath()%>/resources/upload/" + this.IMAGE_SAVED;
						var $noticediv = $("<div><div class='notice-img'><img width='75' height='75' src='" + src + "' /></div><div><p class='wrap'><b>" + this.MOZZLE_NAME + "</b></p><p class='wrap'>" + content + "</p></div></div>").addClass("flex");
						
						var $notice = $noticeli.append($noticea.append($noticediv));
						$(".dropdown-menu").append($notice);
					
					});
					
					
				}
			});
		});

	});
	
</script>

</head>

<body>
	<nav class="navbar container pc_menu">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand mt-1" href="<%=request.getContextPath()%>">
					<img src="<%=request.getContextPath()%>/resources/images/logo/logo.png" />
				</a>
			</div>
			<div class="collapse navbar-collapse select_bar" id="myNavbar">
				<ul class="nav navbar-nav navbar-center">
					<li>
						<div class="input-group intput-width ">
							<input type="text" class="form-control search"
								name="inputKeyword" id="inputKeyword" placeholder=" 찾으시는 모임이 있나요?" value="<%= keyword %>"/>
							<div class="input-group-btn top_search">
								<button type="button" id="search-btn" class="btn btn-default search-btn">
									<i class="xi-search"></i>
								</button>
							</div>
						</div>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${empty sessionScope.userId}">
						<li><a href="<%=request.getContextPath()%>/loginPage.do">로그인</a></li>
						<li><a href="<%=request.getContextPath()%>/registerPage.do">회원가입</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.userId}">
						<li class="dropdown"><a id="notification" href="#" data-toggle="dropdown">${sessionScope.userId}님</a>
							<ul class="dropdown-menu">
								<li><a href="#">HTML</a></li>
								<li><a href="#">CSS</a></li>
								<li><a href="#">JavaScript</a></li>
							</ul></li>
						<li><a id="myPageGo" href="#">마이페이지</a></li>
						<li><a id="logoutGo"
							href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
					</c:if>
				</ul>
				<form id="myPageGo-form"
					action="<%=request.getContextPath()%>/user/myPage.do" method="post">
					<input type="hidden" name="auth" value="false" />
				</form>
			</div>
		</div>
	</nav>
	<hr class="nav-hr" />
	<div class="mobile_menu">
		<div class="header_mobile">
		  <div class="menu_btn">
		    <a href="#">       
		      <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMjQgNmgtMjR2LTRoMjR2NHptMCA0aC0yNHY0aDI0di00em0wIDhoLTI0djRoMjR2LTR6Ii8+PC9zdmc+">
		    </a>
		    <div class="m_logo">
		    	<a  href="<%=request.getContextPath()%>">
				<img src="<%=request.getContextPath()%>/resources/images/logo/logo.png" />
			  </a>
		    </div>
		  </div>
		  
		</div>
		<div class="menu_bg"></div>
			<div class="sidebar_menu">
			    <div class="close_btn">
			    	<a href="#">       
			        	<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMjMuOTU0IDIxLjAzbC05LjE4NC05LjA5NSA5LjA5Mi05LjE3NC0yLjgzMi0yLjgwNy05LjA5IDkuMTc5LTkuMTc2LTkuMDg4LTIuODEgMi44MSA5LjE4NiA5LjEwNS05LjA5NSA5LjE4NCAyLjgxIDIuODEgOS4xMTItOS4xOTIgOS4xOCA5LjF6Ii8+PC9zdmc+">
			        </a>
			    </div>
			    <div>
		        	<ul class="mobile_my">
						<c:if test="${empty sessionScope.userId}">
							<li><a href="<%=request.getContextPath()%>/loginPage.do">로그인</a></li>
							<li><a href="<%=request.getContextPath()%>/registerPage.do">회원가입</a></li>
						</c:if>
						<c:if test="${not empty sessionScope.userId}">
							<li class="dropdown"><a id="notification" href="#">${sessionScope.userId}님</a>
							<li><a id="myPageGo" href="#">마이페이지</a></li>
							<li><a id="logoutGo"
								href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
						</c:if>
					</ul>
					<form id="myPageGo-form"
						action="<%=request.getContextPath()%>/user/myPage.do" method="post">
						<input type="hidden" name="auth" value="false" />
					</form>
			        </div>
			    <div>
			    	<div class="input-group intput-width ">
						<input type="text" class="form-control search"
							name="inputKeyword" id="inputKeyword" placeholder=" 찾으시는 모임이 있나요?" value="<%= keyword %>"/>
						<div class="input-group-btn top_search">
							<button type="button" id="search-btn" class="btn btn-default">
								<i class="xi-search"></i>
							</button>
						</div>
					</div>
			    </div>
			    <!-- <ul class="menu_wrap">
			          <li><a href="#">메뉴01</a></li>
			          <li><a href="#">메뉴02</a></li>
			          <li><a href="#">메뉴03</a></li>
			          <li><a href="#">메뉴04</a></li>
			    </ul> -->
			</div>
		</div>
<script>
  $(document).ready(function(){

      $('.menu_btn>a').on('click', function(){
          $('.menu_bg').show(); 
          $('.sidebar_menu').show().animate({
              left:0
          });  
      });
      $('.close_btn>a').on('click', function(){
          $('.menu_bg').hide(); 
          $('.sidebar_menu').animate({
              left: '-' + 50 + '%'
                     },function(){
          $('.sidebar_menu').hide(); 
          }); 
      });

  });
</script>
</body>
</html>