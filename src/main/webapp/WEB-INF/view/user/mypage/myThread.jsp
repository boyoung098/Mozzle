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
				<jsp:param value="${post.IMAGE_ORIGIN}" name="image_origin"/>
				<jsp:param value="${post.IMAGE_SAVED}" name="image_saved"/>
				<jsp:param value="${post.MOZZLE_NAME}" name="mozzle_name"/>
				<jsp:param value="${post.NICKNAME}" name="nickname"/>	
				<jsp:param value="${post.POST_ID}" name="post_id"/>
				<jsp:param value="${post.MOZZLE_ID}" name="mozzle_id"/>
				<jsp:param value="${post.USER_ID}" name="user_id"/>
				<jsp:param value="${post.CONTENT}" name="content"/>
				<jsp:param value="${post.REFER}" name="refer"/>
				<jsp:param value="${post.REGDATE}" name="regdate"/>
			</jsp:include>
		</c:forEach>
	</div>
</body>
</html>