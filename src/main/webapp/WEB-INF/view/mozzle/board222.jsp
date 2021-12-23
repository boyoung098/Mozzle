<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>모즐메인</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@ include file="../comm/import.jsp" %>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	
	<div id="header"></div>
	<section class="container mt-3" id="new-mozzle2">
		<div class="row content">
			<div class="col-sm-9">
				<div class="mo-img">
					<img src="<%=request.getContextPath()%>/resources/images/main.png"
						alt="메인" />
					<div class="mo-text">
						<h4>로아하는 로아인 모여22222!</h4>
						<p>그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지
							못하고그림자가 사라지지 않는 것이다 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되
							<%= request.getSession().getServletContext().getRealPath("/") %>
						</p>
						<div class="mo-member">
							<ul>
								<li>리더 : 로아로아</li>
								<li>멤버 : 101</li>
							</ul>
							<button class="join-btn" onclick="userSessionCheck()" id="joinbtn">가입요청</button>
						</div>
					</div>
					
					
					<!--  -->
					  <!-- Modal -->
					<jsp:include page="./mozzleJoinForm.jsp"/>
					
  
					
					
					
					
					<div class="mo-list">
						<ul>
							<li>게시글</li>
							<li>사진첩</li>
							<li>일정</li>
							<!-- <li>정보</li> -->
						</ul>
					</div>
				</div>
				<div class="txt mt-3">
					<button data-toggle="modal" data-target="#myModal">글쓰기</button>
				</div>

				<div class="board-container" id="items">
					<div class="board-top">
						<select class="board-sel selectbox">
							<option value="new1">최신 순222</option>
							<option value="new2">인기 순</option>
						</select>
					</div>
					<c:forEach var="boardobj" items="${requestScope.searchboardlist}">
					<section id="board-card-list">
						<div class="borad-box row" id="borad-box">
							<div class="col-sm-11 board-box-list">
								<div class="meeber-thumbnail">
									<img src="./resources/images/weast044_01.jpg" alt="하늘">
								</div>
								<span>${boardobj.user_id}</span> <span>${boardobj.regdate}</span>
							</div>
							<div class="col-sm-1 drop-board-box">
								<i class="xi-ellipsis-h xi-2x"></i>
								<ul class="drop-board">
									<li><button class="btn-invite" onclick="board_update()">수정</button></li>
									<li><button class="btn-invite" onclick="board_delete()">삭제</button></li>
									<li><button class="btn-invite">주소복사</button></li>
									<li><button id="myModal2" class="btn-invite no-padding"
											data-toggle="modal" data-target="#myModal2">신고</button></li>
								</ul>
							</div>
							<div class="board-text-container">
								<p>${boardobj.content}</p>
							</div>
							<!-- 댓글 -->
							<div id="reply-comment"></div>
							<!-- 댓글 -->

							<div class="board-cion">
								<div class="comment-icon">
									<i class="xi-star-o xi-2x"></i>
								</div>
								<div class="comment-icon comment-write">
									<i class="xi-speech-o xi-2x"></i>
								</div>
								<div class="comment">
									<form action="./reinboard.do" method="post" id="reply">
										<input type="text" name="comment-id" id="comment-id"
											class="form-control comment-input" name="content" /> <input
											type="button" value="댓글" class="comment-btn" id="comment-btn"
											onclick="fn_comment(${boardobj.post_id})" />
									</form>
								</div>
							</div>

						</div>
						</section>
					</c:forEach>
				</div>


			</div>
			<div class="col-sm-3 sidenav">
				<div class="input-group input-search" style="width: 86%;">
					<form action="" method="post">
						<input type="text" class="form-control" name="keyword"
							id="keyword" placeholder="모즐 게시글 검색"> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button"
								onclick="searchboard()">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</form>
				</div>
				<div class="new-photo">
					<h4>최신 사진</h4>
					<ul>
						<!-- <li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li>
						<li><img src="./image/" alt=""></li> -->
					</ul>
				</div>
				
				<!-- **************************멤버리스트뿌리는곳*************************  -->
				
				<div class="mozzle-member">
					<div class="member-title">
						<div class="member-box">
							<h4>멤버</h4>
							<span>123</span>
						</div>
						<button type="button" class="btn-invite">멤버 초대</button>
					</div>
					<div class="member-box input-search">
						
							<input type="text" class="form-control" placeholder="멤버 검색" id="memberSearchName">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" onclick="memberSearch()">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						
					</div>
					<ul id="mozzleuserul">
						<%-- <% String imgpath = request.getSession().getServletContext().getRealPath("/")+"storage"+"\\"; %> --%>
						 
						<c:forEach var="mozzleUser" items="${mozzleuserList}">
						<li id="invite" value="invite" data-toggle="modal"
							data-target="#myModal" style="margin-bottom: 10px;">
							<div class="meeber-thumbnail">
								<c:choose>
									<c:when test="${mozzleUser.image_saved == null}">
										<img src="<%=request.getContextPath()%>/resources/images/default_profile.png" alt="">
									</c:when>
									<c:otherwise>
										<img src="<%=request.getContextPath()%>/storage/065c83f5-4ac8-4817-9a4e-475b224f56ca.jfif" alt="">
									</c:otherwise>
								</c:choose>
							</div> <span>${mozzleUser.nickname}</span>
						</li>
						</c:forEach>
					</ul>
				</div>
<!-- **************************멤버리스트뿌리는곳*************************  -->
				<%-- <%=imgpath%>${mozzleUser.image_saved}.jfif --%>
			</div>
		</div>

	</section>
 	<form >
		<table width="100%">
			<tr>
				<td>제목</td>
				<td><input type="text" id="title" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="30" id="ir1" name="contents"
						style="width: 766px; height: 412px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" id="save" value="저장" /> <input
					type="button" value="취소" /></td>
			</tr>
			<tr>
				<td><input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /></td>
			</tr>
		</table>
	</form>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<form action="./insertBoard.do" method="post" id="insertcontent">
				Modal content
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Modal Header</h4>
					</div>
					<div class="modal-body">
						
						<div class="form-group">
							<label>내용</label>
							<textarea rows="5" class="form-control" id="content"
								name="content"></textarea>
						</div>
						<div class="form-group">        
					      <div class="col-sm-offset-2 col-sm-10">
					        <button type="button" class="btn btn-primary btn-block" onclick="board_insert()">새글입력</button>
					      </div>
					    </div>
					</div>
				</div>
			</form>
		</div>
	</div> 
<!-- 모달창 끝!!!!!!!11 -->


	<div id="footer"></div>

	
	<!-- 김보영 자바스크립트 작성 -->
	<script type="text/javascript">
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
			location.href='../loginPage.do'; //로그인페이지로 이동해야함
		}else{
			 $('#joinModal').modal();
		}
		
	}
	
	
	</script>
</body>
</html>