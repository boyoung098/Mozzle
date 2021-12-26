<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<%@ include file="../../comm/import.jsp" %>
<style>


.login-result{
	color:#e82d55;
}
.input-login {
	height: 40px;
	width: 350px;
	margin-bottom: 10px;
}

.color-btn {
	background: #e82d55;
	color: #fff;
	font-size: 15px;
	border-radius: 4px;
	border: none;
}

.ch-box {
	display: flex;
	justify-content: space-between;
	align-items: baseline;
}

.ch-box2 {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.ch-box label {
	font-size: 13px;
	vertical-align: middle;
	padding-left: 10px;
}

.ch-box ul {
	display: flex;
	font-size: 13px;
}
</style>

<script type="text/javascript">
	var cnt;
	$(function(){
		$("#removeCancel").click(function(){
			self.close();
		});
		$.ajax({
			url:"./myPage/leaderCheck.do",
			type:"post",
			data:{userId: "${sessionScope.userId}"},
			success: function(result){
				cnt = result.length;
				//var mozzleList = JSON.parse(JSON.stringify(window.opener.mozzleList));

				$(result).each(function(){
					var $tr = $("<tr></tr>")
					var $td = $("<td></td>");
					var $a = $("<a>").attr("href", "<%=request.getContextPath()%>/delegateMemberList.do?mozzle_id=" + this.MOZZLE_ID + "&delegate=true")
						.text(this.MOZZLE_NAME);
					$tr.append($td.append($a));
					$("#leaderList tbody").append($tr);
				});

			}
		});
		$("#removeUser").click(function(){
			if(cnt != undefined){
				if(cnt != 0){
					alert("리더 권한들을 위임해야 탈퇴가 가능합니다.");
				}
				else{
					if(confirm("정말 탈퇴하시겠습니까?")){
						$.ajax({
							url:"./delflagUser.do",
							type:"get",
							data:{userId: "${sessionScope.userId}"},
							success: function(result){
								if(result.delflag){
									alert("회원 탈퇴가 완료되었습니다. 그동안 Mozzle을 이용해주셔서 감사합니다.");
									window.opener.location.href="<%=request.getContextPath()%>/logout.do";
									self.close();
								}
								else{
									alert("회원 탈퇴에 실패했습니다.");
								}
							}
						});
					}
				}
			}
		});
		
		
	});
</script>
</head>

<body>
	<div id="header"></div>
	<section class="content container-login mt-5">
		<div id="login-form">

				<h2>회원 탈퇴</h2>
				<p>아래의 모즐들의 리더 권한을 위임해주세요</p>
				<div>
					<table id="leaderList" class="table table-bordered">
						<thead>
						<tr>
							<th>Mozzle 명</th>
						</tr>
						</thead>
						<tbody>
						
						</tbody>
					</table>
					<input type="button" id="removeUser" class="color-btn input-login" value="탈퇴하기" />
					<input type="button" id="removeCancel" class="color-btn input-login" value="닫기" />
				</div>

		</div>
	</section>

	<div id="footer"></div>

</body>
</html>















