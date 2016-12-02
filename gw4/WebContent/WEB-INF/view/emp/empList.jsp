<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>사원목록</title>
<link rel="stylesheet" type="text/css" href="/gw4/css/flexslider.css">
<link rel="stylesheet" type="text/css" href="/gw4/css/style.css">
<script type="text/javascript" src="/gw4/js/jquery.flexslider.js"></script>
<script>
function deleteEvent(a){
	if(confirm("정말 삭제하시겠습니까??")==true){
		location.href="empDeletePro.do?emp_code="+a
	}else{
		return;
	}
}
</script>

<style>
	/*성수야, 아까 말한게~ line 266번째에 테이블 class지정하고, tr이랑 td에 해당하는 CSS를 지정해주면 가능하다는 건뎅
	이렇게 해서 맘에 들런지 모르겠당~ 힘내~ */
	#border_table{
	border: 1px solid;
	margin: auto;
	line-height: auto;
	}
	
	#border_table tr, #border_table td, #border_table th{
	border: 1px solid;
	text-align:center;
	vertical-align:middle;
	padding: 1px;
	/*여기에 padding:3px주면, 표가 보기좋게 넓어지는데, 줄바꿈이 되는 것 같아~ */
	}

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
                  회사소개
               </h2>
            </div>
            
            <ul>
               <a class="active" href="sub0101.html">CEO인사말<i class="fa fa-chevron-right"></i></a>   
               <a href="#">회사연혁<i class="fa fa-chevron-right"></i></a>         
               <a href="#">경영이념<i class="fa fa-chevron-right"></i></a>
               <a href="#">조직도<i class="fa fa-chevron-right"></i></a>         
               <a href="#">협력업체<i class="fa fa-chevron-right"></i></a>         
            </ul>
         </div>
         <div id="right_wrapper">
            <div id="right_path">
               <h5><i class="fa fa-home"></i>&nbsp; > 회사소개 > CEO Message</h5>
            </div>
            
            <div id="right_header">
               <h1>CEO Message</h1>
               <h2>앞선 기술력과 뛰어난 혁신으로<br>고객 여러분께 최고의 경험을 선물합니다.</h2>
            </div>
            
            <p>
               고객 여러분 안녕하십니까? <br>
               저희 홈페이지를 방문해주셔서 감사합니다. <br><br>
               저희 DAVE COMPANY 주식회사는 지난 수년간의 노력과 시행착오를 통해 고객님들과 더불어 성장하였습니다.<br><br>
               관련업계의 경쟁이 점점 더 격화되고 있는 상황에서도 고객을 먼저 생각하는 정신을 바탕으로 성공하여 이목을 집중시켰습니다.<br><br>
               DAVE COMPAN 주식회사는 선진화된 기술과 장비로 국내는 물론 세계를 무대로 발전해 나갈것이며, 항상 최고의 품질과 서비스 정신을 최우선으로 남보다 한걸음 더 앞서 나갈것을 약속드립니다. <br><br>

            </p>
            <p>
               DAVE COMPANY 주식회사는 미래 사업들을 선도적으로 수행하는 자회사들의 시너지 효과가 극대화될 수 있도록 효과적으로 관리하고 긴밀히 지원하면서 그룹 전체의 안정 기틀을 다졌습니다.<br><br>
               지금까지 DAVE COMPANY 주식회사를 믿고 성원해주신 고객 여러분께 진심으로 감사드리며, 앞으로도 우리 DAVE COMPANY 주식회사는 여러분과 함께 국가산업 발전과 인류의 번영에 지속적으로 공헌하는 기업이 될 것을 약속드립니다. <br><br>
               고객 여러분의 지속적인 격려와 성원을 부탁드립니다.<br><br>
               감사합니다.<br><br>
            </p>
         </div>
      </div>
   </div>
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
			<tr style="border:none;border:hidden;border-bottom:1px solid;">
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
	<jsp:include page="/layout/footer.jsp" />
</body>
</html>