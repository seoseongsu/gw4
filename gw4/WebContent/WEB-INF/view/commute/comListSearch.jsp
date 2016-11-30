<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>근태검색</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="#" />
<script>
$(function(){
	$("#searchDate1").datepicker({
		dateFormat: 'yy-mm-dd',
		monthNamesShort: ['1월', '2월','3월', '4월','5월', '6월','7월', '8월','9월', '10월','11월', '12월'],
		dayNameMin: ['일','월','화','수','목','금','토'],
		changeMonth: true,	//월변경가능
		changeYear: true,	//일변경가능
		showMonthAfterYear: true	//년 뒤에 월표시
	});
});
</script>
<script>
$(function(){
	$("#searchDate2").datepicker({
		dateFormat: 'yy-mm-dd',
		monthNamesShort: ['1월', '2월','3월', '4월','5월', '6월','7월', '8월','9월', '10월','11월', '12월'],
		dayNameMin: ['일','월','화','수','목','금','토'],
		changeMonth: true,	//월변경가능
		changeYear: true,	//일변경가능
		showMonthAfterYear: true	//년 뒤에 월표시
	});
});
</script>
</head>
<body>
<h2>근태 현황 검색 : ${checkDay1 } ~ ${checkDay2 }</h2>
<form name="comSearch" action="/gw4/commute/comListSearch.do" >
<table border="1" width="80%">
	<tr>
		<td>
			* 기간별검색 &nbsp;&nbsp;&nbsp;
			<input type="text" name="searchDate1" id="searchDate1" value="${checkDay1 }"/>~
			<input type="text" name="searchDate2" id="searchDate2" value="${checkDay2 }"/>
		</td>
		<td>
			<select name="dept_code" style="width:120px;height:23px;">
		      	<c:forEach var="deptList" items="${deptList }">
		      		<c:choose>
			      		<c:when test="${deptList.dept_higher eq null}">
			      			<option value ="${deptList.dept_code }" ${deptList.dept_code == dept_code ? 'selected="selected"' : '' }>${deptList.dept_name }</option>
			      		</c:when>
			      		<c:otherwise>
			      			<option value ="${deptList.dept_code }" ${deptList.dept_code == dept_code ? 'selected="selected"' : '' }>${deptList.dept_higher }>${deptList.dept_name }</option>
			      		</c:otherwise>
		      		</c:choose>
		      	</c:forEach>
	    	</select>
		</td> 
		<td>
			<input type="submit" value="검색" />
			<input type="button" value="전체" onclick="window.location='/gw4/commute/comList.do'"/>
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



</body>
</html>