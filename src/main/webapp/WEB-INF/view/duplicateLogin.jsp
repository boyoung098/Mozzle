<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복로그인</title>
<script>
	alert("중복로그인되어 로그아웃합니다.");
	location.href="<%=request.getContextPath()%>/logout.do"
</script>
</head>
<body>

</body>
</html>