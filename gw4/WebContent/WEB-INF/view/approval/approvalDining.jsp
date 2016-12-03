<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>회식신청서</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script type="text/javascript" src="/gw4/calendar/calendar.js"></script>
<link rel="stylesheet" href="#" />
<script language="javaScript">
	function checkIt(){
		var dininginput = eval("document.dininginput");
		var str = dininginput.approval_title.value;
		var dining = str.charAt(str.length - 1);
		if(!dininginput.approval_title.value){
			alert("제목을 입력하세요");
			return false;
		}if(!dininginput.approval_day.value){
			alert("경재상신일자를 입력하세요");
			return false;
		}if(!dininginput.approval_days.value){
			alert("회식요청일자를 입력하세요");
			return false;
		}if(!dininginput.approval_member.value){
			alert("회식인원을 입력하세요");
			return false;
		}if(!dininginput.approval_content.value){
			alert("회식목적을 입력하세요");
			return false;
		}
	}
</script>
<body>
	<table width="130">
		<tr>
			<td align="center">회식신청서 등록</td>
		</tr>
	</table>
	
	<table border="1" width="60%" align="center">
		<form method="get" action="approvalDiningPro.do" name="dininginput" onSubmit="return checkIt()">
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
				<td>결재상신일자<input type="text" id="approval_day" name="approval_day" onclick="fnPopUpCalendar(approval_day,approval_day,'yyyy - mm - dd')"></td>
				<td>회식요청일자<input type="text" id="approval_days" name="approval_days" onclick="fnPopUpCalendar(approval_days,approval_days,'yyyy - mm - dd')"></td>
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