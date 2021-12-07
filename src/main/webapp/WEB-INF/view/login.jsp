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
	#login-form{
		display: flex;
		justify-content: center;
	}
	tr{
		margin: 20px;
	}
</style>
<body>
	<jsp:include page="./comm/header.jsp" />
	<section class="content">
		<form id="login-form" action="./logingo.do" method="POST">
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















