<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<jsp:include page="../comm/import.jsp" />

<script type="text/javascript">

$(function(){
	
	$(document).on("input", "input[name=user_id]", function(e){
		var idRegEx = /^[A-Za-z]{1}[A-Za-z0-9]{5,19}$/g;
		var idVal = $(this).val();
		console.log(idVal);
		var result = idRegEx.test(idVal);
		if(idVal.indexOf(" ") != -1){
			$("#id-duplicated-result").text("아이디에 공백은 포함될 수 없습니다");
		}
		//else if(idVal.length <= 5 || idVal.length > 20){
		else if(result){
			e.preventDefault();
			$.ajax({
				url:"./duplication/chkid.do",
				type:"post",
				data:{id: idVal},
				success: function(result){
					if(result.duplicated){
						$("#id-duplicated-result").text("사용할 수 없는 아이디입니다.");
					}
					else{
						$("#id-duplicated-result").text("사용가능한 아이디입니다.");
					}
				}
			});
		}
		else{
			$("#id-duplicated-result").text("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
		}
	});
	
	// 비밀번호 유효성 체크
	$("input[name=user_pw]").keyup(function(){
		var pwRegEx = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
		console.log(pwRegEx.test($("input[name=user_pw]").val()));
		if(!pwRegEx.test($("input[name=user_pw]").val())){
			$("#pw-regex-result").text("비밀번호는 영어+숫자 조합으로 8 ~ 16자 사이여야 합니다.");
		}
		else{
			$("#pw-regex-result").text("");
		}
	});
	
	// 비밀번호 확인 체크
	$("input[name=password-confirm]").keyup(function(){
		if($("input[name=user_pw]").val() !== $("input[name=password-confirm]").val()){
			$("#pw-confirm-result").text("비밀번호와 똑같이 입력해주세요");
		}
		else{
			$("#pw-confirm-result").text("");
		}
	});
	
	
});
</script>

</head>

<body>
	<jsp:include page="../comm/header.jsp" />
	<section class="container-login mt-3">
		<form id="login-form" action="./register.do" method="POST">

				<h2>회원가입</h2>
				<div>
					
					<jsp:include page="../comm/userInfoForm.jsp" />
					<input type="submit" class="color-btn input-login" value="회원가입" />
				</div>

		</form>
	</section>

	<jsp:include page="../comm/footer.jsp" />

</body>
</html>















