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
.container-login {
	width: 350px;
	margin: auto;
}

.login-result{
	color:#e82d55;
}
.input-login {
	height: 40px;
	width: 350px;
	margin-bottom: 10px;
}
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

.my-page-menu ul li:hover{
	background-color: #a00022;
}

.my-page-menu ul li a{
	padding: 20px 40px;
}
.color-btn {
	background: #e82d55;
	color: #fff;
	font-size: 15px;
	border-radius: 4px;
	border: none;
}

.ch-box {
	display: flex;
	justify-content: space-between;
	align-items: baseline;
}

.ch-box2 {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.ch-box label {
	font-size: 13px;
	vertical-align: middle;
	padding-left: 10px;
}

.ch-box ul {
	display: flex;
	font-size: 13px;
}




</style>


<script type="text/javascript">

	$(function(){
		$("#mypage-pw-check").click(function(){
			$.ajax({
				url: "./passwordCheck.do",
				type: "post",
				data: {pw: $("#password-check").val()},
				success: function(result){
					console.log(result);
				}
			});
		});
		
		
	});
</script>

</head>

<body>
	<jsp:include page="../comm/header.jsp" >
		<jsp:param value="${userId}" name="userId"/>
	</jsp:include>
	<section class="container mt-3">
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
	<section class="container content">
		<c:if test="${auth == false}">
			<h2>회원정보 입력</h2>
			<label>정보 확인을 위해 비밀번호를 다시 입력해주세요<br /><br />
				<input type="text" class="form-control input-login"
					name="password-check" placeholder="비밀번호를 입력 해주세요" />
				<button id="mypage-pw-check" class="color-btn input-login">확인</button>
			</label>
			<form action="/myPage.do" method="post">
				<input type="hidden" name="auth" value="true"/>
			</form>
		</c:if>
		
		<c:if test="${auth == true}">
		<form action="./updateUser.do" method="POST">
				<div>
					<label>아이디
					<input type="text" class="form-control input-login"
						name="user_id" placeholder="아이디를 입력 해주세요" />
					</label>
					<p id="id-duplicated-result"></p>
					<label>비밀번호
					<input type="password"
							class="form-control input-login" name="user_pw"
							placeholder="비밀번호를 입력 해주세요" />
					</label>
					<p id="pw-regex-result"></p>
					<label>비밀번호 확인
					<input type="password"
							class="form-control input-login" name="password-confirm"
							placeholder="비밀번호를 한번 더 입력 해주세요" />
					</label>
					<p id="pw-confirm-result"></p>
					<label>이름
					<input type="text"
							class="form-control input-login" name="user_name"
							placeholder="이름을 입력 해주세요" />
					</label>
					<label>생년월일
					<input type="text"
							class="form-control input-login m-datepicker" name="birth"
							placeholder="생년월일을 입력 해주세요" />
					</label>
					<label>연락처
					<input type="tel"
							class="form-control input-login m-datepicker" name="tel"
							placeholder="휴대폰 번호를 입력 해주세요(010-xxxx-xxxx)" />
					</label>
					<label>이메일
					<input type="email"
							class="form-control input-login m-datepicker" name="email"
							placeholder="이메일을 입력 해주세요" />
					</label>
					
					<input type="submit" class="color-btn input-login" value="정보수정" />
				</div>

		</form>
		</c:if>

	</section>

	<jsp:include page="../comm/footer.jsp" />

</body>
</html>















