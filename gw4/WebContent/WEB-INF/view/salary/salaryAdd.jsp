<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>급여등록</title>

<body>
	<table>
		<tr>
			<td align="left">사원급여 등록</td>
		</tr>
	</table>
	
	<table>
	<form method="get" action="salaryAddPro.do" name="salaryinput" onSubmit="return checkIt()">
		<tr>부서명
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
		</tr>
		<tr>직급명
			<select onChange="change(this.option[this.selectedIndex].value)" name="po_code">
				<c:forEach var="poList" items="${poList }">
					<option value="${poList.po_code }">${poList.po_name }</option>
				</c:forEach>
			</select>
		</tr>
		<tr>
		
	</form>
	</table>
</body>