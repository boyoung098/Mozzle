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

<%@ include file="./comm/import.jsp" %>
<script type="text/javascript" 	src="<%=request.getContextPath()%>/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.js"></script>


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
				<div class="txt mt-3"></div>

				<div class="board-container" id="items">
					<!-- 내용 들어 가는 곳 -->
					
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
	
	<div id="footer"></div>
	 <!-- Modal 멤버 -->
        
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog user-impo user-profil">
            
              <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <section id="pup=invite" class="container pop-bg">
                        <div class="user-profile">
                            <div><i class="xi-profile xi-3x"></i></div>
                            <div class="user-profile-text">
                                <h4>사용자이름</h4>
                                <p>일반회원</p>
                                <p>가입일 : 2021-12-03</p>
                                <button type="button" class="btn-pop">프로필 수정</button>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="modal-footer">
                </div>
              </div>
              
            </div>
        </div>
</body>
</html>