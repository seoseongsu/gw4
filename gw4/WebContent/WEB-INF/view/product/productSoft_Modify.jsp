<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>물품 관리</title>
</head>
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
</script>
<body>
<b><center/>Soft Ware 정보 수정</b><br /><br />
<form method="post" name="modify" action="productSoft_ModifyPro.do?product_num=${productSoftList.product_num}">

	<table border ="1" cellspacing="0" cellpadding="0" width="500" align="center">
	
	
	
		<tr>
			<th width="100">물품 분류</th>
			<td> <input type="text" style="width:97%" name="product_type" value="${productSoftList.product_type}"></td>
			
			<th width="100">시리얼 번호</th>
			<td ><input input style="width:97%" type="text" name="sw_product_code" value= "${productSoftList.sw_product_code}"></td>
		</tr>
		
				
		<tr>
			<th>물품 이름</th>
			<td ><input style="width:97%" type="text" name="product_name" value="${productSoftList.product_name}"></td>
			
			<th>물품 등록일</th>
			<td ><input type="text"  id="salary_days"  style="width:98%" name="product_register_day" value="${productSoftList.product_register_day}"></td>	
		</tr>
		
		<tr>
			<th >총 수 량</th>
			<td ><input style="width:97%" type="text" name="product_quantity" value="${productSoftList.product_quantity}"></td>
			
			<th >재 고 량</th>
			<td ><input style="width:97%" type="text" name="product_in" value="${productSoftList.product_in}"></td>
		</tr>
		
		
		<tr>
			<tr>
			<th width="100">비고</th>
			<td width="400" colspan="4">
			<textarea rows="5" style="width:98%" name="product_note">${productSoftList.product_note}</textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="5" align="right" >
			<input align="right" type="submit"  value="수정" >
			<input type="button" value="취소"  onclick="javascript:history.go(-1)">
			</td>
		</tr>
</table>
</form>
</body>
</html>