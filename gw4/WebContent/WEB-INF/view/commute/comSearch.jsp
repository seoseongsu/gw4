<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>근태검색</title>
<script type="text/javascript" src="/gw4/calendar/calendar.js"></script>
<script language="JavaScript">
    function checkIt() {
        if(!document.comSearch.searchDate.value) {
            alert("기간을 선택하세요");
            return false;
        }
    }
</script>
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
               <a href="/gw4/my/myView.do">정보조회<i class="fa fa-chevron-right"></i></a>   
               <a class="active" href="/gw4/commute/comDay.do">근태현황<i class="fa fa-chevron-right"></i></a>
               <a href="#">일정관리<i class="fa fa-chevron-right"></i></a>         
               <a href="/gw4/bs/bsList.do">업무관리<i class="fa fa-chevron-right"></i></a>          
               <a href="/gw4/dept/deptList.do">조직도<i class="fa fa-chevron-right"></i></a>       
            </ul>
         </div>
         <div id="right_wrapper">
            <div id="right_path">
               <h5><i class="fa fa-home"></i>&nbsp; > 인사관리 > 근태관리</h5>
            </div>
            
            <div id="right_header">
               <h1>근태 관리</h1>
            </div><br><br>
            


<h2>나의 일일 근태 검색 : ${checkDay }</h2>
<form name="comSearch" action="/gw4/commute/comSearch.do" onSubmit="return checkIt()">
<table border="1" width="80%">
<input type="hidden" name="emp_code" value="${emp_code }" />
	<tr>
		<td>
			* 근무일자 &nbsp;&nbsp;&nbsp;
			<input type="text" name="searchDate" id="searchDate" value="${checkDay }" onclick="fnPopUpCalendar(searchDate,searchDate,'yyyy-mm-dd')"/>
		</td> 
		<td>
			<input type="submit" value="검색" />
			<input type="button" value="근태등록"  onclick="window.location='/gw4/commute/comDay.do?emp_code=${emp_code}'" />
		</td>
	</tr>
</table>
</form>

<table border="1" width="80%">
	<tr>
		<td>사원번호</td>
		<td>성명</td>
		<td>직급</td>
		<td>부서</td>
		<td>출근시각</td>
		<td>퇴근시각</td>
		<td>근무시간</td>
		<td>PC IP</td>
	</tr>
	
	<c:forEach var="comSearchVo" items="${comSearchVo }">
		<tr>
			<td>${comSearchVo.emp_code }</td>
			<td>${comSearchVo.emp_name }</td>
			<td>${comSearchVo.po_name }</td>
			<td>${comSearchVo.dept_name }</td>
			<td><fmt:formatDate pattern="HH:mm" value="${comSearchVo.com_go }" /></td>
			<td><fmt:formatDate pattern="HH:mm" value="${comSearchVo.com_off }" /></td>
			<td>
				<c:if test="${comSearchVo.com_off != null }">
				시간
				</c:if>
			</td>
			<td>${comSearchVo.com_ip }</td>
		</tr>
	</c:forEach>
</table>



        </div>
      </div>
   </div>
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html>