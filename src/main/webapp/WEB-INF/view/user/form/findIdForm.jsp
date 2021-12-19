<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<%@ include file="/WEB-INF/view/comm/import.jsp" %>
<style>


.login-result{
	color:#e82d55;
}
.input-login {
	height: 40px;
	width: 350px;
	margin-bottom: 10px;
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
	<div id="header"></div>
	<section class="content container-login mt-5">
		<form id="login-form" action="./findIdResult.do" method="POST">

				<h2>아이디 찾기</h2>
				<p>아이디를 찾기 위해 필요한 정보를 입력해주세요</p>
				<div>
					<input type="text" class="form-control input-login" name="email"
						placeholder="이메일을 입력 해주세요" /> 
					<input type="text"
						class="form-control input-login" name="user_name"
						placeholder="이름을 입력 해주세요" />

					<input type="submit" class="color-btn input-login" value="로그인" />
				</div>

		</form>
	</section>

</body>
</html>















