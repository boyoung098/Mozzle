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
				
				<div class="mozzle-member" style="height: 340px;">
					<div class="member-title">
						<div class="member-box">
							<h4>멤버</h4>
							<span> ${fn:length(mozzleuserList)} </span>
						</div>
						<c:if test="${mozzleUserdto.auth_code == '1' || mozzleUserdto == '2'}">
						</c:if>
						<button type="button" id="btninvite" class="btn-invite" <%-- onclick="javascript:location.href='./guestInvite.do?mozzle_id=<%=request.getParameter("mozzle_id")%>'" --%>>멤버 초대</button>
						
					</div>
					<div class="member-box input-search" style="width: 90%">
						
							<input type="text" class="form-control" placeholder="멤버 검색" id="memberSearchName">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" onclick="memberSearch()" style="margin-left: -6px; padding: 6px 12px 6px 0px;">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						
					</div>
					<ul id="mozzleuserul">
						<% String imgpath = request.getSession().getServletContext().getRealPath("/")+"storage"+"\\"; %>
						 <%-- <%= imgpath+"998C26415D1B512A08.png"%> --%>
						 
						<c:forEach var="mozzleUser" items="${mozzleuserList}">
						
							<li class="${mozzleUser.nickname}li"  style="margin-bottom: 10px; border: 1px solid black;">
							<div class="meeber-thumbnail">
							<input type="hidden" value="${mozzleUser.nickname}" class="unserinfo">
							<input type="hidden" value="${mozzleUser.joined_date}" class="unserinfo">
							<input type="hidden" value="${mozzleUser.image_saved}" class="unserinfo">
							<input type="hidden" value="${mozzleUser.auth_code}" class="unserinfo">
							<fmt:parseDate var="dateFmt" value="${mozzleUser.joined_date}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="dateFmt2" value="${dateFmt}" pattern="yyyy-MM-dd"/>
							
								<c:choose>
									<c:when test="${mozzleUser.image_saved == null}">
										<img src="<%=request.getContextPath()%>/resources/images/default_profile.png" alt="">
									</c:when>
									<c:otherwise>
									<img src="<%=request.getContextPath()%>/storage/${mozzleUser.image_saved}" alt="">
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
	
	//특정 회원을 눌렀을때 값을가져와서 모달창이 뜨도록
	$(function(){
		
		$("#mozzleuserul li").each((idx, item) => {
			$(item).click(function(e){
				e.preventDefault();
				var nickname =($(this).children("div").children("input").eq(0).val());
				//var date = ($(this).children("div").children("input").eq(1).val());
				var image_saved =($(this).children("div").children("input").eq(2).val());
				//$("#imgsrc").append(image_saved);
				
				if(image_saved != ""){
					$("#image-detail").attr("src","<%=request.getContextPath()%>/storage/"+image_saved);
				} else{
					$("#image-detail").attr("src","<%=request.getContextPath()%>/resources/images/default_profile.png");
				}
				var auth_code = ($(this).children("div").children("input").eq(3).val());
				var date= '<c:out value="${dateFmt2}"/>'
				$('#innickname').empty();
				$('#innickname').append(nickname);
				
				$('#inauth').empty();
				if(auth_code == 1){
					$('#inauth').append('운영자');
				} else if(auth_code == 2){
					$('#inauth').append('일반 회원');
				}
				
				$('#indate').empty();
				$('#indate').append(date);
				
				
				$('#detailModal').modal();
			});
	    });
		
		
	});    
	    
	
	
	
	//닉네임ㅁ을 이용하여 찾기
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

				/* while(mozzleuserul.hasChildNodes()){
					mozzleuserul.removeChild(mozzleuserul.firstChild);
				} */
				
				$('#mozzleuserul li').css("display","none");
				
				for(var i =0; i<jval.mozzleuserList.length; i++){
						
						
						var classname = "."+jval.mozzleuserList[i].nickname+'li';
						console.log(classname);
						$(classname).css("display","flex");
						
					}
			},
			error:function(){
				alert("잘못되었어!!");
			}
			
		});
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