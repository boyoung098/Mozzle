<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<h3>친구에게 링크를 공유하세요</h3>
			<p>
			모임을 즐겁게 모즐에서 함께 하세요!
			링크의 유효기간은 7일입니다.
			</p>
			<input type="text" id="guesturl" name="guesturl" value="${guesturl}" size="120" readonly="readonly">
			<button onclick="copy_to_clipboard()">복사</button>
		</div>
	</div>
	
	<a href="./guestEnter.do?uuid=5deef64e-599a-11ec-80d2-4b1c063fa815">게스트로 이동</a>

<script type="text/javascript">
function copy_to_clipboard(){
	var copyText = document.getElementById("guesturl");
	copyText.select();
	document.execCommand("Copy");
	
}
</script>
</body>
</html>