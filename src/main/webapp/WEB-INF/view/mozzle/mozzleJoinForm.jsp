<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#image{
		width: 200px;
		height: 200px;
		object-fit: cover; 
		border-radius: 100%;
	}
	
	.side-input{
		width:275px;
	}
	.side-btn{
		width: 75px;
	}
	.inline-flex{
		display: inline-flex;
	}

</style>
</head>
<body>
  <div class="modal fade" id="joinModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">모즐 가입</h4>
        </div>
        
        <div class="modal-body">
        <form:form id="mozzleUserRegist" action="./mozzleUserRegist.do?mozzle_id=${mozzle_id}" method="post" enctype="multipart/form-data"
        		modelAttribute="mozzleUserDto">
		<div class="register-container">
		
				<h5>프로필이미지 선택</h5>
				<div class="image-wrap2">
					<img class="image" id="image" src="<%=request.getContextPath()%>/resources/images/default_profile.png" />
				</div>


 			<div class="register-input" id="imagebox">
				<div class="box-file-input" style="margin-top: 5px">
					<label> <input type="file" name="file"
						class="file-input" accept="image/*" id="img" onchange="setThumbnail(event);">
					</label> <!-- <span class="filename"></span> -->
				</div>
			</div> 

			<br>
			<h5>닉네임</h5>
			<label>
			<span class="inline-flex">
			<input type="text"
			class="form-control side-input" name="nickname"
			placeholder="닉네임을 입력해주세요">
			<button type="button" id="upnickcheck" class="color-btn side-btn" style="margin-left: 5px;">중복확인</button></span>
			</label>
			
			<div class="register-input" id="public-choice">
				<div id="text-box">
					<h5>생일 공개여부</h5>
					<label class="radio-inline">
				      <input type="radio" name="birthday_show" checked value="Y">예
				    </label>
				    <label class="radio-inline">
				      <input type="radio" name="birthday_show" value="N">아니요
				    </label>
				
			</div>
			
			<br>
			<div class="register-input"
				style="display: flex; justify-content: center;">
				<input type="submit" class="btn" id="submit-btn"
					style="width: 200px; background: #e82d55; color: #fff;"
					value="모즐등록" onSubmit="checkSubmit()">
			</div>
			
			</div>
			</div>
		</form:form>
	</div> 



        </div>
        <!-- <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
      
    </div>
    
    <script type="text/javascript">
    	function setThumbnail(event){
    		console.log("hi");
    		var reader = new FileReader();
    		reader.onload = function(event){
    			$("#image").attr("src",event.target.result);
    			
    		}
    		reader.readAsDataURL(event.target.files[0]);
    		
    	}
    
    	function checkjoinnick(){
    		console.log
    	}
    </script>
</body>
</html>