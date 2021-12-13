<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공!</title>
</head>
<body>

환영합니다!<br>
${user}

<h1>This is the body of the sample view</h1>
	<security:authorize access="isRememberMe()">
		<h2># This user is login by "Remember Me Cookies".</h2>
	</security:authorize>

	
    <security:authorize access="hasRole('User')">
        ${userid}님 반갑습니다!
    </security:authorize>
	<br />
    <a href="./logout.do">Logout</a>
    <br />
    <p> accessToken is : ${accessToken}</p>
    <br />
    <p> refreshToken is : ${refreshToken}</p>
</body>
</html>