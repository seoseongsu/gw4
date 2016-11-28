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
		location.href="bsDeletePro.do?bs_code="+a
	}else{
		return;
	}
}
</script>
</head>

<body>
<div>
	<c:if test="${count == 0 }">
	<table align="center" border="1" width="720">
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
		<table align="center" border="1" width="720">
			<tr><td colspan="6"><strong>나의 업무명세표</strong></td></tr>
			<tr align="center">
				<td width="100">실행년도</td>
				<td width="70">부서</td>
				<td width="100">평가자</td>
				<td width="200">작성일</td>
				<td width="150">상태</td>
				<td width="100">&nbsp;</td>	
			</tr>
			<c:forEach var="bsList" items="${bsList }">
			<tr align="center">
				<td>${bsList.bs_year }</td>
				<td>${bsList.dept_name }</td>
				<td>${bsList.bs_ap }</td>
				<td>${bsList.bs_date }</td>
				<td>${bsList.bs_st }</td>
				<td><input type="button" value="수정" onclick="location='bsUpdate.do?emp_code=${bsList.emp_code }&bs_code=${bsList.bs_code }'"/>
				<input type="button" value="삭제" onclick="deleteEvent(${bsList.bs_code})"/></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="right">
					<input type="button" value="등록" onclick="location='bsInsert.do?emp_code=7'"/>
				</td>
			</tr>
		</table>
	</c:if>	
	<br>
	<table align="center" border="1" width="720">
		<tr><td colspan="6"><strong>부서원의 업무명세표</strong></td></tr>
		<tr align="center">
			<td width="100">실행년도</td>
			<td width="70">부서</td>
			<td width="100">작성자</td>
			<td width="200">작성일</td>
			<td width="150">상태</td>
			<td width="100">&nbsp;</td>			
		</tr>
		<c:forEach var="bsList" items="${bsList }">
		<tr align="center">
			<td>${bsList.bs_year }</td>
			<td>${bsList.dept_name }</td>
			<td>${bsList.emp_name }</td>
			<td>${bsList.bs_date }</td>
			<td>${bsList.bs_st }</td>
			<td align="left">
				<input type="button" value="검토" onclick="location='empUpdate.do?emp_code=${article.emp_code }'"/>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="6" align="right">
				<input type="button" value="등록" onclick="location='bsInsert.do?emp_code=7'"/>
			</td>
		</tr>
	</table>
</div>
</body>
</html>