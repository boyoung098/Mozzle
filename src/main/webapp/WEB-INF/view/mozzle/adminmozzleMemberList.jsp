<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="../comm/import.jsp"%>
	<style>
	.mozzle-member ul{
		height:auto;
	}
	.mozzle-member{
		height:auto;
	}
	</style>
</head>
<body>
<!-- **************************멤버리스트뿌리는곳*************************  -->
				
				<div class="mozzle-member">
					<div class="member-title">
						<div class="member-box">
							<h4>멤버</h4>
							<span> ${fn:length(mozzleuserList)} </span>
						</div>

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
						 <c:set var="result" value='<%= request.getParameter("delegate") %>'/>
						 <c:set var="mozzle_id" value='<%= request.getParameter("mozzle_id") %>'/>
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
							<c:if test="${result == true}">
								<input type="hidden" name="mozzleUser_id" value="${mozzleUser.user_id}" />
								<div style="margin-left:auto; margin-right:10px;">
								<button class="delegate">리더 위임</button>
								</div>
								<input type="hidden" name="mozzleUser_nick" value="${mozzleUser.nickname}"/>
							</c:if>
							
						</li>
						
						</c:forEach>
						
					</ul>

				</div>
				
				<c:if test="${result == true}">
					
					<div style="text-align: center; margin-top:20px;">
					<c:if test="${fn:length(mozzleuserList) == 0}">
						<button type="button" class="color-btn input-login" id="deleteMozzleBtn">삭제하기</button>
					</c:if>
					<button type="button" class="color-btn input-login" onclick="window.location=document.referrer;">뒤로가기</button>
					</div>
				</c:if>
				<%@include file="/WEB-INF/view/mozzle/mozzleUserDetail.jsp" %>
<!-- **************************멤버리스트뿌리는곳*************************  -->
<!-- 김보영 자바스크립트 작성 -->
	<script type="text/javascript">
	
	//특정 회원을 눌렀을때 값을가져와서 모달창이 뜨도록
	$(function(){
		if("${fn:length(mozzleuserList)}" == 0 && ${result != null}){
			alert("모즐 멤버가 본인 외 없을 경우 삭제하기 버튼을 통해 삭제하실 수 있습니다.");
		}
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
	
	/*
		작성자 : 이종표
		회원 탈퇴시, 리더 권한 위임 delegate
	*/
	
	$(document).on("click", ".delegate", function(e){
		$('#detailModal').modal('hide');
		var nickname = $(this).parent().next().val();
		var id = $(this).parent().prev().val();
		var mozzleId = '<%= request.getParameter("mozzle_id") %>';
		if(id == "${sessionScope.userId}"){
			alert("본인 외에 다른사람을 선택해주세요.");
		}
		else{
			if(confirm(nickname + "님에게 리더 권한을 위임하시겠습니까?")){
				$.ajax({
					url: "/delegateLeader.do",
					type: "post",
					contentType: 'application/json',
					data: JSON.stringify({user_id: id, mozzle_id: mozzleId}),
					success: function(data){
						if(data.delegated){
							alert("권한을 위임하는데 성공하였습니다.");
							history.back();
						}
						else{
							alert("권한을 위임하는데 실패하였습니다.");
						}
					}
				});
			}
		}
	});
	
	$("#deleteMozzleBtn").click(function(){
		console.log("${mozzle_id}");
		if(confirm("모즐을 삭제하시겠습니까?")){
			$.ajax({
				url:"<%=request.getContextPath()%>/user/myPage/deleteMozzle.do",
				type:"post",
				data:{mozzleId: "${mozzle_id}"},
				success: function(result){
					if(result.success){
						alert("모즐이 삭제되었습니다.");
						history.back();
					}
					else{
						alert("모즐을 삭제하는데 실패하였습니다.");
					}
				}
			});
		}
			
	});
	
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
