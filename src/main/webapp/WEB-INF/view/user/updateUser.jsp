<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container-login">
	<form id="login-form" action="./updateUser.do" method="POST">
		<h2>회원 정보 수정</h2>

		<jsp:include page="../comm/userInfoForm.jsp" />
		<input type="submit" class="color-btn input-login" value="정보수정" />

	</form>
</div>