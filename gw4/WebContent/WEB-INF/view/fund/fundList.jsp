<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>자금관리</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="#" />
<script language="javaScript">
function checkIt(){
	var days = eval("document.fundDays");
	var str = days.fund_days.value;
	var fund_days = str.charAt(str.length - 1);
	if(!days.fund_days.value){
		alert("처음 조회날짜를 정해주세요");
		return false;
	}else if(!days.fund_day.value){
		alert("마지막 조회날짜를 정해주세요");
		return false;
	}
}
</script>
<script>
$(function(){
	$("#fund_days").datepicker({
		dateFormat: 'yy - mm - dd',
		monthNamesShort: ['1월', '2월','3월', '4월','5월', '6월','7월', '8월','9월', '10월','11월', '12월'],
		dayNameMin: ['일','월','화','수','목','금','토'],
		changeMonth: true,	//월변경가능
		changeYear: true,	//일변경가능
		showMonthAfterYear: true	//년 뒤에 월표시
	});
});
$(function(){
	$("#fund_day").datepicker({
		dateFormat: 'yy - mm - dd',
		monthNamesShort: ['1월', '2월','3월', '4월','5월', '6월','7월', '8월','9월', '10월','11월', '12월'],
		dayNameMin: ['일','월','화','수','목','금','토'],
		changeMonth: true,	//월변경가능
		changeYear: true,	//일변경가능
		showMonthAfterYear: true	//년 뒤에 월표시
	});
});
</script>
<script>
function fundDelete(a){
	if(confirm("정말 삭제하시겠습니까??")==true){
		location.href="fundDeletePro.do?fund_code="+a
	}else{
		return;
	}
}
</script>


<body>
	<table width="110">
		<tr>
			<td align="center">자금수지 목록</td>
		</tr>
	</table>
	<table>
		<form method="get" action="fundDays.do" name="fundDays" onSubmit="return checkIt()">
			<tr><input type="text" id="fund_days" name="fund_days"> 일정별 조회<input type="text" id="fund_day" name="fund_day"></tr>
			<tr><input type="submit" value="조회하기"></tr>
		</form>
	</table>
	<span style="float:right"><input type="button"  value="자금등록" onclick="window.open('/gw4/fund/fundAdd.do?emp_code=7&dept_code=1&po_code=1','_self')"></span>
	<table border="1" width="100%">
	<form>
		<tr>
			<td align="center" width="50">집행일</td>
			<td align="center" width="50">집행부서</td>
			<td align="center" width="50">집행직급</td>
			<td align="center" width="50">집행자</td>
			<td align="center" width="50">구분</td>
			<td align="center" width="80">자금항목</td>
			<td align="center" width="120">적요</td>
			<td align="center" width="50">거래처</td>
			<td align="center" width="50">입금액</td>
			<td align="center" width="50">출금액</td>
			<td align="center" width="50">잔액</td>
			<td align="center" width="50">비고</td>
		</tr>
			<c:forEach var="fund" items="${fundList}">
			<tr>
				<c:set var="deposit" value="${deposit + fund.fund_deposit}"/>
				<c:set var="withdraw" value="${withdraw + fund.fund_withdraw}"/>
				<c:set var="balance" value="${deposit - withdraw }"/>
				<td align="center" width="50">${fund.fund_days}</td>
				<td align="center" width="50">${fund.dept_name }</td>
				<td align="center" width="50">${fund.po_name }</td>
				<td align="center" width="50">${fund.emp_name }</td>
				<td align="center" width="50">${fund.fund_division}</td>
				<td align="center" width="80">${fund.fund_item}</td>
				<td align="center" width="120">${fund.fund_briefs}</td>
				<td align="center" width="50">${fund.fund_account}</td>
				<td align="center" width="50"><fmt:formatNumber value="${fund.fund_deposit }" type="number"/></td>
				<td align="center" width="50"><fmt:formatNumber value="${fund.fund_withdraw }" type="number"/></td>
				<td align="center" width="50"><fmt:formatNumber value="${balance }" type="number"/></td>
				<td align="center" width="50">
				<input type="button" value="수정" onclick="location='fundUpdate.do?fund_code=${fund.fund_code }'"/>
				<input type="button" value="삭제" onclick="fundDelete(${fund.fund_code})"/>
				</td>
			</tr>

			</c:forEach>
		<tr>
			<td colspan="8" align="center">합계</td>
			<td align="center" width="50"><fmt:formatNumber value="${deposit }" type="number"/></td>
			<td align="center" width="50"><fmt:formatNumber value="${withdraw }" type="number"/></td>
			<td align="center" width="50"><fmt:formatNumber value="${balance }" type="number"/></td>
			<td align="center" width="50"></td>
		</tr>
	</table>

	</form>
	
</body>