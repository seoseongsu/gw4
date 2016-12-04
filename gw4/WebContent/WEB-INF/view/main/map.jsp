<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>길찾기</title>
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0; border-width:0px;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 20px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 20px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;}
.tg .tg-yw4l{vertical-align:top}
</style>
</head>
<body>
<jsp:include page="/layout/header.jsp" /> 

<div id="sub_wrapper">
      <div id="sub_con_wrapper">
         <div id="left_wrapper">
            <div id="left_title">
               <span>
                  고객과의 신뢰를<br>최고로 여기는 기업
               </span>
               <h2>
              찾아오는길
               </h2>
            </div>
            
            <ul>
               <a class="active" href="/gw4/main/map.do">찾아오는길<i class="fa fa-chevron-right"></i></a>          
            </ul>
         </div>
         <div id="right_wrapper">
            <div id="right_path">
               <h5><i class="fa fa-home"></i>&nbsp; > 찾아오는길</h5>
            </div>
            
            <div id="right_header">
               <h1>찾아오는길</h1>
            </div>
            <!-- mainContent 시작 본문 내용 삽입-->
            <br/>
				<table class="tg">
				  <tr>
				    <th class="tg-yw4l" align:center;>&nbsp;&nbsp;주소</th>
				    <th class="tg-yw4l" colspan="2">서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F(T: 1544-9970 / F: 070-8290-2889)</th>
				  </tr>
				  <tr>
				    <td class="tg-yw4l" align:center;>&nbsp;&nbsp;버스</td>
				    <td class="tg-yw4l"><img src="https://www.iei.or.kr/resources/images/sub01/sub01_06_busB.jpg">146 / 740 / 341 / 360</td>
				    <td class="tg-yw4l"><img src="https://www.iei.or.kr/resources/images/sub01/sub01_06_busR.jpg">1100 / 1700 / 2000 / 7007 / 8001</td>
				  </tr>
				  <tr>
				    <td class="tg-yw4l" align:center;>지하철</td>
				    <td class="tg-yw4l" colspan="2">지하철 2호선 역삼역 3번출구 100m</td>
				  </tr>
				</table><br/><br/><br/>
				<iframe width="600" height="450" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C%20%EA%B0%95%EB%82%A8%EA%B5%AC%20%ED%85%8C%ED%97%A4%EB%9E%80%EB%A1%9C%2014%EA%B8%B8%206%20%EB%82%A8%EB%8F%84%EB%B9%8C%EB%94%A9&key=AIzaSyAQrL4upn3pseuIhIuxkoZSdNEMhTIwXfI" allowfullscreen></iframe><br/><br/><br/><br/><br/>
			<!-- mainContent 끝 -->
         </div>
	</div>
</div>

<jsp:include page="/layout/footer.jsp" />

</body>
</html>