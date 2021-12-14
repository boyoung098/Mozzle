<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	class="form-control input-login m-datepicker" name="birth"
	placeholder="생년월일을 입력 해주세요" />
</label>
<label>연락처 <input type="tel"
	class="form-control input-login m-datepicker" name="tel"
	placeholder="휴대폰 번호를 입력 해주세요(010-xxxx-xxxx)" />
</label>
<label>이메일 <input type="email"
	class="form-control input-login m-datepicker" name="email"
	placeholder="이메일을 입력 해주세요" />
</label>