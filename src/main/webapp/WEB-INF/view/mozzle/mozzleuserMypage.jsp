<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.image{
		width: 200px;
		height: 200px;
		object-fit: cover; 
		border-radius: 100%;
	}
	
	.side-input{
		width:275px;
	}
	.side-btn{
		width: 115px;
	}
	.inline-flex{
		display: inline-flex;
	}

</style>
</head>
<body>

	<div id="content">
        <form:form id="mozzleUserUpdate" action="./mozzleUserUpdate.do?mozzle_id=${mozzle_id}" method="post" enctype="multipart/form-data"
        		>
		<div class="register-container">
		
				<h4>프로필이미지 선택</h4>
				<div class="image-wrap2">
					<c:choose>
									<c:when test="${mozzleUser.image_saved == null}">
										<img src="<%=request.getContextPath()%>/resources/images/default_profile.png" alt="" class="image">
									</c:when>
									<c:otherwise>
									<img src="<%=request.getContextPath()%>/storage/${mozzleUser.image_saved}" alt="" class="image">
									</c:otherwise>
								</c:choose>
				</div>


 			<div class="register-input" id="imagebox">
				<div class="box-file-input" style="margin-top: 5px">
					<label> <input type="file" name="file"
						class="file-input" accept="image/*" id="img" onchange="setThumbnail(event);" style="display: none;">
						<button type="button" id="img-change-btn" class="color-btn side-btn" style="height: 35px;" >이미지 변경</button>
					</label>
				</div>
			</div> 
		
		${mozzleUser.image_saved}<br>
			<br>
			<h4>닉네임 (※4글자이상 20글자이내)</h4>
			<label>
			<span class="inline-flex">
			<input type="text" id="updatenick"
			class="form-control side-input" name="nickname"
			placeholder="닉네임을 입력해주세요" value="${mozzleUser.nickname}" />
			<!-- <button id="upnickcheck" class="color-btn side-btn" style="margin-left: 5px;">중복확인</button> --></span>
			</label>
			<h5 id="resultalert2" style="color: red;"></h5>
			<br>
			
			<div class="register-input" id="public-choice">
				<div id="text-box">
					<h4>생일 공개여부</h4>
					<label class="radio-inline">
				      <input type="radio" class="birthday_show" name="birthday_show" value="Y">예
				    </label>
				    <label class="radio-inline">
				      <input type="radio" class="birthday_show" name="birthday_show" value="N">아니요
				    </label>
				
			</div>
			<div class="register-name">
				<fmt:parseDate var="dateFmt" value="${mozzleUser.joined_date}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${dateFmt}" var="dateval" pattern="yyyy-MM-dd"/>
				<h4>가입일자 : <span id="indate">${dateval}</span></h4>
			</div>
			<br>
			
			<div>
			<span>밴드탈퇴</span> 
			<button class="join-btn" id="mozzleout" style="margin: 5px;">탈퇴하기</button>
			</div>
			
			<div>
			<span>밴드신고</span> 
			<button class="join-btn" id="mozzlepost" style="margin: 5px;">신고하기</button>
			</div>
			
			<div class="register-input"
				style="display: flex; justify-content: center;">
				<!-- <input type="submit" class="btn" id="submit-btn"
					style="width: 200px; background: #e82d55; color: #fff; height: 50px;"
					value="수정" onSubmit="checkSubmit()"> -->
					<button type="button" onclick="updatebefore()"
					style="width: 200px; background: #e82d55; color: #fff;"  class="btn">정보수정</button>
			</div>
			
			
			
			</div>
			</div>
		</form:form>
		
	</div>
	

<script type="text/javascript">
	
	
	/* $(window).onload(function(){
		alert('hi - load');
		}); */

		$(document).ready(function(){
			var birth = "${mozzleUser.birthday_show}";
			console.log(birth);
			$('.birthday_show').each(function(){
				if(birth == $(this).val()){
					$(this).attr('checked','checked');
					
				}
				
			});
			});
		
		$(function () {

			$('#img-change-btn').click(function (e) {
				e.preventDefault();
				$('#img').click();

			});

			});

		function setThumbnail(event){
    		console.log("hi");
    		var reader = new FileReader();
    		reader.onload = function(event){
    			$(".image").attr("src",event.target.result);
    			
    		}
    		reader.readAsDataURL(event.target.files[0]);
    		
    	}
		function updatebefore(){
			var mozzle_id = <%=request.getParameter("mozzle_id")%>;
    		var nick = $("#updatenick").val();
    		console.log(nick.length); //글자수 가져오기
    		$("#resultalert2").empty();
    		
    		var beforenick = "<c:out value='${mozzleUser.nickname}'/>"
    		
    		if($("#updatenick").val()==null || $("#updatenick").val() ==""){
    			//alert('닉네임을 입력해주세요');
    			$("#resultalert2").html('닉네임을 입력해주세요');
    		} else if(nick.length<4 || nick.length>20){
    			//alert('글자수 제한을 어겼습니다');
    			$("#resultalert2").html("글자수 제한을 어겼습니다");
    		}
    		else{
    			$.ajax({
    				url : "./mozzleUpdateBefore.do?mozzle_id="+mozzle_id,
    				type : "get",
    				data : "nickname="+nick,
    				dataType : "JSON",
    				async : true,
    				success : function(msg){
    					console.log(msg.TF);
    			 		if(msg.TF == "false"){
    						if(beforenick == nick){
    							$("#mozzleUserUpdate").submit();
    						} else {
    							$("#resultalert2").html("중복된 닉네임이 있습니다.");
    						}
    					} else{
    						$("#mozzleUserUpdate").submit();
    					}
    				},
    				error : function(){
    					alert("ajax 실행 오류");
    				}
    				
    			}); 
    		}
			
		}

</script>
</body>
</html>