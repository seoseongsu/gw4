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
	<c:if test="${count == 0 }">
	<table align="center" border="1">
		<tr>
			<td>
				등록된 사원 정보가 없습니다.
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="등록" onclick="location='bsInsert.do?emp_code=${emp_code }'"/>
			</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${count > 0 }">
		<table align="center" border="1">
			<tr><td colspan="6"><strong>나의 업무명세표</strong></td></tr>
			<tr align="center">
				<td>실행년도</td>
				<td>부서</td>
				<td>평가자</td>
				<td>작성일</td>
				<td>상태</td>
				<td>&nbsp;</td>		
			</tr>
			<c:forEach var="article" items="${articleList }">
			<tr align="center">
				<td>${article.bs_year }</td>
				<td>${article.dept_code }</td>
				<td>평가자이름</td>
				<td>${article.bs_date }</td>
				<td>${article.bs_st }</td>
				<td><input type="button" value="수정" onclick="location='empUpdate.do?emp_code=${article.emp_code }'"/>
				<input type="button" value="삭제" onclick="deleteEvent(${article.emp_code})"/></td>
			</tr>
			</c:forEach>
			<tr>
				<td>
					<input type="button" value="등록" onclick="location='bsInsert.do?emp_code=${emp_code }'"/>
				</td>
			</tr>
		</table>
	</c:if>	
	<table align="center" border="1">
		<tr><td colspan="6"><strong>부서원의 업무명세표</strong></td></tr>
		<tr align="center">
			<td>실행년도</td>
			<td>부서</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>상태</td>
			<td>&nbsp;</td>		
		</tr>
		<c:forEach var="article" items="${articleList }">
		<tr align="center">
			<td>${article.bs_year }</td>
			<td>${article.dept_code }</td>
			<td>${article.emp_code }</td>
			<td>${article.bs_date }</td>
			<td>${article.bs_st }</td>
			<td>
				<input type="button" value="검토" onclick="location='empUpdate.do?emp_code=${article.emp_code }'"/>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="6">
				<input type="button" value="등록" onclick="location='bsInsert.do?emp_code=${emp_code }'"/>
			</td>
		</tr>
	</table>
</body>
</html>