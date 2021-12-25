<%@page import="com.mozzle.web.dto.schedule.ScheduleDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정추가</title>
<% 						//
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int date = Integer.parseInt(request.getParameter("date"));
%>
</head>
<body>
	<h1>일정 등록</h1>
	<form action="./scheduleinsert.do" method="post">
		<table border="1">
			<tr>
				<th>Schedule_id</th>
				<td><input type="text" name="schedule_id" value="12" readonly="readonly"></td>
			</tr>
			<tr>
				<th>Writer</th>
				<td><input type="text" name="writer" value="작성자2" readonly="readonly"></td>
			</tr>
			<!-- <tr>
				<th>일정</th>
				<td>
					<select name="year"><option>2021</option></select>년
					<select name="month"><option>12</option></select>월
					<select name="date"><option>25</option></select>일
					<select name="hour"><option>12</option></select>시
					<select name="min"><option>7</option></select>분
				</td>
			</tr> -->
			<tr>
				<th>Title</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>Content</th>
				<td><textarea rows="10" cols="60" name="content"></textarea></td>
			</tr>
			<tr>
				<th>Schedule_date</th>
				<td><input type="datetime-local" name="schedule_date"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="일정추가"/>
					<input type="button" value="돌아가기" onclick="calendar()"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>