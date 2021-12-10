<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	padding: 20px 40px;
	color: #fff;
	display: inline-block;
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

</head>

<body>
	<jsp:include page="../comm/header.jsp" >
		<jsp:param value="${userId}" name="userId"/>
	</jsp:include>
	<jsp:include page="../comm/myPage-header.jsp" />
	<section class="container-login">
	
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
	</section>

	<jsp:include page="../comm/footer.jsp" />

</body>
</html>















