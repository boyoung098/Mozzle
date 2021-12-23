<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<%@ include file="/WEB-INF/view/comm/import.jsp"%>
<style>
.login-result {
	color: #e82d55;
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
	$(function() {
		$("input[type=submit]").click(function(e) {
			e.preventDefault();
			$.ajax({
				url : "./resetPwAuth.do",
				type : "post",
				data : {
					user_id : $("input[name=user_id]").val(),
					email : $("input[name=email]").val(),
					user_name : $("input[name=user_name]").val()
				},
				success : function(result) {
					if(result.cnt){
						if(confirm("비밀번호를 재설정하기 위해 인증 메일을 보냅니다.")){
							$("#login-form").submit();
						}
					}
					else{
						$(".login-result").text("올바른 정보를 입력해주세요.");
					}
				}
			});
		});
	});
</script>

</head>

<body>
	<div id="header"></div>
	<section class="content container-login mt-5">
		<form id="login-form" action="./resetPwMail.do" method="POST">

			<h2>비밀번호 재설정</h2>
			<p>비밀번호를 재설정하기 위해 필요한 정보를 입력해주세요</p>
			<p class="login-result"></p>
			<div>
				<label>아이디<input type="text"
					class="form-control input-login" name="user_id"
					placeholder="아이디를 입력 해주세요" /></label> <label>이메일<input type="text"
					class="form-control input-login" name="email"
					placeholder="이메일을 입력 해주세요" /></label> <label>이름<input type="text"
					class="form-control input-login" name="user_name"
					placeholder="이름을 입력 해주세요" /></label> <input type="submit"
					class="color-btn input-login" value="확인" />
			</div>

		</form>
	</section>

</body>
</html>















