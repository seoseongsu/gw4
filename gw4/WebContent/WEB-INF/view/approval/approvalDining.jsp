<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>회식신청서</title>
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
	<table width="130">
		<tr>
			<td align="center">회식신청서 등록</td>
		</tr>
	</table>
	
	<table border="1" width="60%" align="center">
		<form method="get" action="approvalDiningPro.do" name="dininginput" onSubmit="return checkIt()">
		<input type="hidden" name="dept_code" value="1"/>
		<input type="hidden" name="po_code" value="1"/>
			<tr>
				<td>기안자</td>
				<td>결재자</td>
			</tr>
			<tr>
				<td>${employeeJoinVo.emp_name }</td>
				<td>
					<select name="emp_code">
						<c:forEach var="empList" items="${empList }">
							<option value="${empList.emp_code }">${empList.emp_name }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">제목<input type="text" id="approval_title" name="approval_title"/></td>
			</tr>
			<tr>
				<td>결재상신일자<input type="text" id="approval_day" name="approval_day"></td>
				<td>회식신청일자<input type="text" id="approval_days" name="approval_days"></td>
			</tr>
			<tr>
				<td colspan="2">회식참여인원<input type="text"  id="approval_member" name="approval_member"/>명</td>
			</tr>
			<tr align="center">
				<td colspan="2">회식목적</td>
			</tr>
			<tr align="center">
				<td colspan="2" align="center">
					<textarea cols="40" rows="15" id="approval_content" name="approval_content"></textarea>
				</td>
			</tr>
			<input type="submit" name="confirm" value="결재상신"/>
		</table>
			
		</form>	
</body>