<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- **************************멤버리스트뿌리는곳*************************  -->
				
				<div class="mozzle-member">
					<div class="member-title">
						<div class="member-box">
							<h4>멤버</h4>
							<span> ${fn:length(mozzleuserList)} </span>
						</div>
						<c:if test="${mozzleUserdto.auth_code == '1' || mozzleUserdto == '2'}">
						</c:if>
						
						
						</div>
					<div class="member-box input-search">
						
							<input type="text" class="form-control" placeholder="멤버 검색" id="memberSearchName">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" onclick="memberSearch()" style="margin-left: -6px; padding: 6px 12px 6px 0px;">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						
					</div>
					<div>
					<ul id="mozzleuserul">
						<% String imgpath = request.getSession().getServletContext().getRealPath("/")+"storage"+"\\"; %>
						 <%-- <%= imgpath+"998C26415D1B512A08.png"%> --%>
						 
						<c:forEach var="mozzleUser" items="${mozzleuserList}">

							<%-- li class="${mozzleUser.nickname}li"  style="margin-bottom: 10px; border: 1px solid black;"> --%>
							<li class="${mozzleUser.nickname}li" >
							<div class="meeber-thumbnail">
							
							<div class="meeber-thumbnail" style="cursor: pointer;">
							<%-- <input type="hidden" value="${mozzleUser.nickname}" class="unserinfo">
							<input type="hidden" value="${mozzleUser.nickname}" class="unserinfo">
							<input type="hidden" value="${mozzleUser.joined_date}" class="unserinfo">
							<input type="hidden" value="${mozzleUser.image_saved}" class="unserinfo">
							<input type="hidden" value="${mozzleUser.auth_code}" class="unserinfo">
							<fmt:parseDate var="dateFmt" value="${mozzleUser.joined_date}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="dateFmt2" value="${dateFmt}" pattern="yyyy-MM-dd"/> --%>
							
								<c:choose>
									<c:when test="${mozzleUser.image_saved == null}">
										<img src="<%=request.getContextPath()%>/resources/images/default_profile.png" alt="">
									</c:when>
									<c:otherwise>
									<img src="<%=request.getContextPath()%>/storage/${mozzleUser.image_saved}" alt="">
									</c:otherwise>
								</c:choose>

							</div> <span>${mozzleUser.nickname}</span>	
							<c:set var="result" value='<%= request.getParameter("delegate") %>'/>
							<%-- <c:if test="${result == true}"> --%>
								<input type="hidden" name="mozzleUser_id" value="${mozzleUser.user_id}" />
								<div style="margin-left:auto; margin-right:10px;">
								<button class="delegate">리더 위임</button>
								</div>
								<input type="hidden" name="mozzleUser_nick" value="${mozzleUser.nickname}"/>

							<input type="hidden" value="${mozzleUser.nickname}" class="unserinfo">
							<input type="hidden" value="${mozzleUser.joined_date}" class="unserinfo">
							<input type="hidden" value="${mozzleUser.image_saved}" class="unserinfo">
							<input type="hidden" value="${mozzleUser.auth_code}" class="unserinfo">
							<fmt:parseDate var="dateFmt" value="${mozzleUser.joined_date}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="dateFmt2" value="${dateFmt}" pattern="yyyy-MM-dd"/>
							</div> <span>${mozzleUser.nickname}</span>
							<c:if test="${mozzleUser.auth_code == '2'}">
							<button class='join-btn' type='button' style="font-size: 13px; height: 30px; width: 80px; margin-right: 10px;">권한넘기기</button>
							</c:if>
							<c:if test="${mozzleUser.auth_code == '2'}">
							<button class='join-btn' type='button' style="font-size: 13px; height: 30px; width: 60px;">강퇴</button>
							</c:if>
							<c:if test="${mozzleUser.auth_code == '3'}">
							<button class='join-btn' type='button' style="font-size: 13px; height: 30px; width: 60px;">복구</button>
							</c:if>
							
						</li>
						
						</c:forEach>
						
					</ul>

				</div>

				<c:if test="${result == true}">
					<c:set var="mozzle_id" value='<%= request.getParameter("mozzle_id") %>'/>
					<div style="text-align: center; margin-top:20px;">
					<c:if test="${fn:length(mozzleuserList) == 1}">
						<button class="color-btn input-login">삭제하기</button>
					</c:if>
					<button class="color-btn input-login" onclick="window.location=document.referrer;">뒤로가기</button>
					</div>
				</c:if>

				</div>

				<%@include file="/WEB-INF/view/mozzle/mozzleUserDetail.jsp" %>

<script type="text/javascript">	
	//특정 회원을 눌렀을때 값을가져와서 모달창이 뜨도록
	$(function(){
		if("${fn:length(mozzleuserList)}" == 1 && ${result != null}){
			alert("모즐 멤버가 1명인 경우 삭제하기 버튼을 통해 삭제하실 수 있습니다.");
		}
		$("#mozzleuserul li").each((idx, item) => {
			//$(".meeber-thumbnail").each((idx, item) => {
			$(item).children("div").click(function(e){
				e.preventDefault();
				var nickname =($(this).children("input").eq(0).val());
				//var date = ($(this).children("div").children("input").eq(1).val());
				var image_saved =($(this).children("input").eq(2).val());
				//$("#imgsrc").append(image_saved);
				
				if(image_saved != ""){
					$("#image-detail").attr("src","<%=request.getContextPath()%>/storage/"+image_saved);
				} else{
					$("#image-detail").attr("src","<%=request.getContextPath()%>/resources/images/default_profile.png");
				}
				var auth_code = ($(this).children("input").eq(3).val());
				var date= '<c:out value="${dateFmt2}"/>'
				$('#innickname').empty();
				$('#innickname').append(nickname);
				
				$('#inauth').empty();
				if(auth_code == 1){
					$('#inauth').append('운영자');
				} else if(auth_code == 2){
					$('#inauth').append('일반 회원');
					var html = "";
					html += "<button class='join-btn' type='button' style='margin-right:10px;'>권한넘기기</button>"
					html+= "<button class='join-btn' type='button' >강퇴하기</button>";
					$("#btnUserDetail").html(html);
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
					url: "./delegateLeader.do",
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
	})
	
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
