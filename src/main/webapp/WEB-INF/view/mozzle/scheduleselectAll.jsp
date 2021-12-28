<%@page import="com.mozzle.web.comm.ScheduleUtil"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.mozzle.web.dto.schedule.ScheduleDto"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정목록</title>
<%
   List<ScheduleDto> list = (List<ScheduleDto>)request.getAttribute("list");
%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
   // core, BOM, DOM 3가지 영역으로 나눔
   function allSel(val){
      //val > input > Element tagName
         alert(val.tagName);
         alert(val);
      var chks = document.getElemenetsByName("schedule_id");
      for(var i=0; i<chks.length; i++){
         chks[i].checked = val;
      }
   }
   
   $(function()){//window.onload = function(){} //page가 로딩되는 작업을 이벤트로 인식
      //form 태그에서 submit이벤트가 발생하면 함수 실행
      $("form").submit(function()){
         var bool = true;
         var count = $(this).find("input[name=schedule_id]:checked").length;
         if(count == 0){
            alert("최소 하나 이상 체크해주세요!");
            bool = false;
         }else if(confirm("정말 삭제하실 건가요?")){
            bool = true;
         }else{
            bool = false;
         }
         return bool;
      });
      
      //체크박스 처리 : 전체선택 체크박스 체크/헤제를 자동으로 하는 기능
      var chks = document.getElementsByName("schedule_id");
      for(var i=0; i<chks.length; i++){
         chks[i].onclick = function(){ //체크박스에서 클릭이벤트가 발생하면 함수 실행
            var checkedObjs = document.querySelectorAll("input[name=schedule_id]:checked")
            if(checkedObjs.length==chks.length){
               document.getElementsByName("all")[0].checked=true; //체크해준다.
            }else{
               document.getElementsByName("all")[0].checked=false; //체크해준다.
            }
         }
      }
   })
</script>
</head>
<body>
<h1>일정목록</h1>
<form action="./scheduledelete.do" method="post">
<input type="hidden" name="year" value="${param.year}">
<input type="hidden" name="month" value="${param.month}">
<input type="hidden" name="date" value="${param.date}">
<table border="1">
   <col width="50px">
   <col width="50px">
   <col width="300px">
   <col width="250px">
   <col width="250px">
   <tr>
      <th><input type="checkbox" name="all" onclick="allSel(this.checked)"/></th>
      <th>mozzle_id</th>
      <th>작성자</th>
      <th>제목</th>
      <th>내용</th>
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
               <td><input type="checkbox" name="schedule_id" value="<%=dto.getSchedule_id()%>"/></td>
               <td><%=dto.getMozzle_id()%></td>
               <td><%=dto.getWriter()%></td>
               <td><a href="scheduleselectOne.do?schedule_id="> <%=dto.getTitle() %></a></td>
               <td><%=dto.getContent()%></td>
               <td><%=dto.getSchedule_date() %></td>
               <td><%=dto.getRegdate() %></td>
               <%-- <td><%=ScheduleUtil.toDates(dto.getSchedule_date()) %></td>
               <td><fmt:formatDate pattern="yyyy-MM-dd" value="<%=dto.getRegdate()%>"/> </td> --%>
            </tr>
            <%
         }
      }
   %>
   <tr>
      <td colspan="5">
         <input type="submit" value="삭제"/>
         <button type="button"onclick="history.back(-1)">달력보기</button>
      </td>
   </tr>
</table>
</form>
</body>
</html>