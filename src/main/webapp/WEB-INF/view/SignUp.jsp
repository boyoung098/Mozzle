<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./singUpSc.do" method="post">
이름 : <input type="text" name="userName">
아이디 : <input type="text" name="userId">
비밀번호 :<input type="text" name="userPw">
생년월일 :<input type="text" name="birth">
이메일 :<input type="text" name="email">
연락처 :<input type="text" name="tel">
<input type="submit" value="회원가입">
</form>
</body>
</html>
<!-- 	private String userName;
	private String userId;
	private String userPw;
	private	String birth;
	private String email;
	private String tel; -->