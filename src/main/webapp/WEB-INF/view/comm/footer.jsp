<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<style>
/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.footer-bs {
	background-color: #3c3d41;
	padding: 60px 40px;
	color: rgba(255, 255, 255, 1);
	margin-bottom: 20px;
	border-bottom-right-radius: 6px;
	border-top-left-radius: 0px;
	border-bottom-left-radius: 6px;
}

.footer-bs .footer-brand, .footer-bs .footer-nav, .footer-bs .footer-social,
	.footer-bs .footer-ns {
	padding: 10px 25px;
}

.footer-bs .footer-nav, .footer-bs .footer-social, .footer-bs .footer-ns
	{
	border-color: transparent;
}

.footer-bs .footer-brand h2 {
	margin: 0px 0px 10px;
}

.footer-bs .footer-brand p {
	font-size: 12px;
	color: rgba(255, 255, 255, 0.7);
}

.footer-bs .footer-nav ul.pages {
	list-style: none;
	padding: 0px;
}

.footer-bs .footer-nav ul.pages li {
	padding: 5px 0px;
}

.footer-bs .footer-nav ul.pages a {
	color: rgba(255, 255, 255, 1);
	font-weight: bold;
	text-transform: uppercase;
}

.footer-bs .footer-nav ul.pages a:hover {
	color: rgba(255, 255, 255, 0.8);
	text-decoration: none;
}

.footer-bs .footer-nav h4 {
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 3px;
	margin-bottom: 10px;
}

.footer-bs .footer-nav ul.list {
	list-style: none;
	padding: 0px;
}

.footer-bs .footer-nav ul.list li {
	padding: 5px 0px;
}

.footer-bs .footer-nav ul.list a {
	color: rgba(255, 255, 255, 0.8);
}

.footer-bs .footer-nav ul.list a:hover {
	color: rgba(255, 255, 255, 0.6);
	text-decoration: none;
}

.footer-bs .footer-social ul {
	list-style: none;
	padding: 0px;
}

.footer-bs .footer-social h4 {
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 3px;
}

.footer-bs .footer-social li {
	padding: 5px 4px;
}

.footer-bs .footer-social a {
	color: rgba(255, 255, 255, 1);
}

.footer-bs .footer-social a:hover {
	color: rgba(255, 255, 255, 0.8);
	text-decoration: none;
}

.footer-bs .footer-ns h4 {
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 3px;
	margin-bottom: 10px;
}

.footer-bs .footer-ns p {
	font-size: 12px;
	color: rgba(255, 255, 255, 0.7);
}

#footer-ul li {
	display: inline-block;
}

@media ( min-width : 768px) {
	.footer-bs .footer-nav, .footer-bs .footer-social, .footer-bs .footer-ns
		{
		border-left: solid 1px rgba(255, 255, 255, 0.1);
	}
}
</style>

<footer class="footer-bs">
	<div class="row">
		<div class="col-md-3 footer-brand animated fadeInLeft">
			<img src="<%=request.getContextPath() %>/resources/images/logo/f_logo.png" />
		</div>
		<div class="col-md-6 footer-nav animated fadeInUp">
			<div>
				<p>이용약관 | 개인정보처리방침</p>
				<p>(주)모즐 | 08505 서울시 금천구 가산디지털2로 115, 509호(가산동, 대륭테크노타운3차) | 대표
					: 모즐</p>
				<p>| 사업자등록번호 : 123-12-12345 | help@mozzle.com</p>
			</div>
		</div>
		<div class="col-md-3 footer-social animated fadeInDown">
			<ul id="footer-ul">
				<li><img src="<%=request.getContextPath() %>/resources/images/sns/face.png" alt="" /></li>
				<li><img src="<%=request.getContextPath() %>/resources/images/sns/tw.png" alt="" /></li>
				<li><img src="<%=request.getContextPath() %>/resources/images/sns/in.png" alt="" /></li>
				<li><img src="<%=request.getContextPath() %>/resources/images/sns/ut.png" alt="" /></li>
			</ul>
		</div>
	</div>
</footer>
</html>
