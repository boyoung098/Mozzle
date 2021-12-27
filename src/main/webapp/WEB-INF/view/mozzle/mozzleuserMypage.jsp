<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		.box-file-input label{
  display:inline-block;
  background:#aaa;
  color:#fff;
  padding:0px 15px;
  line-height:35px;
  cursor:pointer;
  border-radius: 5px;
}

.box-file-input label:after{
  content:"파일찾기";
}

.box-file-input .file-input{
  display:none;
}

.box-file-input .filename{
  display:inline-block;
  padding-left:10px;
}

</style>
</head>
<body>

	<div id="content" style="text-align: center;">
        <form:form id="mozzleUserUpdate" action="./mozzleUpdate.do" method="post" enctype="multipart/form-data"
        		>
		<div class="register-container"  style="display: inline-block;">
		
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
						class="file-input" accept="image/*" id="img" onchange="setThumbnail(event);">
					</label>
				</div>
			</div> 
		
			<br>
			<h4>닉네임 (※공백없이 4글자이상 20글자이내)</h4>
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
				<div id="text-box" style="display: none;">
					<h4>생일 공개여부</h4>
					<label class="radio-inline">
				      <input type="radio" class="birthday_show" name="birthday_show" value="Y">예
				    </label>
				    <label class="radio-inline">
				      <input type="radio" class="birthday_show" name="birthday_show" value="N">아니요
				    </label>
				
			</div>
			<%-- <div class="register-name">
				<fmt:parseDate var="dateFmt" value="${mozzleUser.joined_date}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${dateFmt}" var="dateval" pattern="yyyy-MM-dd"/>
				<h4>가입일자 : <span id="indate">${dateval}</span></h4>
			</div> --%>
			<br>
			<div>
			</div>
			
			<!-- <div>
			<span>밴드신고</span> 
			<button class="join-btn" id="mozzlepost" style="margin: 5px;">신고하기</button>
			</div> -->
			
			<div class="register-input"
				style="display: flex; justify-content: center;">
				<!-- <input type="submit" class="btn" id="submit-btn"
					style="width: 200px; background: #e82d55; color: #fff; height: 50px;"
					value="수정" onSubmit="checkSubmit()"> -->
					<button type="button" onclick="update()"
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
		
		
		
	
		
		function update(){
			var mozzle_id = <%=request.getParameter("mozzle_id")%>;
    		var nick = $("#updatenick").val();
    		var checkbirth = $("input[name=birthday_show]:checked").val();
    		console.log(nick.length); //글자수 가져오기
    		$("#resultalert2").empty();
    		var form = $("#mozzleUserUpdate")[0];
    		var beforenick = "<c:out value='${mozzleUser.nickname}'/>"
    		var formData = new FormData(form);
    		console.log(form);
    		
    		var pattern = /\s/g;
    		
    		
    		if($("#updatenick").val()==null || $("#updatenick").val() ==""){
    			//alert('닉네임을 입력해주세요');
    			$("#resultalert2").html('닉네임을 입력해주세요');
    		}else if($("#updatenick").val().match(pattern)){
    			$("#resultalert2").html('공백없이 입력해주세요');
    		}
    		else if(nick.length<4 || nick.length>20){
    			//alert('글자수 제한을 어겼습니다');
    			$("#resultalert2").html("글자수 제한을 어겼습니다");
    		}
    		else{
    			
    			
    			
    			$.ajax({
    				url : "./mozzleJoinBefore.do?mozzle_id="+mozzle_id,
    				type : "get",
    				data : "nickname="+nick,
    				dataType : "JSON",
    				async : true,
    				success : function(msg){
    					console.log(msg.TF);
    					console.log(nick + beforenick);
    					if(nick == beforenick){
    						console.log('둘은 같다');
    						msg.TF== "true";
    						 $.ajax({
 			     				url : "./mozzleUpdate.do?mozzle_id="+mozzle_id,
 			     				type : "post",
 			     				data : formData,
 			     				dataType : "JSON",
 			     				async : true,
 			     				success : function(mapChangedUser){
 			     					swal("수정이 완료되었습니다.");
 			     			 		
 			     					/* 수정완료후 받아올 값을 JSON으로 받기? */
 			     					var updateauth = mapChangedUser.userdtoInfo.auth_code;
 			     					var updateimage_saved = mapChangedUser.userdtoInfo.image_saved;
 			     					var updatenickname = mapChangedUser.userdtoInfo.nickname;
 			     					
 			     					
 			     					if(updateauth =='1'){
 			     						if(updateimage_saved != ""){
 			    							$(".leaderinfoimg").attr("src","<%=request.getContextPath()%>/storage/"+updateimage_saved);
 			    						} else{
 			    							$(".leaderinfoimg").attr("src","<%=request.getContextPath()%>/resources/images/default_profile.png");
 			    						}
 			     						
 			     						$("#leadernickname").empty();
 			     						$('#leadernickname').append("닉네임 : "+updatenickname);
 			     					} else if(updateauth =='2'){
 			     						if(updateimage_saved != ""){
 			    							$(".memberinfoimg").attr("src","<%=request.getContextPath()%>/storage/"+updateimage_saved);
 			    						} else{
 			    							$(".memberinfoimg").attr("src","<%=request.getContextPath()%>/resources/images/default_profile.png");
 			    						}
 			     						$("#membernickname").empty();
 			     						$('#membernickname').append("닉네임 : "+updatenickname);
 			     					}
 			     					
 			     					
 			     				},
 			     				error : function(){
 			     					alert("ajax 실행 오류");
 			     				},
 			     				/* cache: false, */
 			     				contentType: false, 
 			     				processData: false
 			     				
 			     			});
    					}else if(msg.TF == "false"){
    						$("#resultalert2").html("중복된 닉네임이 있습니다.");
    					} else{


    						 $.ajax({
    			     				url : "./mozzleUpdate.do?mozzle_id="+mozzle_id,
    			     				type : "post",
    			     				data : formData,
    			     				dataType : "JSON",
    			     				async : true,
    			     				success : function(mapChangedUser){
    			     					swal("수정이 완료되었습니다.");
    			     			 		
    			     					/* 수정완료후 받아올 값을 JSON으로 받기? */
    			     					var updateauth = mapChangedUser.userdtoInfo.auth_code;
    			     					var updateimage_saved = mapChangedUser.userdtoInfo.image_saved;
    			     					var updatenickname = mapChangedUser.userdtoInfo.nickname;
    			     					
    			     					
    			     					if(updateauth =='1'){
    			     						if(updateimage_saved != ""){
    			    							$(".leaderinfoimg").attr("src","<%=request.getContextPath()%>/storage/"+updateimage_saved);
    			    						} else{
    			    							$(".leaderinfoimg").attr("src","<%=request.getContextPath()%>/resources/images/default_profile.png");
    			    						}
    			     						
    			     						$("#leadernickname").empty();
    			     						$('#leadernickname').append("닉네임 : "+updatenickname);
    			     					} else if(updateauth =='2'){
    			     						if(updateimage_saved != ""){
    			    							$(".memberinfoimg").attr("src","<%=request.getContextPath()%>/storage/"+updateimage_saved);
    			    						} else{
    			    							$(".memberinfoimg").attr("src","<%=request.getContextPath()%>/resources/images/default_profile.png");
    			    						}
    			     						$("#membernickname").empty();
    			     						$('#membernickname').append("닉네임 : "+updatenickname);
    			     					}
    			     					
    			     					
    			     				},
    			     				error : function(){
    			     					alert("ajax 실행 오류");
    			     				},
    			     				/* cache: false, */
    			     				contentType: false, 
    			     				processData: false
    			     				
    			     			});
    						
    						
    						
    						
    					}
    				},
    				error : function(){
    					alert("ajax 실행 오류");
    				}
    				
    			}); 
    			
    			
    			
    			
    			
    			
    			
    		}
			
		}

</script>
