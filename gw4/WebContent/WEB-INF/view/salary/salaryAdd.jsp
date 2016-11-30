<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>급여등록</title>
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
<script type="text/javascript">
	window.onload=function(){
		document.getElementById("po_code").onchange=function(){
			var jid = document.getElementById("po_code").value;
			document.getElementById("normal").innerHTML = normal(jid);
		}
	}
	function normal(jid){
		var array = ["0","8000000","5500000","5000000","4000000","3000000","2500000","2000000"]
		return array[jid];
	}
</script>
<body>
	<table>
		<tr>
			<td align="left">사원급여 등록</td>
		</tr>
	</table>
	
	
	<table border="1" width="100%" >
	<form method="get" action="salaryAddPro.do" name="salaryinput" onSubmit="return checkIt()">
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
				<input type="text" id="salary_days" name="salary_days">
			</td>
			<td>
				<select name="dept_code">
					<c:forEach var="deptList" items="${deptList }">
						<c:choose>
				      		<c:when test="${deptList.dept_higher eq null}">
				      			<option value ="${deptList.dept_code }">${deptList.dept_name }</option>
				      		</c:when>
				      		<c:otherwise>
				      			<option value ="${deptList.dept_code }">${deptList.dept_higher }>${deptList.dept_name }</option>
				      		</c:otherwise>
			      		</c:choose>
		      		</c:forEach>
				</select>
			</td>
			<td>
				<select name="po_code" id="po_code">
				<c:forEach var="poList" items="${poList }">
					<option value="${poList.po_code }">${poList.po_name }</option>
				</c:forEach>
			</select>
			</td>
			<td>
				<select name="emp_code">
					<c:forEach var="empList" items="${empList }">
						<option value="${empList.emp_code }">${empList.emp_name }</option>
					</c:forEach>
				</select>
			</td>
  		   <td>
 		   <input type="text" id="salary_normal" name="salary_normal">
		   (해당직급의 기본급은 <span id="normal">0</span> 원입니다.)
		   </td>
		   <td>
		   <input type="text" id="salary_bonus" name="salary_bonus">
		   </td>
		</tr>
	
	</table>
		<tr>
			<td>
				<span style="float:right"><input type="submit" name="confirm" value="등록">
				<span style="float:right"><input type="button" value="취소" onclick="javascript:window.location='salaryList.do'">
			</td>
		</tr>
	</form>
</body>