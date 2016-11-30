<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>근태등록</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="#" />
<script>
$(function(){
	$("#searchDate").datepicker({
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
<h2>일일근태등록</h2>
<form name="comSearch" action="/gw4/commute/comSearch.do" >
<table border="1" width="80%">
	<input type="hidden" name="emp_code" value="${emp_code }" />
	<tr>
		<td>
			* 근무일자 &nbsp;&nbsp;&nbsp;
			<input type="text" name="searchDate" id="searchDate"/>
		</td> 
		<td>
			<input type="submit" value="검색" />
		</td>
	</tr>
</table>
</form>

<table border="1" width="80%">
	<tr>
		<td colspan="5" style="color:red; font-weight: bold;">접속IP : ${ip }</td>
		<td>
			<input type="button" value="출근" onclick="window.location='/gw4/commute/comGo.do?emp_code=${emp_code}'" />
			<input type="button" value="퇴근" onclick="window.location='/gw4/commute/comOff.do?emp_code=${emp_code}'" />
		</td>
	</tr>

	<tr>
		<td>사원번호</td>
		<td>성명</td>
		<td>출근시각</td>
		<td>퇴근시각</td>
		<td>상태</td>
		<td>PC IP</td>
	</tr>

<c:if test="${count == 0 }">
	<tr>
		<td>${emp_code }</td>
		<td>${emp_name }</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</c:if>

<c:if test="${count != 0 }">
	<tr>
		<td>${emp_code }</td>
		<td>${emp_name }</td>
		<td><fmt:formatDate pattern="HH:mm" value="${comVo.com_go }" /></td>
		<td><fmt:formatDate pattern="HH:mm" value="${comVo.com_off }" /></td>
		<td>${comVo.com_status }</td>
		<td>${comVo.com_ip }</td>
	</tr>
</c:if>
</table>

</body>
</html>