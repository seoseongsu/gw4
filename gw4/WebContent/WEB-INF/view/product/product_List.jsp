<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>물품 관리</title>
</head>
<body>
<table align="center"  width="1000" border="1">
<b><center>물품 관리</center></b><br />
<tr>
<th width="100">분류</th>
<th width="250">물품(코드)번호</th>
<th width="250">물품명</th>
<th width="150">재고</th>
<td width="100">총수량</td>
<th width="150">상태</th>
</tr>
	<tr>
		<td width="100">h/w</td>
		<td width="250">S_00123457MGH</td>
		<td width="250">문근혁의 가슴근육</td>
		<td width="100">0</td>
		<td width="100">2</td>
		<td width="100">출고</td>
	</tr>
	
	<tr>
		<td width="100">h/w</td>
		<td width="250">S_0014457MGH</td>
		<td width="250">문근혁의 심장</td>
		<td width="100">0</td>
		<td width="100">2</td>
		<td width="100">출고</td>
	</tr>
	</table>
	<br />
<table table align="center"  width="1000" >
<tr>
<td align="right" colspan="5">
<input type="button" value="등록"	 onclick="document.location.href='product_Insert.do'"></td>
</tr>
</table>
</body>
</html>