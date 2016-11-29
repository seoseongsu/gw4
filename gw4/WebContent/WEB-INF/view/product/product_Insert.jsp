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
<b><center/>물품 등록</b><br /><br />
<form>
	<table border ="1" width="500" align="center">
		<tr>
			<th width="100">물품 코드</th>
			<td width="200"><input  size="25"  type="text" name=""></td>
		
			<th width="100">물품 분류</th>
			<td> 	<select>
			<option>HardWare</option>
			<option>SoftWare</option>
			</select></td>
		
		<tr>
			<th>물품 이름</th>
			<td colspan="3"><input size="53" type="text" name=""></td>
		</tr>
		
		<tr>
		<th>비고</th>
		<td colspan="3">
			<textarea ></textarea>
			</td>
			</tr>
		<tr>
			<td colspan="4" align="right" >
			<input align="right" type="submit"  value="전송" >
			<input type="button" value="취소">
			</td>
		</tr>
</table>
</form>
</tr>
</body>
</html>