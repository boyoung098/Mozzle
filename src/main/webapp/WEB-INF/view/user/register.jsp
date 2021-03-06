<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<%@ include file="../comm/import.jsp" %>

<script type="text/javascript">
var idChk = false;
var pwChk = false;
var cpwChk = false;
var mailChk = false;
$(function(){
	
	$(document).on("input", "input[name=user_id]", function(e){
		var idRegEx = /^[A-Za-z]{1}[A-Za-z0-9]{5,19}$/g;
		var idVal = $(this).val();
		console.log(idVal);
		var result = idRegEx.test(idVal);
		if(idVal.indexOf(" ") != -1){
			$("#id-duplicated-result").text("아이디에 공백은 포함될 수 없습니다");
			idChk = false;
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
						idChk = false;
					}
					else{
						$("#id-duplicated-result").text("사용가능한 아이디입니다.");
						idChk = true;
					}
				}
			});
		}
		else{
			$("#id-duplicated-result").text("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
			idChk = false;
		}
	});
	
	// 비밀번호 유효성 체크
	$("input[name=user_pw]").keyup(function(){
		var pwRegEx = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
		if(!pwRegEx.test($("input[name=user_pw]").val())){
			$("#pw-regex-result").text("비밀번호는 영어+숫자 조합으로 8 ~ 16자 사이여야 합니다.");
			pwChk = false;
		}
		else{
			$("#pw-regex-result").text("");
			pwChk = true;
		}
	});
	
	// 비밀번호 확인 체크
	$("input[name=password-confirm]").keyup(function(){
		if($("input[name=user_pw]").val() !== $("input[name=password-confirm]").val()){
			$("#pw-confirm-result").text("비밀번호와 똑같이 입력해주세요.");
			cpwChk = false;
		}
		else{
			$("#pw-confirm-result").text("");
			cpwChk = true;
		}
	});
	
	// 생년월일 유효성 체크(오늘날짜 이후라면 선택X)
	$("input[name=birth]").change(function(e){
		e.preventDefault();
		var today = new Date().valueOf();
		var selected = new Date(e.target.value).valueOf();
		if(today <= selected){
			e.target.value = "";
		}
	});

	
	// 이메일 중복 체크
	$(document).on("click", "#email-auth", function(e){
		e.preventDefault();
		var emailRegEx = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var emailVal = $("input[name=email_input]").val();
		console.log(emailVal);
		var result = emailRegEx.test(emailVal);
		if(emailVal.indexOf(" ") != -1){
			$("#mail-duplicated-result").text("이메일에 공백은 포함될 수 없습니다.");
			mailChk = false;
		}
		//else if(idVal.length <= 5 || idVal.length > 20){
		else if(result){
			e.preventDefault();
			$.ajax({
				url:"./duplication/chkmail.do",
				type:"post",
				data:{email: emailVal},
				success: function(result){
					if(result.duplicated){
						$("#mail-duplicated-result").text("사용할 수 없는 이메일입니다.");
						mailChk = false;
					}
					else{
						var url = './form/mailAuth.do?email=' + $("input[name=email_input]").val();
						var title = '이메일 인증';
						var attr = 'width=450px, height=550px';
						window.open(url, title, attr);
					}
				}
			});
		}
		else{
			$("#mail-duplicated-result").text("이메일 형식에 맞게 입력해주세요.");
		}
	});
	
	$("input[type=submit]").click(function(e){
		e.preventDefault();
		console.log(mailChk);
		if(!idChk){
			alert("아이디를 확인해주세요.");
		}
		else if(!pwChk){
			alert("비밀번호는 영어+숫자 조합으로 8 ~ 16자 사이여야 합니다.");
		}
		else if(!cpwChk){
			alert("비밀번호 확인을 비밀번호와 똑같이 입력해주세요.");
		}
		else if(!mailChk){
			alert("이메일 인증을 완료해주세요.")
		}
		else{
			$("#login-form").submit();
		}

	
	});
	
	
});
</script>

</head>

<body>
	<div id="header"></div>
	<section class="container-join mt-3">
		<form id="login-form" action="./register.do" method="POST">
				
				<h2>회원가입</h2>
				<div>
					
					<jsp:include page="../comm/userInfoForm.jsp" />
					<input type="submit" class="color-btn input-login" value="회원가입" />
				</div>

		</form>
	</section>
	
	<div id="footer"></div>

</body>
</html>















