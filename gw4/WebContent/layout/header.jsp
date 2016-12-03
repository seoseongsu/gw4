<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">  <!-- font-awesome  플러그인 -->
<link rel="stylesheet" href="/gw4/css/style.css">  <!--  전체 스타일시트  -->
<link rel="stylesheet" href="/gw4/css/flexslider.css" type="text/css">  <!-- flex slider 스타일시트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="/gw4/js/jquery.flexslider.js"></script>  <!-- flex slider 제이쿼리 -->
<script>
$(document).ready(function(){
	/*  드롭다운 메뉴 컨트롤  */
	
	$("#slide_nav").hide(); // 드롭다운 메뉴 숨김
	
	$("#header_wrapper").hover(function(){  // 상단메뉴에 hover시 슬라이드 토글
		$("#slide_nav").slideToggle("fast");
	});
	
	var navigation = $('#header_wrapper').offset(); 
	
	/*   스크롤 제어 컨트롤   */
	
	
	$(window).scroll(function() {
		if( $(document).scrollTop() > navigation.top) { // #header_wrapper의 높이값보다 스크롤의 높이값이 클 때
			$('#header_wrapper').addClass('headerFixed'); // #header_wrapper에 .headerFixed의 속성을 추가 
		}
		else { 
			$('#header_wrapper').removeClass('headerFixed'); // #header_wrapper에서 .headerFixed의 속성을 제거
		}
		
		if ( $(this).scrollTop() > 150 ) { // 페이지 스크롤이 150픽셀 이상 내려가면
			$('.top').fadeIn(); // .top 페이드 인 
		} 
		else {
			$('.top').fadeOut(); // 그렇지 않으면 페이드 아웃 
		}	
	});
	
	/*   메인 이미지 슬라이드 컨트롤   */
	
	$('.flexslider').flexslider(); // flexslider 활성화

});
</script>

<!--[if It IE 9]>
	<script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<![endif]-->
</head>
<body>
<div id="wrapper">
	<div id="quick_wrapper">
		<div id="quick_con_wrapper">
			<a href="#">${emp_name}님 반갑습니다</a> <a href="/gw4/main/logout.do">로그아웃</a>
		</div>
	</div>
	
	<div id="header_wrapper">
		<div id="header_con_wrapper">
			<a id="logo" href="../main/main.do">
				<span>EYTime</span>COMPANY
			</a>
			
			<!-- 상단 메뉴 시작 -->			
			<div id="main_nav">
				<ul>
					<li><a href="#">전자결재</a></li>
					<li><a href="#">개인정보</a></li>
					<li><a href="/gw4/emp/empList.do">인사관리</a></li>
					<li><a href="#">커뮤니티</a></li>
					<li><a href="/gw4/board_List.do"">게시판</a></li>
				</ul>
				
				<!-- 드롭다운 메뉴 시작 -->
				<div id="slide_nav">
					<div id="slide_con_nav">
						<div id="slide_left">
							<h4>사이트맵</h4>
						</div>
						<div id="slide_right">
							<ul>
								<a href="#">기안서작성</a>
								<a href="#">올린결재</a>
								<a href="#">받은결재</a>
								<a href="#">양식관리</a>
							</ul>
							<ul>
								<a href="/gw4/my/myView.do"">정보조회</a>
								<a href="/gw4/my/myUpdate.do"">정보수정</a>
								<a href="/gw4/commute/comDay.do">근태현황</a>
								<a href="#">일정관리</a>
								<a href="/gw4/bs/bsList.do">업무관리</a>
								<a href="/gw4/dept/deptList.do">조직도</a>
							</ul>
							<ul>
								<a href="/gw4/emp/empList.do">사원관리</a>
								<a href="/gw4/salary/salaryList.do">급여관리</a>
								<a href="/gw4/fund/fundList.do">회계장부</a>
								<a href="/gw4/commute/comList.do">근태관리</a>
								<a href="/gw4/product_List.do">H/W관리</a>
								<a href="/gw4/productSoft_List.do">S/W관리</a>
							</ul>						
							<ul>
								<a href="#">메일</a>
								<a href="/gw4/chat/chat.do">메신저</a>
							</ul>
							<ul style="border-right:1px solid #ccc;">
								<a href="#">찾아오시는 길</a>
							</ul>						
						</div><!-- End #slide_right -->
					</div><!-- End #slide_con_nav -->
				</div><!-- End #slide_nav -->							
			</div><!-- End #main_nav -->
		</div><!-- End #header_con_wrapper -->
	</div><!-- End #header_wrapper -->
</body>
</html>