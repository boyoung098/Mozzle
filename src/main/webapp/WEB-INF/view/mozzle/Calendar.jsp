<%@page import="com.mozzle.web.dto.schedule.ScheduleDto"%>
<%@page import="com.mozzle.web.dao.schedule.IScheduleDaoImpl" %>
<%@page import="com.mozzle.web.comm.ScheduleUtil"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리</title>
<link rel="stylesheet" type="text/css" href="./resources/css/Calendar.css">
</head>
<script type="text/javascript">
	
</script>
<%
	//달력의 날짜를 바꾸기 위해 전달된 year와 month 파라미터를 받는다.
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	String mozzle_id = request.getParameter("mozzle_id");

	Calendar cal = Calendar.getInstance(); 	// 달력만든다.
	int year = cal.get(Calendar.YEAR); 		//현재 년도를 구한다.
	int month = cal.get(Calendar.MONTH)+1;	//현재 월을 구한다. (0월~11월로 12개가되기때문에 +1해줘야 현재 월이나온다.)
	
	if(paramYear!=null){
		year = Integer.parseInt(paramYear);
	}
	if(paramMonth!=null){
		month = Integer.parseInt(paramMonth);
	}
	
	//월이 증가하다가 12보다 커진다면 13,14,15,16,17...넘어가는 현상을 처리
	if(month>12){
		month=1;	//1월로 변경
		year++;		//년도는 다음해로 넘어가서 년도 +1 증가시킨다.
	}
	if(month<1){
		month=12;
		year--;
	}
	
	//현재 월의 1일에 대한 요일 구하기 : 1~7 >>> 1(일요일), 2(월) ... 7(토)
	//month에 -1을하는 이유는 현재가 6월이라면 7월의 1일에 대한 날짜를 구하기 때문이다.
	cal.set(year, month-1, 1); //현재 월의 1일에 대한 날짜를 구하기 시작한다.
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	//현재 월의 마지막 날 구하기
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	//해당 일의 일정 받기
	List<ScheduleDto> slist = (List<ScheduleDto>)request.getAttribute("slist");
	
%>
<body>
	<form action="./calendar.do" method="get">
		<table border="1" id="calendar">
			<caption>
				<!-- <<는 연도가 깎여야하기때문에 -1 <는 월이 깎여야 하기때문에 -1  -->
				<a href="calendar.do?year=<%=year-1%>&month=<%=month%>&mozzle_id=<%=mozzle_id %>">&laquo;</a>
				<a href="calendar.do?year=<%=year%>&month=<%=month-1%>&mozzle_id=<%=mozzle_id %>">◀</a>
				<%=year %>년<%=month %>월	
				<a href="calendar.do?year=<%=year%>&month=<%=month+1%>&mozzle_id=<%=mozzle_id %>">▶</a>
				<a href="calendar.do?year=<%=year+1%>&month=<%=month%>&mozzle_id=<%=mozzle_id %>">&raquo;</a>
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
				<%	//달력에서 시작하는 공백을 출력
					//공백출력하는for문
					for(int i = 0; i<dayOfWeek-1; i++){
						out.print("<td>&nbsp;</td>");
					}
					//날짜출력하는for문
					for(int i = 1; i<=lastDay; i++){
						%>
						<td>
							<a style="color:<%=ScheduleUtil.fontColor(dayOfWeek, i) %>;" href="scheduleselectAll.do?year=<%=year%>&month=<%=month%>&date=<%=i%>&mozzle_id=<%=mozzle_id %>"><%=i%></a>
							<a href="scheduleinsertForm.do?year=<%=year%>&month=<%=month%>&date=<%=i%>&mozzle_id=${mozzle_id}">
								<img src="<%=request.getContextPath()%>/resources/images/schedule/scheduleadd.png" alt="일정등록" >
							</a>
							<%=ScheduleUtil.scheduleselectViewAll(i, slist) %>
						</td>
						<%
						//행을 바꿔주기--> 현재일(i)이 토요일인지 확인 : (공백수+현재날짜)한 값이7로 나누어 떨어지면 7배수
						if((dayOfWeek-1+i)%7==0){
							out.print("</tr><tr>");
						}
					}
					//나머지 공백 출력하는 for문
					int countNbsp = (7-(dayOfWeek-1+lastDay)%7)%7;
					for(int i=0; i<countNbsp; i++){
						out.print("<td>&nbsp;</td>");
					}
				%>
			</tr>
		</table>
		
	</form>
</body>
</html>