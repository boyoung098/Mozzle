<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정상세보기</title>
</head>
<body>
<table border="1">
	<tr>
		<th>ID</th>
		<td>${requestScope.dto.schedule_id} </td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${sessionScope.dto.wirter} </td>
	</tr>
	<tr>
		<th>일정</th>
		<td>${dto.schedule_date}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${dto.title}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="60" readonly="readonly">${dto.content}</textarea> </td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${dto.regdate}</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="수정" 
			onclick="location.href='scheduleupdate.do?schedule_id=${dto.schedule_id}'"/>
			<input type="button" value="삭제" onclick=""/>
			<input type="button" value="목록" onclick=""/>
			<input type="button" value="달력" onclick=""/>
		</td>
	</tr>
</table>
</body>
</html>