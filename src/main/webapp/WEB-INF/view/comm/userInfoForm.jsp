<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.side-input{
		width:275px;
	}
	.side-btn{
		width: 75px;
	}
	.inline-flex{
		display: inline-flex;
	}
</style>
<label>아이디 
	<input type="text" class="form-control input-login"
		name="user_id" placeholder="아이디를 입력 해주세요" value="${sessionScope.userId}" ${sessionScope.userId != null ? "readonly": ""}/>
</label>
<p id="id-duplicated-result"></p>
<label>비밀번호 <input type="password"
	class="form-control input-login" name="user_pw"
	placeholder="비밀번호를 입력 해주세요" />
</label>
<p id="pw-regex-result"></p>
<label>비밀번호 확인 <input type="password"
	class="form-control input-login" name="password-confirm"
	placeholder="비밀번호를 한번 더 입력 해주세요" />
</label>
<p id="pw-confirm-result"></p>
<label>이름 <input type="text" class="form-control input-login"
	name="user_name" placeholder="이름을 입력 해주세요" />
</label>
<label>생년월일 <input type="date"
	class="form-control input-login" name="birth"
	placeholder="생년월일을 입력 해주세요" />
</label>
<label>연락처 <input type="tel"
	class="form-control input-login" name="tel"
	placeholder="휴대폰 번호를 입력 해주세요(010-xxxx-xxxx)" />
</label>
<c:if test="${sessionScope.userId != null}">
<label>이메일 
	<input type="email"
	class="form-control input-login" name="email"
	placeholder="이메일을 입력 해주세요" readonly/>
</label>
</c:if>
<c:if test="${sessionScope.userId == null}">
<label>이메일 
	<span class="inline-flex">
	<input type="hidden"
	class="form-control input-login side-input" name="email" />
	<input type="email" name="email_input"
	class="form-control input-login side-input"
	placeholder="이메일을 입력 해주세요" />
	<button id="email-auth" class="color-btn input-login side-btn">인증하기</button>
	</span>
</label>
</c:if>
<p id="mail-duplicated-result"></p>