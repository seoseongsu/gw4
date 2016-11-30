<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>급여관리</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="#" />
<script>
$(function(){
	$("#salary_days").datepicker({
		dateFormat: 'yy - mm - dd',
		monthNamesShort: ['1월', '2월','3월', '4월','5월', '6월','7월', '8월','9월', '10월','11월', '12월'],
		dayNameMin: ['일','월','화','수','목','금','토'],
		changeMonth: true,	//월변경가능
		changeYear: true,	//일변경가능
		showMonthAfterYear: true	//년 뒤에 월표시
	});
});
$(function(){
	$("#salary_day").datepicker({
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
function salaryDelete(a){
	if(confirm("정말 삭제하시겠습니까??")==true){
		location.href="salaryDeletePro.do?salary_code="+a
	}else{
		return;
	}
}
</script>
<body>
	<table width="110">
		<tr>
			<td align="center">급여조회</td>
		</tr>
	</table>
	<table>
		<form method="get" action="salaryDays.do" name="salaryDays" >
			<tr><input type="text" id="salary_days" name="salary_days"> 일정별 조회<input type="text" id="salary_day" name="salary_day"></tr>
			<tr><input type="submit" value="조회하기"></tr>
		</form>
	</table>
	<span style="float:right"><input type="button" value="급여등록" onclick="window.open('/spring/salary/salaryAdd.do','_self')"></span>
	<table border="1" width="100%">
	<form>
		<tr>
			<td align="center">등록일자</td>
			<td align="center">부서명</td>
			<td align="center">직급명</td>
			<td align="center">사원명</td>
			<td align="center" >기본급</td>
			<td align="center">상여금</td>
			<td align="center">지급액</td>
			<td align="center">국민연금</td>
			<td align="center">건강보험</td>
			<td align="center" >요양보험</td>
			<td align="center">고용보험</td>
			<td align="center">소득세</td>
			<td align="center">주민세</td>
			<td align="center">공제액</td>
			<td align="center">실지급액</td>
			<td align="center">은행</td>
			<td align="center">계좌번호</td>
			<td align="center">비고</td>
		</tr>
		<c:forEach var="salary" items="${salaryDays }">
		<tr>
			
			<c:set var="pay" value="${salary.salary_normal+salary.salary_bonus }"/>
			<c:set var="pension" value="${pay*0.045}"/>
			<c:set var="health" value="${pay*0.03}"/>
			<c:set var="nursing" value="${pay*0.05 }"/>
			<c:set var="employ" value="${pay*0.05}"/>
			<c:set var="income" value="${pay*0.004 }"/>
			<c:set var="resident" value="${income*0.01 }"/>
			<c:set var="deduction" value="${pension+health+nursing+employ+income+resident }"/>
			<c:set var="acpay" value="${pay-deduction }"/>
			<c:set var="acpa" value="${acpa + acpay }"/>
			<c:set var="dedu" value="${dedu + deduction  }"/>
			<td align="center">${salary.salary_days }</td>
			<td align="center">${salary.dept_name}</td>
			<td align="center">${salary.po_name}</td>
			<td align="center">${salary.emp_name}</td>
			<td align="center"><fmt:formatNumber value="${salary.salary_normal }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${salary.salary_bonus }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${pay }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${pension }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${health }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${nursing }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${employ }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${income }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${resident }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${deduction }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${acpay }" type="number" maxFractionDigits="0"/></td>
			<td align="center">${salary.emp_bank }</td>
			<td align="center">${salary.emp_acnum }</td>
			<td align="center">
			<input type="button" value="수정" onclick="location='salaryUpdate.do?salary_code=${salary.salary_code }'"/>
			<input type="button" value="삭제" onclick="salaryDelete(${salary.salary_code})"/>
			</td>
		</tr>
		</c:forEach>
		
		<tr>
			<td colspan="13" align="center">공제합계 및 실지급액 합계</td>
			<td align="center"><fmt:formatNumber value="${dedu }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${acpa }" type="number" maxFractionDigits="0"/></td>
		</tr>

	</form>
		<input type="button" value="전체보기" onclick="window.open('/gw4/salary/salaryList.do','_self')">
	</table>
</body>