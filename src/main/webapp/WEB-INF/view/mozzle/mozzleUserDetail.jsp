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

</style>
</head>
<body>
  <div class="modal fade" id="detailModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">${mozzleUser.nickname}</h4>
        </div>
        
        <div class="modal-body">
		<div class="register-container">
		
			<%-- <input type="text" id="save_result" name="result" value="${result}" /> --%>
			<div class="image-wrap2">
					<img class="image" id="image" src="<%=request.getContextPath()%>/resources/images/default_profile.png" />
				</div>
			<div class="register-name">
				<h2 id="innickname">닉네임</h2>
				<h4>일반회원</h4>
			</div>
			<br>
			<div class="register-name">
				<h5>가입일자 : 2018/10/10</h5>
			</div>
			
			<!-- 본인일경우만 session값가져와서-->
			<div class="register-name">
				<h4><a>프로필수정</a></h4>
			</div>
			
			
			
			
			</div>
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
    
    </script>
</body>
</html>