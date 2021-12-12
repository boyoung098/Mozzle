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
	var idReq = null;
	
	// 아이디 정규표현식
	var idRegEx = /^[A-Za-z]+[A-Za-z0-9]{5,19}$/g;
	var pwRegEx = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
	// 아이디 유효성 체크
	$("input[name=user_id]").keyup(function(){
		var idVal = $("input[name=user_id]").val();
		if(idVal.indexOf(" ") != -1){
			$("#id-duplicated-result").text("아이디에 공백은 포함될 수 없습니다");
		}
		else if(idVal.length <= 5 || idVal.length > 20){
		//else if(!idRegEx.test(idVal)){
				$("#id-duplicated-result").text("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
		}
		else{
			if(idReq) idReq.abort();
			idReq = $.ajax({
				url:"./duplication/chkid.do",
				type:"post",
				data:{id: $("input[name=user_id]").val()},
				success: function(result){
					//console.log(result);
					if(result.duplicated){
						$("#id-duplicated-result").text("사용할 수 없는 아이디입니다.");
					}
					else{
						$("#id-duplicated-result").text("사용가능한 아이디입니다.");
					}
				}
				
			});
		}
		
	});
	
	
	// 비밀번호 유효성 체크
	$("input[name=user_pw]").keyup(function(){
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
					<label>아이디
					<input type="text" class="form-control input-login"
						name="user_id" placeholder="아이디를 입력 해주세요" />
					</label>
					<p id="id-duplicated-result"></p>
					<label>비밀번호
					<input type="password"
							class="form-control input-login" name="user_pw"
							placeholder="비밀번호를 입력 해주세요" />
					</label>
					<p id="pw-regex-result"></p>
					<label>비밀번호 확인
					<input type="password"
							class="form-control input-login" name="password-confirm"
							placeholder="비밀번호를 한번 더 입력 해주세요" />
					</label>
					<p id="pw-confirm-result"></p>
					<label>이름
					<input type="text"
							class="form-control input-login" name="user_name"
							placeholder="이름을 입력 해주세요" />
					</label>
					<label>생년월일
					<input type="text"
							class="form-control input-login m-datepicker" name="birth"
							placeholder="생년월일을 입력 해주세요" />
					</label>
					<label>연락처
					<input type="tel"
							class="form-control input-login m-datepicker" name="tel"
							placeholder="휴대폰 번호를 입력 해주세요(010-xxxx-xxxx)" />
					</label>
					<label>이메일
					<input type="email"
							class="form-control input-login m-datepicker" name="email"
							placeholder="이메일을 입력 해주세요" />
					</label>
					
					<input type="submit" class="color-btn input-login" value="회원가입" />
				</div>

		</form>
	</section>

	<jsp:include page="../comm/footer.jsp" />

</body>
</html>















