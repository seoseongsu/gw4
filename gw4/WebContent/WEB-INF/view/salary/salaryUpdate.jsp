<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>급여정보수정</title>
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

<table border="1">
	<form method="get" action="salaryUpdatePro.do" name="salaryinput" onSubmit="return checkIt()">
		<input type="hidden" name="salary_code" value="${salaryJoinVo.salary_code }"/>
		<tr>
			<td>등록일자</td>
			<td>부서명</td>
			<td>직급명</td>
			<td>사원이름</td>
			<td>기본급</td>
			<td>상여금</td>
			</tr>
			
			<tr>
				<td>
					<input type="text" id="salary_days" name="salary_days" value="${salaryJoinVo.salary_days }">
				</td>
				<td>
					${salaryJoinVo.dept_name }
				</td>
				<td>
					${salaryJoinVo.po_name }
				</td>
				<td>
					${salaryJoinVo.emp_name }
				</td>
	  		   <td>
	 		   <input type="text" id="salary_normal" name="salary_normal" value="${salaryJoinVo.salary_normal }"/>
			   </td>
			   <input type="text" id="salary_bonus" name="salary_bonus" value="${salaryJoinVo.salary_bonus }"/>
			   </td>
			</tr>
		</table>
			<tr>
				<td>
					<span style="float:right"><input type="submit" name="confirm" value="수정">
					<span style="float:right"><input type="button" value="취소" onclick="javascript:window.location='salaryList.do'">
				</td>
			</tr>
	</form>
</table>