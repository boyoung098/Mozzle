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

<script type="text/javascript">
	$(function(){
		$("input[type=submit]").click(function(e){
			e.preventDefault();
			$.ajax({
				url : "./mailCheck.do",
				type : "post",
				data : {
					code : $("input[name=code]").val()
				},
				success : function(result) {
					console.log(result.equals);
					if(result.equals){
						alert("이메일 인증이 완료되었습니다.");
						window.opener.document.getElementById("mail-duplicated-result").textContent = "사용 가능한 이메일입니다.";
						window.opener.document.querySelector("input[name=email]").value = "${email}";
						window.opener.mailChk = true;
						window.close();
					}
					else{
						$(".login-result").text("인증코드가 일치하지 않습니다.");
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
		<form id="login-form" action="./passwordReset.do" method="POST">

				<h2>회원가입 이메일 인증</h2>
				<p>메일로 전송된 인증번호를 입력해주세요</p>
				<p class="login-result"></p>
				<div>
					<label>인증번호
					<input type="text" class="form-control input-login" name="code"
						placeholder="인증코드" /></label>
					<input type="submit" class="color-btn input-login" value="확인" />
				</div>

		</form>
	</section>

</body>
</html>















