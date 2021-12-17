<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<%@ include file="../../comm/import.jsp" %>
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

<script type="text/javascript">
	$(function(){
		$("#find-id").click(function(e){
			e.preventDefault();
			var url = './loginPage.do';
			var title = '아이디중복검사';
			var attr = 'width=450px, height=550px';
			window.open(url, title, attr);
		});
		
		$("#find-password").click(function(e){
			e.preventDefault();
			var url = './';
			var title = '아이디중복검사';
			var attr = 'width=450px, height=550px';
			window.open(url, title, attr);
			
		});
	});
</script>
</head>

<body>
	<div id="header"></div>
	<section class="content container-login mt-5">
		<form id="login-form" action="./logingo.do" method="POST">

				<h2>아이디 찾기</h2>
				<p>아이디를 찾기 위해 필요한 정보를 입력해주세요</p>
				<div>
					<input type="text" class="form-control input-login" name="id"
						placeholder="아이디를 입력 해주세요" /> <input type="text"
						class="form-control input-login" name="password"
						placeholder="비밀번호를 입력 해주세요" />

					<input type="submit" class="color-btn input-login" value="로그인" />
				</div>

		</form>
	</section>

</body>
</html>















