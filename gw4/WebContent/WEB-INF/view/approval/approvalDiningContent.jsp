<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>회식요청</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="#" />
<script>
$(function(){
	$("#approval_days").datepicker({
		dateFormat: 'yy - mm - dd',
		monthNamesShort: ['1월', '2월','3월', '4월','5월', '6월','7월', '8월','9월', '10월','11월', '12월'],
		dayNameMin: ['일','월','화','수','목','금','토'],
		changeMonth: true,	//월변경가능
		changeYear: true,	//일변경가능
		showMonthAfterYear: true	//년 뒤에 월표시
	});
});

$(function(){
	$("#approval_day").datepicker({
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
	<table width="160">
		<tr>
			<td align="center">회식요청 결재 내용</td>
		</tr>
	</table>
	
	<table border="1" width="60%" align="center">
		<form>
			<tr>
				<td colspan="2">기안자 : ${approvalJoinVo.emp_name }</td>
			</tr>
			<tr>
				<td colspan="2">제목 : ${approvalJoinVo.approval_title }</td>
			</tr>
			<tr>
				<td>결재상신일자 : ${approvalJoinVo.approval_day }</td>
				<td>회식신청일자 : ${approvalJoinVo.approval_days }</td>
			</tr>
			<tr>
				<td colspan="2">회식참여인원 : ${approvalJoinVo.approval_member }명</td>
			</tr>
			<tr align="center">
				<td colspan="2">회식목적</td>
			</tr>
			<tr align="center">
				 <td align="left" cols="40" rows="15" colspan="2"><pre>${approvalJoinVo.approval_content}</pre></td>
			</tr>
		</table>
			
		</form>	
</body>