<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>모즐메인페이지</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@ include file="./comm/import.jsp" %>

</head>
<body>
	<nav class="navbar container">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html"><img
					src="./image//logo.png" /></a>
			</div>
			<div class="collapse navbar-collapse select_bar" id="myNavbar">
				<ul class="nav navbar-nav navbar-center">
					<li>
						<form action="#">
							<div class="input-group intput-width search">
								<input type="text" class="form-control search-input"
									placeholder=" 찾으시는 모임이 있나요?" /> <span class="input-group-btn">
									<input type="submit" class="search-btn" />
								</span>
							</div>
						</form>
					</li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">모즐 생성</a></li>
					<li>
						<button onclick="location.href='loginPage.do'">로그인하기</button>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	  <section class="container mt-3" id="new-mozzle2">
            <div class="row content">
                <div class="col-sm-9">
                    <div class="mo-img">
                        <img src="./image/main.png" alt="메인"/>
                        <div class="mo-text">
                              <h4>로아하는 로아인 모여!</h4>  
                              <p>그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하고그림자가 사라지지 않는 것이다 
                                그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되  
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
                        <button>글쓰기</button>
                    </div>
                    <div class="board-container" id="items">
                        <div class="board-top">
                            <select class="board-sel">
                                <option value="최신순">최신 순</option>
                                <option value="인기순">인기 순</option>
                            </select>
                        </div>
                        <div class="borad-box row" id="borad-box">
                            <div class="col-sm-11 board-box-list">
                                <i class="xi-face xi-3x"></i>
                                <span>토마토</span>
                                <span>2021년11월23일</span>
                            </div>
                            <div class="col-sm-1 drop-board-box">
                                <i class="xi-ellipsis-h xi-2x"></i>
                                <ul class="drop-board">
                                    <li><a href="">수정</a></li>
                                    <li><a href="">삭제</a></li>
                                    <li><a href="">주소복사</a></li>
                                    <li><button id="myModal2" class="btn-invite no-padding" data-toggle="modal" data-target="#myModal2">신고</button></li>
                                </ul>
                            </div>
                            <div class="board-text-container">
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                     Autem, deserunt, rerum sequi natus eveniet, impedit ducimus 
                                     molestiae obcaecati quasi quaerat numquam tempore fuga beatae ipsam eligendi repellendus libero sit aliquam.</p>
                            </div>
                            <div class="comment-box">
                                <div class="col-sm-11 board-box-list">
                                    <i class="xi-face xi-3x"></i>
                                    <span>토마토</span>
                                    <span>2021년11월23일</span>
                                </div>
                                <div class="col-sm-1 drop-board-box">
                                    <i class="xi-ellipsis-h xi-2x"></i>
                                    <ul class="drop-board">
                                        <li><a href="">수정</a></li>
                                        <li><a href="">삭제</a></li>
                                        <li><a href="">주소복사</a></li>
                                    </ul>
                                </div>
                                <div class="board-text-container">
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                         Autem, deserunt, rerum sequi natus eveniet, impedit ducimus 
                                         molestiae obcaecati quasi quaerat numquam tempore fuga beatae ipsam eligendi repellendus libero sit aliquam.</p>
                                </div>
                            </div>
                            <div class="board-cion">
                                <div class="comment-icon"><i class="xi-star-o xi-2x"></i></div>
                                <div class="comment-icon comment-write">
                                    <i class="xi-speech-o xi-2x"></i>
                                </div>
                                <div class="comment">
                                    <input type="text" name="comment-id" id="comment-id" class="form-control comment-input"/>
                                    <input type="submit" value="답글" class="comment-btn"/>
                                </div>
                            </div>
                           
                        </div>
                        
                    </div>
                    <p id="sentinel"></p>
                </div> 
                <div class="col-sm-3 sidenav">
                    <div class="input-group input-search" style="width:86%;">
                       <form action="" method="post">
                        <input type="text" class="form-control" placeholder="모즐 게시글 검색">
                        <span class="input-group-btn">
                          <button class="btn btn-default" type="button">
                            <span class="glyphicon glyphicon-search"></span>
                          </button>
                        </span>
                       </form>
                      </div>
                      <div class="new-photo">
                        <h4>최신 사진</h4>
                        <ul>
                            <li><img src="./image/" alt=""></li>
                            <li><img src="./image/" alt=""></li>
                            <li><img src="./image/" alt=""></li>
                            <li><img src="./image/" alt=""></li>
                            <li><img src="./image/" alt=""></li>
                            <li><img src="./image/" alt=""></li>
                            <li><img src="./image/" alt=""></li>
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
                            <li id="invite" value="invite" data-toggle="modal" data-target="#myModal"> 
                                <div class="meeber-thumbnail">
                                    <img src="./image/weast044_01.jpg" alt="하늘">
                                </div>
                                <span>아프리카</span>
                            </li>
                        </ul>
                      </div>
                  </div> 
            </div>
        </section>
        <div id="footer"></div>
</body>
</html>