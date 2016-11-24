<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>급여관리</title>

<body>
	<table width="110">
		<tr>
			<td align="center">급여조회</td>
		</tr>
	</table>
	<span style="float:right"><input type="button" value="급여등록" onclick="window.open('/gw4/salary/salaryAdd.do','_self')"></span>
	<table border="1" width="100%">
	<form>
		<tr>
			<td align="center" width="50">부서명</td>
			<td align="center" width="50">직급명</td>
			<td align="center" width="50">사원이름</td>
			<td align="center" width="50">경력</td>
			<td align="center" width="50">기본급</td>
			<td align="center" width="50">상여금</td>
			<td align="center" width="50">지급액</td>
			<td align="center" width="50">국민연금</td>
			<td align="center" width="50">건강보험</td>
			<td align="center" width="50">요양보험</td>
			<td align="center" width="50">고용보험</td>
			<td align="center" width="50">소득세</td>
			<td align="center" width="50">주민세</td>
			<td align="center" width="50">공제액</td>
			<td align="center" width="50">실지급액</td>
			<td align="center" width="50">은행</td>
			<td align="center" width="50">계좌번호</td>
		</tr>
		
		<c:forEach var="salary" items="${salaryList }">
		<tr>
			<td align="center" width="50">${salary.dept_name}</td>
			<td align="center" width="50">${salary.po_name}</td>
			<td align="center" width="50">${salary.emp_name}</td>
			<td align="center" width="50">${salary.emp_career}</td>
			<td align="center" width="50">${salary.salary_normal}</td>
			<td align="center" width="50">${salary.salary_bonus }</td>
			<td align="center" width="50">${salary.salary_pay }</td>
			<td align="center" width="50">${salary.salary_pension }</td>
			<td align="center" width="50">${salary.salary_health }</td>
			<td align="center" width="50">${salary.salary_nursing }</td>
			<td align="center" width="50">${salary.salary_employ }</td>
			<td align="center" width="50">${salary.salary_income }</td>
			<td align="center" width="50">${salary.salary_resident }</td>
			<td align="center" width="50">${salary.salary_deduction }</td>
			<td align="center" width="50">${salary.salary_acpay}</td>
			<td align="center" width="50">${salary.emp_bank }</td>
			<td align="center" width="50">${salary.emp_acnum }</td>
		</tr>
		</c:forEach>
	</form>
	</table>
</body>