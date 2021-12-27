<%@page import="java.util.Calendar"%>
<%@page import="com.mozzle.web.dto.schedule.ScheduleDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정추가</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<% 						//
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int date = Integer.parseInt(request.getParameter("date"));

	//현재시간구하기
	Calendar cal = Calendar.getInstance();
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	int min = cal.get(Calendar.MINUTE);
%>
<script type="text/javascript">

	
</script>
</head>

<body>
	<h1>일정 등록</h1>
	<form action="./scheduleinsert.do" method="post">
		<input type="text" name="mozzle_id" value="${mozzle_id}" readonly="readonly">
		<table border="1">
			<!-- <tr>
				<th>Mozzle_id</th>
				<td><input type="text" name="mozzle_id"> </td>
			</tr> -->
			<tr>
				<th>Writer</th>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<th>Shedult_date(일정)</th>
				<td>
					<select name="year">
						<% 
							for(int i=year-10; i<year+10; i++){
								%>
									<!-- 선택되는 년도를 선택되게 한다.
										 보기를 늘리고 싶다면 -10 +10 조정으로 가능 -->
									<option <%=year==i?"selected":""%> value="<%=i%>"><%=i%></option>
								<%
							}
						%>
					</select>년
					<select name="month">
						<% 
							for(int i=1; i<=12; i++){
								%>
									<!-- 선택되는 월을 선택되게 한다. -->
									<option <%=month==i?"selected":""%> value="<%=i%>"><%=i%></option>
								<%
							}
						%>
					</select>월
					<select name="date">
						<% 
							for(int i=1; i<=31; i++){
								%>
									<!-- 선택되는 일을 선택되게 한다. -->
									<option <%=date==i?"selected":""%> value="<%=i%>"><%=i%></option>
								<%
							}
						%>
					</select>일
					<select name="hour">
						<% 
							for(int i=1; i<24; i++){
								%>
									<!-- 현재 시간을 선택되게 한다. -->
									<option <%=hour==i?"selected":""%> value="<%=i%>"><%=i%></option>
								<%
							} 
						%>
					</select>시
					<select name="min">
						<% 
							for(int i=1; i<60; i++){
								%>
									<!-- 현재 분을 선택되게 한다. -->
									<option <%=min==i?"selected":""%> value="<%=i%>"><%=i%></option>
								<%
							} 
						%>
					</select>분
				</td>
			</tr>
			<tr>
				<th>Title</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>Content</th>
				<td><textarea rows="10" cols="60" name="content"></textarea></td>
			</tr>
			<!-- <tr>
				<th>Schedule_date</th>
				<td><input type="datetime-local" name="schedule_date"></td>
			</tr> -->
			<tr>
				<th></th>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="일정추가"/>
					<input type="button" value="돌아가기" onclick="history.back(-1)"/>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>