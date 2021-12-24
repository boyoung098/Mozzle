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
	$(function(){
		$("input[type=submit]").click(function(e){
			e.preventDefault();
			var pwRegEx = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
			var newPassword = $("input[name=newPassword]").val();
			var confirmPassword = $("input[name=confirmPassword]").val();
			// 비밀번호와 비밀번호 확인이 다를 경우

			if(!pwRegEx.test(newPassword)){
				$(".login-result").text("비밀번호는 영어+숫자 조합으로 8 ~ 16자 사이여야 합니다.");
			}
			else if(newPassword != confirmPassword){
				$(".login-result").text("비밀번호가 일치하지 않습니다.");
			}
			else if(confirm("패스워드를 변경하시겠습니까?")){
				console.log("${findPw_Id}");
				//self.close();
				$.ajax({
					url : "./updatePassword.do",
					type : "post",
					data : {
						user_id: "${findPw_Id}",
						user_pw: $("input[name=newPassword]").val()
					},
					success : function(result) {
						console.log(result);
						if(result.changed){
							alert("비밀번호 재설정에 성공하였습니다. 새로운 비밀번호로 로그인해주세요.");
							self.close();
						}
						else{
							alert("비밀번호 재설정에 실패하였습니다. 다시 시도해주세요.");
							self.close();
						}
					}
				});
			}
			
		});
	});
</script>
</head>

<body>
	<div id="header"></div>
	<section class="content container-login mt-5">
		<form id="login-form" action="./passwordReset.do" method="POST">

			<h2>비밀번호 찾기</h2>
			<p>변경할 패스워드를 입력해주세요</p>
			<p class="login-result"></p>
			<div>
				<label>비밀번호<input type="text"
					class="form-control input-login" name="newPassword" placeholder="새로운 비밀번호를 입력해주세요" />
				</label>
				<label>비밀번호 확인<input type="text"
					class="form-control input-login" name="confirmPassword" placeholder="새로운 비밀번호를 입력해주세요" />
				</label>

				<input type="submit" class="color-btn input-login" value="확인" />
			</div>

		</form>
	</section>

</body>
</html>















