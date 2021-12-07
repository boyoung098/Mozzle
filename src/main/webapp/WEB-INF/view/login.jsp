<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<jsp:include page="./comm/import.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="<%=request.getContextPath()%>/js/swiper-bundle.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/script.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/popup/popup.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/xeicon.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resourcescss/xeicon.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/swiper-bundle.min.css" />
<script src="<%=request.getContextPath()%>/resources/js/swiper-bundle.min.js"></script>
</head>
<style>
	#login-form{
		display: flex;
		justify-content: center;
	}
	tr{
		margin: 20px;
	}
</style>
<body>
	<jsp:include page="./comm/header.jsp" />
	<section class="container-login mt-5" id="new-mozzle">
		<h3>로그인</h3>
		<form id="login-form" action="./logingo.do" method="POST">
				<div>
				msg:${msg}
                    <input type="text" class="form-control input-login" name="" placeholder="아이디를 입력 해주세요"/>
                    <input type="text" class="form-control input-login" name="" placeholder="비밀번호를 입력 해주세요"/>
                    <div class="ch-box">
                       <div>
                        <input type="checkbox" id="ch"><label for="ch">아이디 저장</label>
                       </div>
                        <ul>
                            <li><a href="./findInfo">아이디/비밀번호 찾기</a></li>
                        </ul>
                    </div>
                    <input type="submit" class="color-btn input-login" value="로그인"/>
                </div>
				<!-- <input type="submit" onclick="location.href='./singUpgo.do'" value="회원가입" /> -->
		</form>
	</section>

	<jsp:include page="./comm/footer.jsp" />

</body>
</html>















