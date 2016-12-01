<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]--> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>사원목록</title>
<script>
function deleteEvent(a){
	if(confirm("정말 삭제하시겠습니까??")==true){
		location.href="empDeletePro.do?emp_code="+a
	}else{
		return;
	}
}
</script>
<link rel="stylesheet" href="/gw4/css/reset.css" type="text/css" media="screen">
    <link rel="stylesheet" href="/gw4/css/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="/gw4/css/grid.css" type="text/css" media="screen">  
    <script src="js/jquery-1.6.3.min.js" type="text/javascript"></script>
    <script src="js/cufon-yui.js" type="text/javascript"></script>
    <script src="js/cufon-replace.js" type="text/javascript"></script>
    <script src="js/NewsGoth_400.font.js" type="text/javascript"></script>
	<script src="js/NewsGoth_700.font.js" type="text/javascript"></script>
    <script src="js/NewsGoth_Lt_BT_italic_400.font.js" type="text/javascript"></script>
    <script src="js/Vegur_400.font.js" type="text/javascript"></script> 
    <script src="js/FF-cash.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-1.11.3.min.js" ></script>
<style>
	@media screen and (max-width:700px){
	 body{background-color:purple}
	}

	#nav{
		list-style-type:none;
		height:45px;
		padding:6px 385px;
		margin:0 auto;
		background:#7d7d7d;
		border-radius:0em;
		text-align:center
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
	  margin:0 auto; 
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
		margin:0 auto;
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
	#mainLoginForm{
	padding-top: 17px;
	}
	
	
	/*성수야, 아까 말한게~ line 266번째에 테이블 class지정하고, tr이랑 td에 해당하는 CSS를 지정해주면 가능하다는 건뎅
	이렇게 해서 맘에 들런지 모르겠당~ 힘내~ */
	#border_table{
	border: 1px solid;
	margin: auto;
	}
	
	#border_table tr, #border_table td, #border_table th{
	border: 1px solid;
	text-align:center;
	padding: 1px;
	/*여기에 padding:3px주면, 표가 보기좋게 넓어지는데, 줄바꿈이 되는 것 같아~ */
	}

</style>
</head>

<body>
<div class="extra">
    	<!--==============================header=================================-->
        <header>
        	<div class="row-top">
            	<div class="main">
                	<div class="wrapper">
                    	<h1><a href="http://localhost:8080/gw4/main/main.do"></a></h1>
                        <c:if test="${sessionScope.memId != null}">
                        <div id="mainLoginForm">
                        <form name="inform" method="post" action="/gw4/main/logout.do" >
                        <table width=250 cellpadding="0" cellspacing="0"  align="right" border="1">
	                        <tr>
	                        	<td bgcolor="171717" width="125px" align="center">
	                        	<img src="/gw4/images/employee.jpg" width="75px"></td>
	                        	<td width="100" bgcolor="171717" align="center" >
	                        	<font size="5" color="white">사원코드</font>
	                        	<br />
	                        	<br />
	                        	<font size="5" color="white">${sessionScope.memId}</font>
	                        	</td>
	                        </tr>
	                        <tr>
	                        	<td colspan="2" bgcolor="171717" align="center" style="width=20px; height=10px">
	                        	<a href="/gw4/main/logout.do" class="myButton">로그아웃</a></td>
	                        </tr>
                        </table>
						</form>
						</div>
               			</c:if>
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
						<li><a href='#'>메일</a></li>
						<li><a href='#'>쪽지</a></li>
						<li><a href='#'>메신저</a></li>
					</ul></li>
				<li><a href='#'>게시판</a></li>
			</ul>
		</div>
		<!--==============================main=================================-->
		<section id="content">
			<div class="content-bg">
				<div class="main">
					 <div class="container_12">
					 	<div class="wrapper">
					 		 	<h3>사원정보관리</h3>
	<c:if test="${count == 0 }">
	<table align="center">
		<tr>
			<td>
				등록된 사원 정보가 없습니다.
			</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${count > 0 }">
		<table id="border_table">
			<tr style="border:none;">
				<td colspan="14" style="text-align:right; border:none;"><button type="button" onclick="location.href='empInsert.do'">사원등록</button></td>
			</tr>
			<tr style="background-color:#B7B7B7;">
				<th>사원번호</th>
				<th>성명</th>
				<th>부서(조직)</th>
				<th>직급</th>
				<th>주민번호</th>
				<th>생년월일</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>최종학력</th>
				<th>경력</th>		
				<th>입사일자</th>
				<th>은행명</th>
				<th>계좌번호</th>
				<th>&nbsp;</th>					
			</tr>
			<c:forEach var="article" items="${articleList }">
			<tr>
				<td>${article.emp_code }</td>
				<td>${article.emp_name }</td>
				<td>${article.dept_name }</td>
				<td>${article.po_name }</td>
				<td>${article.emp_jumin }</td>
				<td>${article.emp_birth }</td>
				<td>${article.emp_phone }</td>
				<td>${article.emp_email }</td>
				<td>${article.emp_acability }</td>
				<td>${article.emp_career }</td>
				<td>${article.emp_join }</td>
				<td>${article.emp_bank }</td>
				<td>${article.emp_acnum }</td>
				<td><input type="button" value="수정" onclick="location='empUpdate.do?emp_code=${article.emp_code }'"/>
				<input type="button" value="삭제" onclick="deleteEvent(${article.emp_code})"/></td>
			</tr>
			</c:forEach>
		</table>
	</c:if>	
	
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
                            <p class="p1"><a class="link" target="_blank" href="#" rel="nofollow">groupware Website </a></p>
                            <p class="p1">Professional groupware website <a href="#" target="_blank"></a>.- groupware for websites. </p>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>