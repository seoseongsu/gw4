<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main</title>
<link rel="stylesheet" type="text/css" href="/gw4/css/flexslider.css">
<link rel="stylesheet" type="text/css" href="/gw4/css/style.css">
<script type="text/javascript" src="/gw4/js/jquery.flexslider.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div id="main_wrapper">
		<!-- 메인 슬라이드 시작 -->
		<div class="flexslider">
			<ul class="slides">
				<li style="background:url('/gw4/images/slide01.jpg') 50% 100% no-repeat;"></li>
				<li style="background:url('/gw4/images/slide02.jpg') 50% 100% no-repeat"></li>
			</ul>
		</div>
	</div><!-- End #main_wrapper --> 
		
	<div id="bottom_wrapper">
		<div id="bottom_con_wrapper">
			<section style="background:url(/gw4/images/section01.jpg) 100% 98% no-repeat;">
				<h4>ABOUT <span>COMPANY</span></h4>
				<p>앞서가는 기술력과 노하우로<br>세계로 뻗어나가는<br>저희 회사를 소개합니다.</p>
				<a href="#">자세히보기</a>
			</section>
			
			<section style="background:url(/gw4/images/section02.jpg) 100% 98% no-repeat;">
				<h4>PRODUCTS <span>INFO</span></h4>
				<p>최고의 품질을 보증하는<br>저희 제품을 소개합니다.</p>
				<a href="#">자세히보기</a>
			</section>

			<section style="background:url(/gw4/images/section03.jpg) 100% 98% no-repeat;">
				<h4>CONTACT <span>INFO</span></h4>
				<p>전화 : 02) 000-0000<br>팩스 : 02) 000-0000<br>E-MAIL : KH@information.com</p>
				<a href="#">찾아오시는길</a>
			</section>
		</div><!-- End #bottom_con_wrapper -->
	</div><!-- End #bottom_wrapper -->

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>