<%@page import="java.util.Calendar"%>
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
	
	//현재시간구하기
	Calendar cal = Calendar.getInstance();
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	int min = cal.get(Calendar.MINUTE);
%>
<script type="text/javascript">
	function backcalendar(){//돌아가기
		location.href="calendar.do?year=<%=year%>&month=<%=month%>&date=<%=date%>";
	}
</script>
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
			<tr>
				<th>Shedult_date(일정)</th>
				<td>
					<select name="year">
						<% 
							for(int i=year-10; i<year+10; i++){
								%>
									<option <%=year==i?"selected":""%> value="<%=i%>"><%=i%></option>
								<%
							}
						%>
					</select>년
					<select name="month">
						<% 
							for(int i=1; i<=12; i++){
								%>
									<option <%=month==i?"selected":""%> value="<%=i%>"><%=i%></option>
								<%
							}
						%>
					</select>월
					<select name="date">
						<% 
							for(int i=1; i<=31; i++){
								%>
									<option <%=date==i?"selected":""%> value="<%=i%>"><%=i%></option>
								<%
							}
						%>
					</select>일
					<select name="hour">
						<% 
							for(int i=1; i<24; i++){
								%>
									<option <%=hour==i?"selected":""%> value="<%=i%>"><%=i%></option>
								<%
							} 
						%>
					</select>시
					<select name="min">
						<% 
							for(int i=1; i<60; i++){
								%>
									<option <%=min==i?"selected":""%> value="<%=i%>"><%=i%></option>
								<%
							} 
						%>
					</select>분
				</td>
			</tr>
			<tr>
				<th>위치</th>

				<td><jsp:include page="./map.jsp"/></td>
				
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
					<input type="button" value="돌아가기" onclick="backcalendar()"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>