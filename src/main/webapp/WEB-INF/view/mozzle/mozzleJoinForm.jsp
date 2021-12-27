<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
  <div class="modal fade" id="joinModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">모즐 가입</h4>
        </div>
        
        <div class="modal-body" style="text-align: center;">
        <form:form id="mozzleUserRegist" action="./mozzleUserRegist.do?mozzle_id=${mozzle_id}" method="post" enctype="multipart/form-data">
		<div class="register-container" style="display: inline-block;">
			<h4>프로필이미지 선택</h4>
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
			<h4>닉네임 (※공백없이 4글자이상 20글자이내)</h4>
			<label>
			<span class="inline-flex">
			<input type="text" id="nickjoin"
			class="form-control side-input" name="nickname"
			placeholder="닉네임을 입력해주세요">
			<!-- <button type="button" id="upnickcheck" class="color-btn side-btn" style="margin-left: 5px;">중복확인</button> --></span>
			</label>
			<h5 id="resultalert" style="color: red;"></h5>
			<br>
			
			<div class="register-input" id="public-choice">
				<div id="text-box" style="display: none;">
					<h4>생일 공개여부</h4>
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
				<!-- <input type="button" class="btn" id="submit-btn"
					style="width: 200px; background: #e82d55; color: #fff;"
					value="모즐가입" onSubmit="submitbefore()"> -->
					<button type="button" onclick="joinbefore()"
					style="width: 200px; background: #e82d55; color: #fff;"  class="btn">모즐 가입</button>
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
    	
    	function joinbefore(){
    		var mozzle_id = <%=request.getParameter("mozzle_id")%>;
    		var nick = $("#nickjoin").val();
    		console.log(nick.length); //글자수 가져오기
    		$("#resultalert").empty();
    		var pattern = /\s/g;
    		if($("#nickjoin").val()==null || $("#nickjoin").val() ==""){
    			//alert('닉네임을 입력해주세요');
    			$("#resultalert").html('닉네임을 입력해주세요');
    		}else if($("#nickjoin").val().match(pattern)){
    			$("#resultalert").html('공백없이 입력해주세요');
    			
    		}
    		else if(nick.length<4 || nick.length>20){
    			//alert('글자수 제한을 어겼습니다');
    			$("#resultalert").html("글자수 제한을 어겼습니다");
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
    					if(msg.TF == "false"){
    						$("#resultalert").html("중복된 닉네임이 있습니다.");
    					} else{
    						$("#mozzleUserRegist").submit();
    					}
    				},
    				error : function(){
    					alert("ajax 실행 오류");
    				}
    				
    			}); 
    		}
    		
    	}
    
    </script>
