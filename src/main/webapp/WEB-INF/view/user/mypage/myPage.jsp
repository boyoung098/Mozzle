<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <% 
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(int i = 0; i < cookies.length; i++){
			String name = cookies[i].getName();
			if(name.equals("token")){
				pageContext.setAttribute("token", cookies[i].getValue());
				break;
			}
		}
	}
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="/WEB-INF/view/comm/import.jsp" %>
<style>

.my-page-menu{
	background-color: #e82d55;
}
.my-page-menu ul{
	display: flex;
	flex-direction: row;
	justify-content: center;
	
}
.my-page-menu ul li{
	padding: 13px 0;
	color: #fff;
	display: inline-block;
	cursor: pointer;
}

.my-page-menu ul li a:hover, .my-page-menu ul li a.active{
	background-color: #a00022;
}

.my-page-menu ul li a{
	padding: 13px 40px;
}

.auth-input{
	display:flex;
	flex-direction:column;
	align-items: center;
}

</style>


<script type="text/javascript">
	
	$(function(){
		
		// auth Ajax
		$("#mypage-pw-check").click(function(){
			$.ajax({
				url: "./myPageAuth.do",
				type: "post",
				data: {passwordChk: $("input[name=passwordChk]").val()},
				success: function(data){
					console.log(data);
					if(data.result){
						$("#myPageAuth-success").submit();
					}
					else{
						$(".login-result").text("비밀번호가 일치하지 않습니다.");
					}
				}
			});
		});
		
		var auth = "${auth}";
		
		if(auth){
			var menu = "updateUser";
			$(".my-page-menu ul li a").each((idx, item) => {
				$(item).click(function(e){
					e.preventDefault();
					console.log($(this).children("input").val());
					if(auth){
						$("#load-content").load($(item).children("input").val() + ".do");
						menu = $(item).children("input").val();
						$(".my-page-menu ul li a").each((idx, item) => {
							if(menu == $(item).children("input").val()){
								$(item).addClass("active");
							}
							else{
								$(item).removeClass("active");
							}
						});
					}
				})
				
			});
			// 비밀번호 입력 후 디폴트 메뉴
			$("#default-mypage-menu").trigger("click");
		}
		
	
		// $("#load-test").load("../");
		
		
	});
</script>

</head>

<body>
	<div id="header"></div>
	<section class="container">
		<div class="my_page_bn">
			<img class="width-100" alt="모즐 이미지" src="<%=request.getContextPath()%>/resources/images/myimg.png">
		</div>
		<div class="my-page-menu">
			<ul>
				<li><a href="#" id="default-mypage-menu">정보수정<input type="hidden" name="menu" value="updateUser"/></a></li>
				<li><a href="#">내가쓴글<input type="hidden" name="menu" value="myThread"/></a></li>
				<li><a href="#">모즐관리<input id="manageMozzle" type="hidden" name="menu" value="manageMozzle"/></a></li>
				<li><a href="#">알림<input type="hidden" name="menu" value="notification"/></a></li>
			</ul>
		</div>
	</section>
	

	<section class="container contaienr-hi">	
		<c:if test="${auth == false}">
		<div class="text-center mt-5 bt-5">
			<h2>회원정보 입력</h2>
			<div>
			<p>정보 확인을 위해 비밀번호를 다시 입력해주세요</p>
			<p class="login-result"></p>
			</div>
			<div class="auth-input">
				<input type="password" class="form-control input-login"
					name="passwordChk" placeholder="비밀번호를 입력 해주세요" />
				<button id="mypage-pw-check" class="color-btn input-login">확인</button>
			</div>
		</div>
		</c:if>
		
		
		<form id="myPageAuth-success" action="./myPage.do" method="post">
			<input type="hidden" name="auth" value="true"/>
		</form>
		
		<c:if test="${auth == true}">
			<div id="load-content"></div>
		</c:if>

	</section>

	<div id="footer"></div>

</body>
</html>















