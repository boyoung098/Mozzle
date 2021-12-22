<%@page import="com.mozzle.web.dto.schedule.ScheduleDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<form action="./scheduleinsert.do" method="post">
		<div class="insertmodal">
			<div class="modal_content">
				<ul>
					<li>작성자 : 
						<input type="text" name="writer" value="001"
						readonly="readonly">
					</li>
					<li>제목 : 
						<input type="text" name="title">
					</li>
					<li>내용 : 
						<textarea rows="10" cols="30" name="content"></textarea>
					</li>
					<li>날짜 : <!-- 이부분 종표한테 물어보기 --> 
						<input type="date" name="date">
					</li>
					<li>위치 :
						
					</li>
				</ul>
			</div>
			<div class="modal_footer">
				<input type="submit" value="등록">
			</div>
		</div>
	</form>
</body>
</html>