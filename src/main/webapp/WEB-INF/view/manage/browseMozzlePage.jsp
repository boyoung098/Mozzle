<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>메인페이지</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<jsp:include page="../comm/import.jsp" />

<style>
.card {
	width: 90%;
	height: 80px;
}

.image-wrap1 {
	text-align: center;
	display: table;
	border: 1px dotted #cecece;
	width: 100%;
	height: 100% px;
	border-radius: 5px;
}

.image-wrap2 {
	display: table-cell;
	vertical-align: middle;
}

#image {
	max-width: 100%;
	max-height: 100%;
}
</style>
</head>
<body>
	<jsp:include page="../comm/header.jsp">
		<jsp:param value="${userId}" name="userId" />
	</jsp:include>
	<section id="main-bg" class="container mt-3">
		<div class="container-fluid">
			<div class="row content">
				<div class="col-sm-9 sidenav">
					<h5>
						<small>모즐검색결과</small>
					</h5>
					<hr>
					<ul class="nav nav-pills nav-stacked">
						<c:forEach var="mozzle" items="mLists">
						<li>
							<div class="container-fluid">
								<div class="row">
									<div class="col-sm-2">
										<img class="card"
											src="<%=request.getContextPath()%>/resources/upload/basic.png"
											alt="img" />
									</div>
									<div class="col-sm-9">
										<ul>
											<li>${mozzle.mozzle_name}</li>
											<li>${mozzle.mozzle_intro}</li>
										</ul>	
									</div>
								</div>
							</div>
						</li>
						</c:forEach>
					</ul>
					<br>
				</div>

				<div class="col-sm-3">

					<h2>I Love Food</h2>
					<h5>
						<span class="glyphicon glyphicon-time"></span> Post by Jane Dane,
						Sep 27, 2015.
					</h5>
					<h5>
						<span class="label label-danger">Food</span> <span
							class="label label-primary">Ipsum</span>
					</h5>
					<br>
					<p>Food is my passion. Lorem ipsum dolor sit amet, consectetur
						adipiscing elit, sed do eiusmod tempor incididunt ut labore et
						dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
						exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. Excepteur sint occaecat cupidatat non proident, sunt in
						culpa qui officia deserunt mollit anim id est laborum consectetur
						adipiscing elit, sed do eiusmod tempor incididunt ut labore et
						dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
						exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat.</p>
					<br> <br>

					<h4>
						<small>RECENT POSTS</small>
					</h4>
					<hr>
					<h2>Officially Blogging</h2>
					<h5>
						<span class="glyphicon glyphicon-time"></span> Post by John Doe,
						Sep 24, 2015.
					</h5>
					<h5>
						<span class="label label-success">Lorem</span>
					</h5>
					<br>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
						enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat
						cupidatat non proident, sunt in culpa qui officia deserunt mollit
						anim id est laborum consectetur adipiscing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
						minim veniam, quis nostrud exercitation ullamco laboris nisi ut
						aliquip ex ea commodo consequat.</p>
					<hr>

					<h4>Leave a Comment:</h4>
					<form role="form">
						<div class="form-group">
							<textarea class="form-control" rows="3" required></textarea>
						</div>
						<button type="submit" class="btn btn-success">Submit</button>
					</form>
					<br> <br>

					<p>
						<span class="badge">2</span> Comments:
					</p>
					<br>

					<div class="row">
						<div class="col-sm-2 text-center">
							<img src="bandmember.jpg" class="img-circle" height="65"
								width="65" alt="Avatar">
						</div>
						<div class="col-sm-10">
							<h4>
								Anja <small>Sep 29, 2015, 9:12 PM</small>
							</h4>
							<p>Keep up the GREAT work! I am cheering for you!! Lorem
								ipsum dolor sit amet, consectetur adipiscing elit, sed do
								eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
							<br>
						</div>
						<div class="col-sm-2 text-center">
							<img src="bird.jpg" class="img-circle" height="65" width="65"
								alt="Avatar">
						</div>
						<div class="col-sm-10">
							<h4>
								John Row <small>Sep 25, 2015, 8:25 PM</small>
							</h4>
							<p>I am so happy for you man! Finally. I am looking forward
								to read about your trendy life. Lorem ipsum dolor sit amet,
								consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
								labore et dolore magna aliqua.</p>
							<br>
							<p>
								<span class="badge">1</span> Comment:
							</p>
							<br>
							<div class="row">
								<div class="col-sm-2 text-center">
									<img src="bird.jpg" class="img-circle" height="65" width="65"
										alt="Avatar">
								</div>
								<div class="col-xs-10">
									<h4>
										Nested Bro <small>Sep 25, 2015, 8:28 PM</small>
									</h4>
									<p>Me too! WOW!</p>
									<br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../comm/footer.jsp" />


	<div>
		<h1>임의로 만든 이동페이지</h1>
		<a href="./guestInvite.do">김보영-게스트URI뿌리는 곳으로 이동</a>
	</div>
</body>
</html>