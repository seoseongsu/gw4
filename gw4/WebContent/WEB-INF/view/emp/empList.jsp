<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>사원목록</title>
<script>
function deleteEvent(a){
	if(confirm("정말 삭제하시겠습니까??")==true){
		location.href="empDeletePro.do?emp_code="+a
	}else{
		return;
	}
}
</script>
</head>

<body>
	<table align="center">
		<tr>
			<td>
				<a href="empInsert.do">사원등록</a>
			</td>
		</tr>
	</table>
	
	<c:if test="${count == 0 }">
	<table align="center" border="1">
		<tr>
			<td>
				등록된 사원 정보가 없습니다.
			</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${count > 0 }">
		<table align="center" border="1">
			<tr>
				<td>사원번호</td>
				<td>성명</td>
				<td>부서(조직)</td>
				<td>직급</td>
				<td>최종학력</td>
				<td>입사일자</td>
				<td>...</td>					
			</tr>
			<c:forEach var="article" items="${articleList }">
			<tr>
				<td>${article.emp_code }</td>
				<td>${article.emp_name }</td>
				<td>${article.dept_code }</td>
				<td>${article.po_code }</td>
				<td>${article.emp_acability }</td>
				<td>${article.emp_join }</td>
				<td><input type="button" value="수정" onclick="location='empUpdate.do?emp_code=${article.emp_code }'"/>
				<input type="button" value="삭제" onclick="deleteEvent(${article.emp_code})"/></td>
			</tr>
			</c:forEach>
		</table>
	</c:if>	
</body>
</html>