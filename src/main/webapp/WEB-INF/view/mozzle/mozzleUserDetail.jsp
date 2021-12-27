<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#image-detail{
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
          <h4 class="modal-title" id="usernickname"></h4>
        </div>
        
        <div class="modal-body" style="text-align: center;">
		<div class="register-container" style=" display: inline-block;">
		
			<%-- <input type="text" id="save_result" name="result" value="${result}" /> --%>
			<div class="image-wrap2" id="detail-image-div">
					<img class="image" id="image-detail" src="<%=request.getContextPath()%>/resources/images/default_profile.png" />
				</div>
			<div class="register-name">
			<h5 ><span>닉네임 : </span><span id="innickname"></span></h5>
			<h5 ><span>등급 : </span><span id="inauth"></span></h5>
			
			</div>
			<div class="register-name">
			<h5><span>가입일자 : </span><span id="indate"></span></h5>
			</div>
			<div id="btnUserDetail"></div>
			<!-- <button class="join-btn" type="button" >권한넘기기</button>
			<button class="join-btn" type="button" >강퇴하기</button> -->
			
			
			
			
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