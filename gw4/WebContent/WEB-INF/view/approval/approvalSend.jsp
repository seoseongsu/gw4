<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>받은결재</title>
<body>

	<c:if test="${memId == null }">
		<script type="text/javascript">
			alert("로그인을 먼저 해주세요. 로그인창으로 이동합니다.");
			location.href='/gw4/main/login.do';
		</script>
	</c:if>
	
	<c:if test="${memId != '7' && memId != 'admin' }">
		<script type="text/javascript">
			alert("대표이사님 전용페이지입니다. 메인으로 이동합니다.");
			location.href='/gw4/main/main.do';
		</script>
	</c:if>
	
	<c:if test="${memId == '7' || memId == 'admin' }">
	<table width="150">
		<tr>
			<td align="center">내가 받은결재 목록</td>
		</tr>
	</table>
	<table border="1" width="60%">
		<form method="get" action="approvalSucces.do" name="approvalSucces">
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
					<input type="button" value="결재반려" onclick=""/>
					<input type="submit" value="결재완료" />
			</c:forEach>
		</form>
	</table>
	</c:if>
</body>