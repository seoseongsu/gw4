<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/grid.css" type="text/css" media="screen">   
    <script src="js/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script src="js/cufon-yui.js" type="text/javascript"></script>
    <script src="js/cufon-replace.js" type="text/javascript"></script>
    <script src="js/NewsGoth_400.font.js" type="text/javascript"></script>
	<script src="js/NewsGoth_700.font.js" type="text/javascript"></script>
    <script src="js/NewsGoth_Lt_BT_italic_400.font.js" type="text/javascript"></script>
    <script src="js/Vegur_400.font.js" type="text/javascript"></script> 
    <script src="js/FF-cash.js" type="text/javascript"></script>
<style>
	@media screen and (max-width:700px){
	 body{background-color:purple}
	}

	#nav{
		list-style-type:none;
		height:45px;
		padding:6px 7px;
		margin:0;
		background:#7d7d7d;
		border-radius:0em;
	}
	
	#nav li{
		float:left;
		position:relative;
		margin:5px 10px;
		padding:0;
		margin-left:100px;
	}
	
	#nav li a{
		display:block;
		font-family:"굴림";
		font-weight: 600;
		font-size: 1em;
		padding:10px 20px;
		color:#e7e5e5;
		text-decoration:none;
		margin:0;
		border-radius:1.4em;
		text-shadow:0 1px 1px rgba(0, 0, 0, 0.3);
	}
	
	#nav li:hover > a{
		background:#ebebeb;
		color:#444;
		text-shadow:0 1px rgba(255,255,255,1);
		border-radius:1.4em;
		-webkit-box-shadow:0 1px 1px rgba(0,0,0,0.2);
		-moz-box-shadow:0 1px 1px rgba(0,0,0,0.2);
	}
	
	#nav ul{
	  margin:0; 
	  padding:0;
	  list-style:none; 
	  position: absolute; 
	  left: 0; 
	  top:45px;  
	  width: 150px; 
	  background:#ddd; 
	  border:1px solid #b4b4b4; 
	  border-radius:8px; 
	  -webkit-box-shadow:0 1px 3px rgba(0,0,0,.3); 
	  -moz-box-shadow:0 1px 3px rgba(0,0,0,.3);
	  box-shadow:0 1px 3px rgba(0,0,0,.3);
	  opacity: 0; 
	  z-index:9999;
	}
	
	#nav li:hover ul { 
	opacity: 1; 
  	}
  
	
	#nav ul li{
		float:none;
		margin:0;
		padding:0;
	}
	
	#nav ul a{
		font-weight:normal;
		text-shadow:0 1px 0 #fff;
		color:#333;
	}
	
	#nav ul li:hover a{
		background:#0078ff;
		color:#fff;
		text-shadow:0 1px 1px rgba(0,0,0,0.1);
		border-radius:0;
	}
	
	#nav ul li:first-child > a{
	-webkit-border-top-left-radius:8px;   
	-moz-border-radius-topleft:8px;   
	-webkit-border-top-right-radius:8px;
	-moz-border-radius-topright:8px;
	}
	
	#nav ul li:last-child > a{
	-webkit-border-bottom-left-radius:8px;   
  	-moz-border-radius-bottomleft:8px;   
  	-webkit-border-bottom-right-radius:px;
  	-moz-border-radius-bottomright:8px;
	}
	#box {
    position: relative;
    height: auto;
    margin: auto; <!-- 레이아웃을 싸고 있는 box의 margin을 auto로 주면 중앙정렬 효과-->
    background-color: #F90;
	}
	#main2 {
    background-color: white;
    float: left;
    height: 700px;
    width: 90%;
    position: relative;
	}
	#buttons {padding-top:40px; text-align:right; font-size:80px;}
	#buttons a {margin-left:30px}
	
</style>


</head>
<body>
<div class="extra">
    	<!--==============================header=================================-->
        <header>
        	<div class="row-top">
            	<div class="main">
                	<div class="wrapper">
                    	<h1><a href="#"></a></h1>
                        <form id="login" method="post">
                        <fieldset>	
                             <div id="buttons">
                                   <a href="http://localhost:8080/gw4/login.jsp">login</a>   
                             </div>							
                        </fieldset>
                    </form>
                    </div>
                </div>
			</div>
		</header>
		<!--==============================menu=================================-->
	<div>
		<ul id="nav">
			<li><a href='#'>전자결재</a>
				<ul>
					<li><a href="#">기안서작성</a></li>
					<li><a href="#">올린결재</a></li>
					<li><a href="#">받은결재</a></li>
					<li><a href="#">양식관리</a></li>
				</ul></li>

				<li><a href='#'>개인정보</a>
					<ul>
						<li><a href='#'>정보조회</a></li>
						<li><a href='#'>정보수정</a></li>
						<li><a href='#'>근태현황</a></li>
						<li><a href='#'>일정관리</a></li>
						<li><a href='#'>조직도</a></li>
						<li><a href='#'>업무관리</a></li>
					</ul></li>
				<li><a href='#'>인사관리</a>
					<ul>
						<li><a href='#'>사원정보관리</a></li>
						<li><a href='#'>급여관리</a></li>
						<li><a href='#'>회계관리</a></li>
						<li><a href='#'>장비관리</a></li>
						<li><a href='#'>S/W관리</a></li>
						<li><a href='#'>근태관리</a></li>
					</ul></li>
				<li><a href='#'>커뮤니티</a>
					<ul>
						<li><a href='#'>파일관리</a></li>
						<li><a href='#'>메일</a></li>
						<li><a href='#'>쪽지</a></li>
						<li><a href='#'>메신저</a></li>
					</ul></li>
				<li><a href='#'>게시판</a></li>
			</ul>
		</div>
		<!--==============================main=================================-->
		 <section id="content"><div class="ic"></div>
            <div class="content-bg">
                <div class="main">
                    <div class="container_12">
                        <div class="wrapper">
                            <article class="grid_12">
                            	<h3>Our Groupwares</h3>
                                <div class="wrapper p3">
                                	<article class="grid_4 alpha">
                                    	<h4 class="p2">전자결재</h4>
                                        <figure><a href="#"><img class="img-border" src="images/page4-img1.jpg" alt="" /></a></figure>
                                        <div class="box">
                                        	<div class="padding">
                                            	<a href="#">electronic approval</a>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="grid_4">
                                    	<div class="indent-left4">
                                            <h4 class="p2">개인정보</h4>
                                            <figure><a href="#"><img class="img-border" src="images/page4-img2.jpg" alt="" /></a></figure>
                                            <div class="box">
                                                <div class="padding">
                                                    <a href="#">Information</a>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="grid_4 omega">
                                    	<div class="indent-left3">
                                            <h4 class="p2">인사관리</h4>
                                            <figure><a href="#"><img class="img-border" src="images/page4-img3.jpg" alt="" /></a></figure>
                                            <div class="box">
                                                <div class="padding">
                                                    <a href="#">Management</a>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <div class="wrapper">
                                	<article class="grid_4 alpha">
                                    	<h4 class="p2">커뮤니티</h4>
                                        <figure><a href="#"><img class="img-border" src="images/page4-img4.jpg" alt="" /></a></figure>
                                        <div class="box">
                                        	<div class="padding">
                                            	<a href="#">Community</a>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="grid_4">
                                    	<div class="indent-left4">
                                            <h4 class="p2">게시판</h4>
                                            <figure><a href="#"><img class="img-border" src="images/page4-img5.jpg" alt="" /></a></figure>
                                            <div class="box">
                                                <div class="padding">
                                                    <a href="#">NoticeBoard</a>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <article class="grid_4 omega">
                                    	<div class="indent-left3">
                                            <h4 class="p2">사이트맵</h4>
                                            <figure><a href="#"><img class="img-border" src="images/page4-img6.jpg" alt="" /></a></figure>
                                            <div class="box">
                                                <div class="padding">
                                                    <a href="#">site map</a>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
                <div class="block"></div>
            </div>
        </section>
    </div>
	
	<!--==============================footer=================================-->
    <footer>
        <div class="padding">
            <div class="main">
                <div class="container_12">
                    <div class="wrapper">
                        <article class="grid_8">

                            <p class="p1">EYTime.com &copy; 2016 </p>
                            <p class="p1"><a class="link" target="_blank" href="http://www.templatemonster.com/" rel="nofollow">groupware Website </a></p>
                            <p class="p1">Professional groupware website <a href="#" target="_blank"></a>.- groupware for websites. </p>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </footer>	
		
	</body></html>
		