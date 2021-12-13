<%@page import="com.mozzle.web.comm.ScheduleUtil"%>
<%@page import="com.mozzle.web.dao.schedule.IScheduleDaoImpl"%>
<%@page import="com.mozzle.web.dao.schedule.IScheduleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>
<style type="text/css">
	.calendar{
		border: 1px solid gray;
		border-collapse: collapse;
	}
	.calendar th{
		width: 80px;
		border: 1px solid gray;
	}
	.calendar td{
		width: 100px;
		height: 100px;
		border: 1px solid gray;
		text-align: left;
		vertical-align: top;
		position: relative;
	}
	
</style>
</head>
<body>
	<form action="/scheduleselectAll" method="get">
		
	</form>
	<!-- JS를 밑에 두면 안먹힌다. -->
	<!-- 36분39초 -->
	<h1>캘린더</h1>
	<%
		// 현재 날짜의 연도와 월을 가져온다.
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		
		// 값을 전송받는 것이 필요
		String paramYear = request.getParameter("year");
		String paramMonth = request.getParameter("month");
		
		// 페이지에서 요청된 연도와 월의 값을 저장한다.
		if(paramYear != null){
			year = Integer.parseInt(paramYear);
		}
		
		if(paramMonth != null){
			month = Integer.parseInt(paramMonth);
		}
		
		// 요청받은 연도와 월의 일자로 Calendar 클래스 세팅
		cal.set(year, month-1, 1);
		
		// 매월 1일의 요일
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		
		// 월의 최대 일수
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		//캘린더의 일정 표현
		//IScheduleDao dao = new IScheduleDaoImpl();
		
		//yyyymm
		//String yyyymm = year + ScheduleUtil.isTwo(String.valueOf(month)); 
	%>
	<table class="calendar">
		<caption>
			<a>◁</a>
			<a>◀</a>
				<span class="y"><%=year%></span>년
				<span class="m"><%=month%></span>월
			<a>▶</a>
			<a>▷</a>
		</caption>
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<tr>
			<%
				//공백
				for(int i=0; i<dayOfWeek-1;i++){
					out.print("<td>&nbsp;</td>");
				}
			
				//달력 일수
				for(int i=1; i<=lastDay;i++){
					%>
					<td>
						<%=i%>
					</td>
					<%
					if((dayOfWeek-1+i)%7==0){
						out.print("</tr><tr>");
					}
				}
				
				for(int i=0; i< (7-(dayOfWeek-1+lastDay)%7)%7;i++){
					out.print("<td>&nbsp;</td>");
				}
			%>
		</tr>
	</table>
	
</body>
</html>