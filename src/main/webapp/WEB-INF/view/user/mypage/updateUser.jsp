<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	// myPage Load 시, 세션에 담긴 사용자(현재 로그인된 사용자) 정보 출력
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
		
	});
</script>
<div class="container-login">
	<form id="login-form" action="./updateUser.do" method="POST">
		<h2>회원 정보 수정</h2>

		<jsp:include page="../../comm/userInfoForm.jsp" />
		<input type="submit" class="color-btn input-login" value="정보수정" />

	</form>
</div>