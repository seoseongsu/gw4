<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>물품 관리</title>
<link rel="stylesheet" href="/gw4/css/styleS.css">
<style type="text/css">
#border_table{
	border: 1px solid #32607F;
	margin: auto;
	line-height: auto;
	border-collapse: collapse;
}
	
#border_table tr, #border_table td{
	border: 1px solid #32607F;
	text-align:center;
	vertical-align:middle;
	padding: 1px;
	border-collapse: collapse;
}

#border_table th{
	border: 1px solid #32607F;
	text-align:center;
	vertical-align:middle;
	padding: 1px;
	border-collapse: collapse;
	color: #ffffff;
	background-color:#3e779d;
}
</style>
<script type="text/javascript" src="/gw4/calendar/calendar.js"></script>
</head>
<body>
<b><center/>Soft Ware 등록</b><br /><br />
<form method="post" name="productSoftInsert" action="productSoft_InsertPro.do">
	<table  id="border_table" border="1" cellspacing="0" cellpadding="0" width="500" align="center">
	
		<tr>
			<th width="100">물품 분류</th>
			<td><input type="text"  style="width:97%" value="Soft Ware" name="product_type"> </td>
		
			<th width="100">시리얼 번호</th>
			<td ><input style="width:97%" type="text" name="sw_product_code"></td>
			
		<tr>
			<th>물품 이름</th>
			<td ><input style="width:97%" type="text" name="product_name"></td>
			
			<th>물품 등록일</th>
			<td ><input type="text"  id="product_register_day"  style="width:98%" name="product_register_day" onclick="fnPopUpCalendar(product_register_day,product_register_day,'yyyy-mm-dd')"></td>
			
		</tr>
		
		<tr>
			<th >총 수 량</th>
			<td ><input style="width:97%" type="text" name="product_quantity"></td>
			
			<th >재 고 량</th>
			<td ><input style="width:97%" type="text" name="product_in"></td>
		</tr>
		
		<tr>
			<th width="100">비고</th>
			<td width="400" colspan="4">
			<textarea rows="5" style="width:98%" name="product_note"></textarea>
			</td>
		</tr>
	
		<tr>
			<td colspan="5" align="right" style="text-align:right;border-right: hidden; border-bottom: hidden; border-left: hidden;">
			<input align="right" class="button" type="submit"  value="전송" onclick="goSubmit()">
			<input type="button" class="button" value="취소"  onclick="javascript:self.close()">
			</td>
		</tr>
</table>
</form>

<script type="text/javascript">
function goSubmit() {
    window.opener.name = "parentPage"; // 부모창의 이름 설정
    document.productSoftInsert.target = "parentPage"; // 타켓을 부모창으로 설정
    document.productSoftInsert.action = "/gw4/productSoft_InsertPro.do";
    document.productSoftInsert.submit();
    self.close();
}
</script>
</body>
</html>