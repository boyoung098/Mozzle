<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<jsp:include page="./comm/import.jsp" />
<style>
</style>
</head>
<style>

.container-login {
    width:350px;
    margin: auto;
    height: 560px;
}

.input-login {
    height: 40px;
    width: 350px;
    margin-bottom: 10px;
}

.color-btn{
    background:#e82d55;
    color:#fff;
    font-size:15px;
    border-radius: 4px;
    border:none;
}
.ch-box {
    display: flex;
    justify-content: space-between;
    align-items: baseline;
}
.ch-box2{
    display: flex;
    justify-content: center;
    margin-top: 20px;
}
.ch-box label{
    font-size: 13px;
    vertical-align: middle;
    padding-left: 10px;
}
.ch-box ul {
    display: flex;
    font-size: 13px;
}
</style>
<body>
	<jsp:include page="./comm/header.jsp" />
	<section class="content container-login mt-5">
		<form id="login-form" action="./logingo.do" method="POST">

			<section class="container-login mt-5" id="new-mozzle">
				<h2>로그인</h2>
					<div>
						<input type="text" class="form-control input-login" name=""
							placeholder="아이디를 입력 해주세요" /> <input type="text"
							class="form-control input-login" name=""
							placeholder="비밀번호를 입력 해주세요" />
						<div class="ch-box">
							<div>
								<input type="checkbox" id="ch"><label for="ch">아이디
									저장</label>
							</div>
							<ul>
								<li><a href="#">아이디 ㅣ</a></li>
								<li><a href="#">비밀번호 찾기</a></li>
							</ul>
						</div>
						<input type="submit" class="color-btn input-login" value="로그인" />
					</div>
			</section>
			<table>
				<thead>
					<tr>
						<td colspan="2"><h2>로그인</h2></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">msg:${msg}</td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="id"
							placeholder="아이디를 입력해주세요" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="password" name="password"
							placeholder="비밀번호를 입력해주세요" /></td>
					</tr>
					<tr>
						<td><label><input name="remember-me" type="checkbox"
								value="true">자동로그인</label></td>
						<td><a href="./findInfo">아이디/비밀번호 찾기</a></td>
					</tr>
					<tr>
						<td><input type="submit" value="로그인" /></td>
					</tr>
					<tr>
						<td><input type="submit"
							onclick="location.href='./singUpgo.do'" value="회원가입" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>

	<jsp:include page="./comm/footer.jsp" />

</body>
</html>















