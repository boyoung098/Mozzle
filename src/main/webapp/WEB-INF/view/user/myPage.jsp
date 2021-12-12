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
<jsp:include page="../comm/import.jsp" />
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
	padding: 20px 0;
	color: #fff;
	display: inline-block;
	cursor: pointer;
}

.my-page-menu ul li a:hover, .my-page-menu ul li a.active{
	background-color: #a00022;
}

.my-page-menu ul li a{
	padding: 20px 40px;
}

.my-thread{
	display
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
				}
			});
		});
		
		// menu
		var menu = "${menu}";
		console.log(menu);
		var menulist = [];
		$(".my-page-menu ul li a").each((idx, item) => {
			menulist.push($(item).text());
			if(menu == $(item).text()){
				$(item).addClass("active");
			}
			
			$(item).click(function(e){
				e.preventDefault();
				if(!${auth}){
					$("input[name=auth]").val(${auth});
				}
				$("input[name=menu]").val($(this).text());
				$("#myPageAuth-success").submit();
			})
			
		});

		console.log(menulist);
		
		
	});
</script>

</head>

<body>
	<jsp:include page="../comm/header.jsp" >
		<jsp:param value="${sessionScope.userId}" name="userId"/>
	</jsp:include>
	<section class="container">
		<div>
			<img class="width-100" alt="모즐 이미지" src="<%=request.getContextPath()%>/resources/images/bn.png">
		</div>
		<div class="my-page-menu">
			<ul>
				<li><a href="#">정보수정</a></li>
				<li><a href="#">내가쓴글</a></li>
				<li><a href="#">북마크</a></li>
				<li><a href="#">멤버초대</a></li>
			</ul>
		</div>
	</section>
	
	
	<section class="container">	
		<c:if test="${auth == false}">
		<div class="text-center mt-5 bt-5">
			<h2>회원정보 입력</h2>
			<label>정보 확인을 위해 비밀번호를 다시 입력해주세요<br /><br />
				<input type="text" class="form-control input-login"
					name="passwordChk" placeholder="비밀번호를 입력 해주세요" />
				<button id="mypage-pw-check" class="color-btn input-login">확인</button>
			</label>
		</div>
		</c:if>
		<form id="myPageAuth-success" action="./myPage.do" method="post">
			<input type="hidden" name="auth" value="true"/>
			<input type="hidden" name="menu" value="정보수정"/>
		</form>
		
		<c:if test="${auth == true}">
			<c:if test="${menu == '정보수정'}">
			<div class="container-login">
				<form id="login-form" action="./updateUser.do" method="POST">
					<h2>회원 정보 수정</h2>
	
					<jsp:include page="../comm/userInfoForm.jsp" />	
					<input type="submit" class="color-btn input-login" value="정보수정" />
		
				</form>
			</div>
			</c:if>
			<c:if test="${menu == '내가쓴글'}">
			<div class="content">
				<h2>내가쓴글</h2>
	
		
			</div>
			</c:if>
			<c:if test="${menu == '북마크'}">
				<div class="content">
				<h2>북마크</h2>
	
		
				</div>
			</c:if>
			<c:if test="${menu == '멤버초대'}">
				<div class="content">
				<h2>멤버초대</h2>
	
		
				</div>
			</c:if>
		</c:if>

	</section>

	<jsp:include page="../comm/footer.jsp" />

</body>
</html>















