<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<jsp:include page="../comm/import.jsp" />
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
	<jsp:include page="../comm/header.jsp" />
	<section class="content container-login mt-5">
		<form id="login-form" action="./logingo.do" method="POST">

				<h2>로그인</h2>
				<p class="login-result">${msg}</p>
				<div>
					<input type="text" class="form-control input-login" name="id"
						placeholder="아이디를 입력 해주세요" /> <input type="text"
						class="form-control input-login" name="password"
						placeholder="비밀번호를 입력 해주세요" />
					<div class="ch-box">
						<div>
							<input type="checkbox" id="ch" name="remember-me" value="true"><label
								for="ch">아이디 저장</label>
						</div>
						<ul>
							<li><a href="#">아이디 ㅣ</a></li>
							<li><a href="#">비밀번호 찾기</a></li>
						</ul>
					</div>
					<input type="submit" class="color-btn input-login" value="로그인" />
				</div>

		</form>
	</section>

	<jsp:include page="../comm/footer.jsp" />

</body>
</html>















