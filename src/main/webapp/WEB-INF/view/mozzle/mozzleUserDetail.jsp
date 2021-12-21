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
        
        <div class="modal-body">
		<div class="register-container">
		
			<%-- <input type="text" id="save_result" name="result" value="${result}" /> --%>
			<div class="image-wrap2" id="detail-image-div">
					<img class="image" id="image-detail" src="<%=request.getContextPath()%>/resources/images/default_profile.png" />
				</div>
			<div class="register-name">
				<h2 id="innickname"></h2>
				<h4 id="inauth"></h4>
			</div>
			<br>
			<div class="register-name">
				<h5>가입일자 : <span id="indate"></span></h5>
			</div>
			<div id="imgsrc"></div>
			
			
			
			
			
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