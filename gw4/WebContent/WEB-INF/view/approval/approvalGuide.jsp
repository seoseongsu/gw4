<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>기안서작성</title>

<body>
	<table width="110">
		<tr>
			<td align="center">기안서작성</td>
		</tr>
	</table>
	
	<table border="1" width="50%" align="center">
		<form>
			<tr>
				<td align="center">결재양식명</td>
				<td align="center">해당결재작성</td>
			</tr>
			<tr>
				<td align="center">회식신청서</td>
				<td align="center"><input type="button" value="기안서작성" onclick="location='approvalDining.do'"/></td>
			</tr>
			<tr>
				<td align="center">휴가신청서</td>
				<td align="center"><input type="button" value="기안서작성" onclick="location='approvalGuide.do'"/></td>
			</tr>
		</form>
	</table>
</body>