<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.mozzle.web.dto.schedule.ScheduleDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정목록</title>
</head>
<%
	List<ScheduleDto> list = (List<ScheduleDto>)request.getAttribute("list");
%>
<body>
<h1>일정목록</h1>
<table border="1">
	<col width="50px">
	<col width="50px">
	<col width="300px">
	<col width="250px">
	<col width="250px">
	<tr>
		<th><input type="checkbox" name="all" onclick="allChk(this.checked)"/></th>
		<th>번호</th>
		<th>제목</th>
		<th>일정</th>
		<th>작성일</th>
	</tr>
	<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='5'>---작성된 일정이 없습니다.---</td></tr>");
		}else{
			for(ScheduleDto dto:list){
				%>
				<tr>
					<td><input type="checkbox" name="schedule_id" value="<%=dto.getMozzle_id()%>"/></td>
					<td><%=dto.getMozzle_id()%></td>
					<td><%=dto.getWriter()%></td>
					<td><%=dto.getTitle()%></td>
					<td><%=dto.getContent()%></td>
					<td><%=dto.getSchedule_date()%></td>
					<td><%=dto.getRegdate()%></td>
					<td><%=dto.getLocation_code()%></td>
				</tr>
				<%
			}
		}
	%>
	<tr>
		<td colspan="5">
			<a href="calendar.do">달력보기</a>
		</td>
	</tr>
</table>
</body>
</html>