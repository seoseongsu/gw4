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
		monthNamesShort: ['1��', '2��','3��', '4��','5��', '6��','7��', '8��','9��', '10��','11��', '12��'],
		dayNameMin: ['��','��','ȭ','��','��','��','��'],
		changeMonth: true,	//�����氡��
		changeYear: true,	//�Ϻ��氡��
		showMonthAfterYear: true	//�� �ڿ� ��ǥ��
	});
});
$(function(){
	$("#salary_day").datepicker({
		dateFormat: 'yy - mm - dd',
		monthNamesShort: ['1��', '2��','3��', '4��','5��', '6��','7��', '8��','9��', '10��','11��', '12��'],
		dayNameMin: ['��','��','ȭ','��','��','��','��'],
		changeMonth: true,	//�����氡��
		changeYear: true,	//�Ϻ��氡��
		showMonthAfterYear: true	//�� �ڿ� ��ǥ��
	});
});
</script>
</head>
<b><center>��ǰ ��û</b>
<body>
<form method="post"  >
		<table border ="1" cellspacing="0" cellpadding="0"  width="700" align="center">
		
		<tr>
		<th >��ǰ �̸�</th>
		<td  ><input  type="text"   style="width:98%" Readonly  name="product_name" value="${productList.product_name }"></td>
		<th>��û��</th>
		<td ><input type="text"  style="width:98%"   name="Apply_name"></td>
		</tr>
		
		
		<tr>
		<th>��� ��¥</th>
		<td ><input type="text"  id="salary_days"  style="width:98%" name="product_rona_day"></td>
		
		<th>�԰� ������</th>
		<td ><input type="text"  id="salary_day"  style="width:98%" name="product_rona_day"></td>
		

		</tr>	
		
		<tr>
		<th>���</th>
		<td><input type="text"  Readonly  style="width:98%" name="product_name" value="${productList.product_in}"></td>
		<th>��û ����</th>
		<td><input type="text"   style="width:98%"  name="product_name" value=""></td>
		</tr>			
		
		<tr>
		<th>�� ����</th>
		<td colspan="3"><textarea rows="5" style="width:99%" name="product_note"></textarea></td>
		</tr>
		</table>
		<br />
		<table >
		<tr>
		<td  colspan="4"  align="right" >
		<input type="submit" value="��û�ϱ�">
		<input type="button" value="���" onclick="javascript:history.go(-1)">		
		</td>
		</tr>
		</table>
	</body>
</html>