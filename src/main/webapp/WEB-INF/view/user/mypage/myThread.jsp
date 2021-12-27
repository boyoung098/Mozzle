<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content">
		<h2>내가쓴글</h2>
		<c:forEach var="post" items="${posts}">
			<jsp:include page="../../comm/mozzlePost.jsp">
				<jsp:param value="${post.post_id}" name="post_id"/>
				<jsp:param value="${post.mozzle_id}" name="mozzle_id"/>
				<jsp:param value="${post.user_id}" name="user_id"/>
				<jsp:param value="${post.content}" name="content"/>
				<jsp:param value="${post.refer}" name="refer"/>
				<jsp:param value="${post.regdate}" name="regdate"/>
			</jsp:include>
		</c:forEach>
	</div>
</body>
</html>