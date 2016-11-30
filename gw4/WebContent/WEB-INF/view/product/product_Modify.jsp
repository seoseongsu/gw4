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
<b><center/>Hard Ware 정보 수정</b><br /><br />
<form method="post" name="modify" action="Product_ModifyPro.do?product_num=${productList.product_num}">

	<table border ="1" width="800" align="center">
	
	
	
		<tr>
			
			<th width="100">물품 분류</th>
				<td> <input type="text" name="product_type" value="${productList.product_type}"></td>
	
			<th width="100">시리얼 번호</th>
				<td colspan="2"width="300"><input style="width:99%" type="text"
				 name="hw_product_code" value="	${productList.hw_product_code}">
				</td>
		</tr>
		
				
		<tr>
			<th>물품 이름</th>
				<td colspan="2"><input style="width:99%" type="text" 
				name="product_name" value="	${productList.product_name}">
				</td>
				
			<th >총 수 량</th>
				<td width="100" ><input style="width:99%" type="text" 
				name="product_quantity" value="${productList.product_quantity}">
				</td>
			
		</tr>
		
		<tr>
			<th width="100">등록 날짜</th>
				<td colspan="2">
				${productList.product_register_day}</td>
			
			<th >재고 수량</th>
				<td width="100" ><input style="width:99%" type="text" 
				name="product_quantity" value="${productList.product_in}">
				
				</td>
		</tr>
		
		
		<tr>
			<th width="100">비고</th>
			<td width="400" colspan="4">
				<textarea rows="5" style="width:99%" name="product_note" 
				value="${productList.product_note}">
				</textarea>
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