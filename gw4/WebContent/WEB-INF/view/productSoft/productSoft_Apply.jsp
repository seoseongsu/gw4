<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
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
$(function(){
	$("#salary_day").datepicker({
		dateFormat: 'yy - mm - dd',
		monthNamesShort: ['1월', '2월','3월', '4월','5월', '6월','7월', '8월','9월', '10월','11월', '12월'],
		dayNameMin: ['일','월','화','수','목','금','토'],
		changeMonth: true,	//월변경가능
		changeYear: true,	//일변경가능
		showMonthAfterYear: true	//년 뒤에 월표시
	});
});
</script>
</head>
<b><center>물품 신청</b>
<body>
<form method="post"  >
		<table border ="1" cellspacing="0" cellpadding="0"  width="700" align="center">
		
		<tr>
		<th >물품 이름</th>
		<td  ><input  type="text"   style="width:98%" Readonly  name="product_name" value="${productList.product_name }"></td>
		<th>신청인</th>
		<td ><input type="text"  style="width:98%"   name="Apply_name"></td>
		</tr>
		
		
		<tr>
		<th>출고 날짜</th>
		<td ><input type="text"  id="salary_days"  style="width:98%" name="product_rona_day"></td>
		
		<th>입고 예정일</th>
		<td ><input type="text"  id="salary_day"  style="width:98%" name="product_rona_day"></td>
		

		</tr>	
		
		<tr>
		<th>재고량</th>
		<td><input type="text"  Readonly  style="width:98%" name="product_name" value="${productList.product_in}"></td>
		<th>신청 수량</th>
		<td><input type="text"   style="width:98%"  name="product_name" value=""></td>
		</tr>			
		
		<tr>
		<th>상세 내용</th>
		<td colspan="3"><textarea rows="5" style="width:99%" name="product_note"></textarea></td>
		</tr>
		</table>
		<br />
		<table >
		<tr>
		<td  colspan="4"  align="right" >
		<input type="submit" value="신청하기">
		<input type="button" value="취소" onclick="javascript:history.go(-1)">		
		</td>
		</tr>
		</table>
	</body>
</html>