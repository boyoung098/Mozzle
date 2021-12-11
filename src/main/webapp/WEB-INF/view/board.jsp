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
<jsp:include page="./comm/import.jsp" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>


</head>
<body>
<!-- <script type="text/javascript" 	src="./smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script> -->
	<jsp:include page="./comm/header.jsp">
		<jsp:param value="${userId}" name="userId" />
	</jsp:include>
	<section class="container mt-3" id="new-mozzle2">
		<div class="row content">
			<div class="col-sm-9">
				<div class="mo-img">
					<img src="<%=request.getContextPath()%>/resources/images/main.png"
						alt="메인" />
					<div class="mo-text">
						<h4>로아하는 로아인 모여!</h4>
						<p>그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지
							못하고그림자가 사라지지 않는 것이다 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되
						</p>
						<div class="mo-member">
							<ul>
								<li>리더 : 로아로아</li>
								<li>멤버 : 101</li>
							</ul>
							<button class="join-btn">가입요청</button>
						</div>
					</div>
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
						<select class="board-sel">
							<option value="new1">최신 순</option>
							<option value="new2">인기 순</option>
						</select>
					</div>
					<c:forEach var="boardobj" items="${requestScope.boardlist}">
						<div class="borad-box row" id="borad-box">
							<div class="col-sm-11 board-box-list">
								<div class="meeber-thumbnail">
									<img src="./resources/images/weast044_01.jpg" alt="하늘">
								</div><span>${boardobj.user_id}</span> <span>${boardobj.regdate}</span>
							</div>
							<div class="col-sm-1 drop-board-box">
								<i class="xi-ellipsis-h xi-2x"></i>
								<ul class="drop-board">
									<li><button class="btn-invite" onclick="board_update()">수정</button></li>
									<li><button class="btn-invite" onclick="board_delete()">삭제</button></li>
									<li><button class="btn-invite" >주소복사</button></li>
									<li><button id="myModal2" class="btn-invite no-padding"
											data-toggle="modal" data-target="#myModal2">신고</button></li>
								</ul>
							</div>
							<div class="board-text-container">
								<p>${boardobj.content}</p>
							</div>
							<!-- 댓글 -->
								<div id="reply-comment">
									
								</div>
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
										<input type="text" name="comment-id" id="comment-id" class="form-control comment-input" name="content"/> 
										<input type="button" value="댓글" class="comment-btn" id="comment-btn" onclick="fn_comment(${boardobj.post_id})"/>
									</form>
								</div>
							</div>

						</div>
					</c:forEach>
				</div>


			</div>
			<div class="col-sm-3 sidenav">
				<div class="input-group input-search" style="width: 86%;">
					<form action="" method="post">
						<input type="text" class="form-control" name="keyword" id="keyword" placeholder="모즐 게시글 검색" >
						<span class="input-group-btn">
							<button class="btn btn-default" type="button" onclick="return searchboard()">
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
				<div class="mozzle-member">
					<div class="member-title">
						<div class="member-box">
							<h4>멤버</h4>
							<span>123</span>
						</div>
						<button type="button" class="btn-invite">멤버 초대</button>
					</div>
					<div class="member-box input-search">
						<form action="" method="">
							<input type="text" class="form-control" placeholder="멤버 검색">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</form>
					</div>
					<ul>
						<li id="invite" value="invite" data-toggle="modal"
							data-target="#myModal">
							<div class="meeber-thumbnail">
								<img src="./resources/images/weast044_01.jpg" alt="하늘">
							</div> <span>아프리카</span>
						</li>
					</ul>
				</div>

			</div>
		</div>

	</section> 
	<form id="frm" action="/insert.jsp" method="post">
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
				<td>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</td>
			</tr>
		</table>
	</form> 
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	</div>


	<jsp:include page="./comm/footer.jsp" />
	<script type="text/javascript">
		/* var oEditors = [];
		$(function() {
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "ir1",
				//SmartEditor2Skin.html 파일이 존재하는 경로 
				sSkinURI : "/smarteditor2/SmartEditor2Skin.html",
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseToolbar : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseVerticalResizer : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseModeChanger : true,
					fOnBeforeUnload : function() {
					}
				},
				fOnAppLoad : function() {
					//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용 
					oEditors.getById["ir1"].exec("PASTE_HTML",
							[ "기존 DB에 저장된 내용을 에디터에 적용할 문구" ]);
				},
				fCreator : "createSEditor2"
			});
		});
		 */
		function fn_comment(post_id){
			$.ajax({
				url:"/reinboard.do",
				type:"POST",
				data:$("#reply").serialize(),
				success: function(data){
					if(data=="success")
		            {
		                commentList();
		                $("#comment-id").val("");
		            }
				}
			})
		}
		 $(function(){
		    commentList();
		});	
		function commentList(){
			$.ajax({
				url:"/reviewboard.do",
				type:"GET",
				dataType:"json",
				data:$("#reply").serialize(),
				success: function(data){
					var html = "";
					var cnt = data.length;
					
					if(data.length > 0){
						for(let i=0; i<data.length; i++){
							html += "<div style='border:4px solid lime;'>";
							html += "<p>"+data[i].usesr_id+"</p>";
							html += "</div>";
						}
					}
					
					$("#reply-comment").html(cnt);
					$("#reply").html(html);
				}
			})
		}
		
	</script>

</body>
</html>