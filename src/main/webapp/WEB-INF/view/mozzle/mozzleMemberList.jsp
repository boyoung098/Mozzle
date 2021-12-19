<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- **************************멤버리스트뿌리는곳*************************  -->
				
				<div class="mozzle-member">
					<div class="member-title">
						<div class="member-box">
							<h4>멤버</h4>
							<span>123</span>
						</div>
						<button type="button" class="btn-invite" onclick="javascript:location.href='./guestInvite.do?mozzle_id=<%=request.getParameter("mozzle_id")%>'">멤버 초대</button>
					</div>
					<div class="member-box input-search">
						
							<input type="text" class="form-control" placeholder="멤버 검색" id="memberSearchName">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" onclick="memberSearch()">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						
					</div>
					<button onclick="modalopen()">모달창자세히</button>
					<ul id="mozzleuserul">
						<%-- <% String imgpath = request.getSession().getServletContext().getRealPath("/")+"storage"+"\\"; %> --%>
						 
						<c:forEach var="mozzleUser" items="${mozzleuserList}">
						
							<li class="invite"  style="margin-bottom: 10px; border: 1px solid black;">
							<div class="meeber-thumbnail">
							<input type="hidden" value="${mozzleUser.nickname}" class="usernick">
							
								<c:choose>
									<c:when test="${mozzleUser.image_saved == null}">
										<img src="<%=request.getContextPath()%>/resources/images/default_profile.png" alt="">
									</c:when>
									<c:otherwise>
									<img src="<%=request.getContextPath()%>/resources/images/default_profile.png" alt="">
										<%-- <img src="<%=request.getContextPath()%>/storage/065c83f5-4ac8-4817-9a4e-475b224f56ca.jfif" alt=""> --%>
									</c:otherwise>
								</c:choose>
							</div> <span>${mozzleUser.nickname}</span>
						</li>
						</c:forEach>
						
					</ul>
				</div>
				<%@include file="/WEB-INF/view/mozzle/mozzleUserDetail.jsp" %>
<!-- **************************멤버리스트뿌리는곳*************************  -->
<!-- 김보영 자바스크립트 작성 -->
	<script type="text/javascript">
	
	$(function(){
		
		$("#mozzleuserul ul li").each((idx, item) => {
			$(item).click(function(e){
				//console.log($(this).children("input").val());
				console.log('hi');
			});
	    });
		
		
	});    
	    
	function modalopen(){
		$('#detailModal').modal();
	}
	
	
	function memberSearch(){
		var memberSearchval = document.getElementById('memberSearchName').value;
		console.log(memberSearchval);
		var mozzleuserul = document.getElementById('mozzleuserul');
		var mozzle_id = <%=request.getParameter("mozzle_id")%>;
		
		
		$.ajax({
			url:"./mozzleUserSearch.do?mozzle_id="+mozzle_id,
			type: "post",
			data : "nickname="+ memberSearchval,
			dataType : "JSON",
			async : true,
			success:function(jval){
				
				console.log(jval.mozzleuserList.length); //리스트의 size값을 나타냄

				while(mozzleuserul.hasChildNodes()){
					mozzleuserul.removeChild(mozzleuserul.firstChild);
				}
				var elem = "";
				for(var i =0; i<jval.mozzleuserList.length; i++){
						
						elem = elem + "<li>"+jval.mozzleuserList[i].nickname+"</li>"
					}
				mozzleuserul.innerHTML=elem;	
				//console.log(jval.mozzleuserList[0].nickname);
			},
			error:function(){
				alert("잘못되었어!!");
			}
			
		});
	}
	
	function userSessionCheck(){
		var userId = '<%=(String)session.getAttribute("userId")%>';
		console.log(userId);
		if(userId=='null'){
// 			console.log(userId+"ss");
			alert('로그인이 되어있지 않습ㄴ디ㅏ.');
			location.href='./loginPage.do'; //로그인페이지로 이동해야함
		}else{
			 $('#joinModal').modal();
		}
		
	} 
	
	/* function mozzleUserDetail(this){
		//var usernickname = document.getElementById('detail${user_id}').value;
		var usernickname = this.val();
		console.log(usernickname);
		//$('#detailModal').modal();
		
		
	} */
	
	/*  $(".inviteaa이다").click(function(){
		//var value = $(".inviteaa이다").children("input").val();
		var value = $(".detail").val();
		console.log(value);
        //console.log($(this).val());
        
        
    });  */

    
    
    
	</script>
</body>
</html>