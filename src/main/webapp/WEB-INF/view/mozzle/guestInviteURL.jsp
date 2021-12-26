<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.side-input{
		width:375px;
	}
	.side-btn{
		width: 75px;
		height: 35px;
		margin-left: 10px;
	}
	.inline-flex{
		display: inline-flex;
	}
	
	.incontent{
		padding-left: 30px;
	}
</style>
</head>
<body>

	<div id="content" class="incontent">
		<div>
			<h3>친구에게 링크를 공유하세요</h3>
			<p>
			모임을 즐겁게 모즐에서 함께 하세요!
			링크의 유효기간은 7일입니다.
			</p>
			<span class="inline-flex">
			<input type="text" id="guesturl"
			class="form-control side-input" name="email" value="${guesturl}"  readonly="readonly"  />
			<button id="email-auth" class="color-btn side-btn" onclick="copy_to_clipboard()">복사</button>
			</span>
		</div>
	</div>

<script type="text/javascript">
function copy_to_clipboard(){
	var copyText = document.getElementById("guesturl");
	copyText.select();
	document.execCommand("Copy");
	
}
</script>
