<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
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

				<h2>회원가입</h2>
				<div>
					<label>아이디
					<input type="text" class="form-control input-login"
						name="id" placeholder="아이디를 입력 해주세요" />
					</label>
					<label>비밀번호
					<input type="text"
							class="form-control input-login" name="password"
							placeholder="비밀번호를 입력 해주세요" />
					</label>
					<label>비밀번호 확인
					<input type="text"
							class="form-control input-login" name="password"
							placeholder="비밀번호를 한번 더 입력 해주세요" />
					</label>
					<label>이름
					<input type="text"
							class="form-control input-login" name="password"
							placeholder="비밀번호를 한번 더 입력 해주세요" />
					</label>
					<label>생년월일
					<input type="text"
							class="form-control input-login m-datepicker" name="password"
							placeholder="비밀번호를 한번 더 입력 해주세요" />
					</label>
					<label>이메일
					<input type="text"
							class="form-control input-login m-datepicker" name="password"
							placeholder="비밀번호를 한번 더 입력 해주세요" />
					</label>
					
					<input type="submit" class="color-btn input-login" value="회원가입" />
				</div>

		</form>
	</section>

	<jsp:include page="../comm/footer.jsp" />

</body>
</html>















