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
			
			<th width="100">물품 분류</th>
			<td> 	<select>
			<option>Hard Ware</option>
			<option>Soft Ware</option>
			</select></td>
		
			
			<th width="100">시리얼 번호</th>
			<td colspan="2"width="300"><input style="width:99%" type="text" name=""></td>
			
		
		<tr>
			<th>물품 이름</th>
			<td colspan="2"><input style="width:99%" type="text" name=""></td>
			<th >수 량</th>
			<td width="100" ><input style="width:99%" type="text" name=""></td>
			
		</tr>
		
		<tr>
		<th width="100">비고</th>
		<td width="400" colspan="4">
			<textarea rows="5" style="width:99%"></textarea>
			</td>
			</tr>
		<tr>
			<td colspan="5" align="right" >
			<input align="right" type="submit"  value="전송" >
			<input type="button" value="취소"  onclick="javascript:history.go(-1)">
			</td>
		</tr>
</table>
</form>
</tr>
</body>
</html>