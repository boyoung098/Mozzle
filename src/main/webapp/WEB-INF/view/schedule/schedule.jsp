<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=%>
<jsp:include page="./calendar.jsp">
	<jsp:param value="year" name="year"/>
	<jsp:param value="month" name="month"/>
</jsp:include>
</body>
</html>