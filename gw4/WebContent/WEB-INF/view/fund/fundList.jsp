<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>자금관리</title>
<body>
	<table width="110">
		<tr>
			<td align="center">자금수지 목록</td>
		</tr>
	</table>
	
	<table border="1" width="100%">
		<tr>
			<td align="center" width="50">집행일</td>
			<td align="center" width="50">구분</td>
			<td align="center" width="80">자금항목</td>
			<td align="center" width="120">적요</td>
			<td align="center" width="50">거래처</td>
			<td align="center" width="50">입금액</td>
			<td align="center" width="50">출금액</td>
			<td align="center" width="50">잔액</td>
		</tr>
		
		<tr>
			<td colspan="5" align="center">합계</td>
			<td align="center" width="50"></td>
			<td align="center" width="50"></td>
			<td align="center" width="50"></td>
		</tr>
	</table>
</body>