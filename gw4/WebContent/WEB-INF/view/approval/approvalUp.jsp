<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>신청결재</title>
<body>
	<table width="150">
		<tr>
			<td align="center">신청중인 결재 목록</td>
		</tr>
	</table>
	<table border="1" width="60%">
		<form method="get" action="approvalDelete.do?approval_code=${approval.approval_code }" >
			<tr>
				<td align="center" width="50">기안자</td>
				<td align="center" width="50">상신일자</td>
				<td align="center" width="50">제목</td>
				<td align="center" width="50">비고</td>
			</tr>
			<c:forEach var="approval" items="${approvalList }">
				<tr>
					<td align="center" width="50">${approval.emp_name }</td>
					<td align="center" width="50">${approval.approval_day }</td>
					<td align="center" width="50"><a href="approvalDiningContent.do?approval_code=${approval.approval_code }">${approval.approval_title }</a></td>
					<td align="center" width="50">
					<input type="submit" value="신청결재삭제" />
			</c:forEach>
		</form>
	</table>
</body>