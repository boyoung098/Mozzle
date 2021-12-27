<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
</head>
<body>
<!-- **************************멤버리스트뿌리는곳*************************  -->
				
				<div class="mozzle-member">
					<div class="member-title">
						<div class="member-box">
							<!-- <h4>멤버</h4> -->
							<%-- <span> ${fn:length(mozzleuserList)} </span> --%>
						</div>
						<c:if test="${mozzleUserdto.auth_code == '1' || mozzleUserdto == '2'}">
						</c:if>
						
						
					</div>
					<div class="member-box input-search" style="width: 90%">
						
							<input type="text" class="form-control" placeholder="멤버 검색" id="adminmemberSearchName">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" onclick="adminmemberSearch()" style="margin-left: -6px; padding: 6px 12px 6px 0px;">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						
					</div>
					<% String imgpath = request.getSession().getServletContext().getRealPath("/")+"storage"+"\\"; %>
					<div>
					<ul id="mozzleuserul">
						
						 <%-- <%= imgpath+"998C26415D1B512A08.png"%> --%>
						 
						<c:forEach var="mozzleUser" items="${mozzleuserList}">
						
							<li class="${mozzleUser.nickname}li"  style="margin-bottom: 10px;">
							<div class="meeber-thumbnail" style="cursor: pointer;">
							<%-- <input type="hidden" value="${mozzleUser.nickname}" class="unserinfo">
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
							<input type="hidden" value="${mozzleUser.nickname}" class="unserinfo">
							<input type="hidden" value="${mozzleUser.joined_date}" class="unserinfo">
							<input type="hidden" value="${mozzleUser.image_saved}" class="unserinfo">
							<input type="hidden" value="${mozzleUser.auth_code}" class="unserinfo">
							<fmt:parseDate var="dateFmt" value="${mozzleUser.joined_date}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="dateFmt2" value="${dateFmt}" pattern="yyyy-MM-dd"/>
							</div> <span >${mozzleUser.nickname}</span>
							
							<c:if test="${mozzleUser.auth_code == '2'}">
							<button class='join-btn' type='button' style="font-size: 13px; height: 30px; width: 80px; margin-right: 10px; float: right;" value="${mozzleUser.user_id}" name="adminauthupdate">권한넘기기</button>
							</c:if>
							<c:if test="${mozzleUser.auth_code == '2'}">
							<button class='join-btn' type='button' style="font-size: 13px; height: 30px; width: 60px; float: right;" value="${mozzleUser.user_id}" name="adminout">강퇴</button>
							<%-- <button class='join-btn' type='button' style="font-size: 13px; height: 30px; width: 60px;" value="${mozzleUser.user_id}" name="adminout2">강퇴2</button> --%>
							</c:if>
							<c:if test="${mozzleUser.auth_code == '3'}">
							<button class='join-btn' type='button' style="font-size: 13px; height: 30px; width: 60px; float: right;" value="${mozzleUser.user_id}" name="adminin">복구</button>
							</c:if>
							
						</li>
						
						</c:forEach>
						
					</ul>
				</div>
				</div>
				<%@include file="/WEB-INF/view/mozzle/mozzleUserDetail.jsp" %>
<!-- **************************멤버리스트뿌리는곳*************************  -->
<!-- 김보영 자바스크립트 작성 -->
	<script type="text/javascript">
	
	
	//닉네임ㅁ을 이용하여 찾기
	function adminmemberSearch(){
		var memberSearchval = document.getElementById('adminmemberSearchName').value;
		console.log(memberSearchval);
		var mozzleuserul = document.getElementById('mozzleuserul');
		var mozzle_id = <%=request.getParameter("mozzle_id")%>;
		
		
		$.ajax({
			url:"./adminmozzleUserSearch.do?mozzle_id="+mozzle_id,
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
	

<%-- 	 $("button[name='adminout2']").click(function () {

		 
			 
			 if (confirm("정말 강퇴하시겠습니까?") == true){    //확인
				 var outuserId = $(this).val();
				  console.log(outuserId);
				   window.location.href = "./adminmozzleOut.do?user_id="+outuserId+"&mozzle_id="+<%=request.getParameter("mozzle_id")%>;
			  
				  
				  $.ajax({
						url:"./adminmozzleOut2.do?mozzle_id="+<%=request.getParameter("mozzle_id")%>,
						type: "post",
						data : "outuserId="+ outuserId,
						dataType : "JSON",
						async : true,
						success:function(msg){
							
							$.each(msg,function(key,value){
								var varHtml = "";
					        	 
									if(key =='lists'){
										$.each(value,function(k,v){
										//thead
						varHtml += "				<li class='"+v.nickname+"li'  style='margin-bottom: 10px; border: 1px solid black; font-size: 20px;'>                               ";
						
						varHtml += "	<div class='meeber-thumbnail' style='cursor: pointer;'>                                                                                                 ";
						varHtml += "	                                                                                                                                                        ";
						if(v.image_saved == null){
							varHtml += "<img src='<%=request.getContextPath()%>/resources/images/default_profile.png' alt=''>                                                       ";                                                                      
						} else{
							varHtml += "				<img src='<%=request.getContextPath()%>/resources/images/default_profile.png' alt=''>                                                       ";
						}
						
						varHtml += "	<input type='hidden' value='"+v.nickname+"' class='unserinfo'>                                                                                  ";
						
						varHtml += "	<input type='hidden' value='"+v.joined_date+"' class='unserinfo'>                                                                               "; 
						varHtml += "	<input type='hidden' value='"+v.image_saved+"' class='unserinfo'>                                                                               ";
						varHtml += "	<input type='hidden' value='"+v.auth_code+"' class='unserinfo'>                                                                                 ";
						
						
						
						
						varHtml += "	</div> <span>"+v.nickname+"</span>                                                                                                              ";
						if(v.auth_code=='2'){
							varHtml += "	<button class='join-btn' type='button' style='font-size: 13px; height: 30px; width: 80px; margin-right: 10px;'>권한넘기기</button>                      ";
							varHtml += "	<button class='join-btn' type='button' style='font-size: 13px; height: 30px; width: 60px;' value='"+v.user_id+"' name='adminout'>강퇴</button>  ";
						} else if(v.auth_code == '3') {
							varHtml += "	<button class='join-btn' type='button' style='font-size: 13px; height: 30px; width: 60px;' value='"+v.user_id+"' name='adminin'>복구</button>   ";
						}
						varHtml += " </li>";
						});
						$("#mozzleuserul").html(varHtml);
							}
									});
								
							
						},
						error:function(){
							alert("잘못되었어!!");
						}
						
					});
				  
			  }else{   //취소
			      return;
			  }  
		 
		 
		 
		 
	 }); --%>
	
<%-- 	$(document).ready(function () {
		  $("button[name='adminout2']").click(function () {
			  if (confirm("정말 강퇴하시겠습니까?") == true){    //확인
				 var outuserId = $(this).val();
				  console.log(outuserId);
				   window.location.href = "./adminmozzleOut.do?user_id="+outuserId+"&mozzle_id="+<%=request.getParameter("mozzle_id")%>;
			  
				  
				  $.ajax({
						url:"./adminmozzleOut2.do?mozzle_id="+<%=request.getParameter("mozzle_id")%>,
						type: "post",
						data : "outuserId="+ outuserId,
						dataType : "JSON",
						async : true,
						success:function(msg){
							
							$.each(msg,function(key,value){
					        	 var varHtml = "";
					        	 
									if(key =='lists'){
										$.each(value,function(k,v){
										//thead
						varhtml += "				<li class='"+v.nickname+"li'  style='margin-bottom: 10px; border: 1px solid black; font-size: 20px;'>                               ";
						varhtml += "	<div class='meeber-thumbnail' style='cursor: pointer;'>                                                                                                 ";
						varhtml += "	                                                                                                                                                        ";
						varhtml += "		<c:choose>                                                                                                                                          ";
						varhtml += "			<c:when test='${mozzleUser.image_saved == null}'>                                                                                               ";
						varhtml += "				<img src='<%=request.getContextPath()%>/resources/images/default_profile.png' alt=''>                                                       ";
						varhtml += "			</c:when>                                                                                                                                       ";
						varhtml += "			<c:otherwise>                                                                                                                                   ";
						varhtml += "			<img src='<%=request.getContextPath()%>/storage/${mozzleUser.image_saved}' alt=''>                                                              ";
						varhtml += "			</c:otherwise>                                                                                                                                  ";
						varhtml += "		</c:choose>                                                                                                                                         ";
						varhtml += "	<input type='hidden' value='${mozzleUser.nickname}' class='unserinfo'>                                                                                  ";
						varhtml += "	<input type='hidden' value='${mozzleUser.joined_date}' class='unserinfo'>                                                                               ";
						varhtml += "	<input type='hidden' value='${mozzleUser.image_saved}' class='unserinfo'>                                                                               ";
						varhtml += "	<input type='hidden' value='${mozzleUser.auth_code}' class='unserinfo'>                                                                                 ";
						varhtml += "	<fmt:parseDate var='dateFmt' value='${mozzleUser.joined_date}' pattern='yyyy-MM-dd'/>                                                                   ";
						varhtml += "	<fmt:formatDate var='dateFmt2' value='${dateFmt}' pattern='yyyy-MM-dd'/>                                                                                ";
						varhtml += "	</div> <span>${mozzleUser.nickname}</span>                                                                                                              ";
						varhtml += "	<c:if test='${mozzleUser.auth_code == '2'}'>                                                                                                            ";
						varhtml += "	<button class='join-btn' type='button' style='font-size: 13px; height: 30px; width: 80px; margin-right: 10px;'>권한넘기기</button>                      ";
						varhtml += "	</c:if>                                                                                                                                                 ";
						varhtml += "	<c:if test='${mozzleUser.auth_code == '2'}'>                                                                                                            ";
						varhtml += "	<button class='join-btn' type='button' style='font-size: 13px; height: 30px; width: 60px;' value='${mozzleUser.user_id}' name='adminout'>강퇴</button>  ";
						varhtml += "	</c:if>                                                                                                                                                 ";
						varhtml += "	<c:if test='${mozzleUser.auth_code == '3'}'>                                                                                                            ";
						varhtml += "	<button class='join-btn' type='button' style='font-size: 13px; height: 30px; width: 60px;' value='${mozzleUser.user_id}' name='adminin'>복구</button>   ";
						varhtml += "	</c:if>                                                                                                                                                 ";
						varhtml += "</li>";
										}
											
						$("#mozzleuserul").html(varHtml);	   
									}
									
									
									
					        	 
					         });
							
						},
						error:function(){
							alert("잘못되었어!!");
						}
						
					});
				  
			  }else{   //취소
			      return;
			  }  
			 });
		  
				  
		}); --%>
		$("button[name='adminin']").click(function () {
			  if (confirm("정말 복구하시겠습니까?") == true){    //확인
				  var inuserId = $(this).val();
				  console.log(inuserId);
				  window.location.href = "./adminmozzleIn.do?user_id="+inuserId+"&mozzle_id="+<%=request.getParameter("mozzle_id")%>;
			  }else{   //취소
			      return;
		  }
			 
		  });
		
		$("button[name='adminout']").click(function () {
			 if (confirm("정말 강퇴하시겠습니까?") == true){    //확인
				 var outuserId = $(this).val();
				  console.log(outuserId);
				   window.location.href = "./adminmozzleOut.do?user_id="+outuserId+"&mozzle_id="+<%=request.getParameter("mozzle_id")%>;
			 }else{   //취소
			      return;
			  }
				 
			  });
		
		$("button[name='adminauthupdate']").click(function () {
			 if (confirm("일반회원으로 권한이 변경됩니다. 해당 회원에게 권한을 넘기시겠습니까? ") == true){    //확인
				 var seluserId = $(this).val();
				  console.log(seluserId);
				   window.location.href = "./adminmozzlechangeAuth.do?user_id="+seluserId+"&mozzle_id="+<%=request.getParameter("mozzle_id")%>;
			 }else{   //취소
			      return;
			  }
				 
			  });
		
		
		//특정 회원을 눌렀을때 값을가져와서 모달창이 뜨도록

			
		$(document).ready(function(){
			$(function(){
				
				$("#mozzleuserul li").each((idx, item) => {
					//$(".meeber-thumbnail").each((idx, item) => {
					$(item).children("div").click(function(e){
						e.preventDefault();
						var nickname =($(this).children("input").eq(0).val());
						
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
						} else if(auth_code == 3){
							$('#inauth').append('강퇴');
						}
						
						$('#indate').empty();
						$('#indate').append(date);
						
						
						$('#detailModal').modal();
					});
			    });
				
				
			});
		})


	</script>
</body>
</html>