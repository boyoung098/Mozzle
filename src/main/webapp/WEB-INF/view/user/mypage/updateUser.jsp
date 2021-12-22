<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	// myPage Load 시, 세션에 담긴 사용자(현재 로그인된 사용자) 정보 출력
	var pwChk = false;
	var cpwChk = false;
	$(function(){
		$.ajax({
			url:"./myPage/userInfo.do",
			type:"post",
			data:{id: "${sessionScope.userId}"},
			success: function(user){
				console.log(user);
				var birth = user.birth.split(" ");
				$("input[name=user_name]").val(user.user_name);
				$("input[name=birth]").val(birth[0]);
				$("input[name=tel]").val(user.tel);
				$("input[name=email]").val(user.email);
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
		
		// 생년월일 유효성 체크
		$("input[name=birth]").change(function(e){
			e.preventDefault();
			var today = new Date().valueOf();
			var selected = new Date(e.target.value).valueOf();
			if(today <= selected){
				alert("오늘 날짜 이전으로 선택해주세요");
				e.target.value = "";
			}
		});
	});
</script>
<div class="container-login">
	<form id="login-form" action="./updateUserInfo.do" method="post">
		<h2>회원 정보 수정</h2>

		<jsp:include page="../../comm/userInfoForm.jsp" />
		<input type="submit" class="color-btn input-login" value="정보수정" />

	</form>
</div>