<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>업무명세서목록</title>
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
	<c:if test="${countMy == 0 }">
	<table align="center" border="1" width="720">
		<tr><td colspan="6"><strong>나의 업무명세표</strong></td></tr>
		<tr>
			<td>
				등록된 업무명세표가 없습니다.
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="등록" onclick="location='bsInsert.do?emp_code=${emp_code }'"/>
			</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${countMy > 0 }">
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
			<c:forEach var="bsMyList" items="${bsMyList }">
			<tr align="center">
				<td>${bsMyList.bs_year }</td>
				<td>${bsMyList.dept_name }</td>
				<td>${bsMyList.bs_ap }</td>
				<td>${bsMyList.bs_date }</td>
				<td>${bsMyList.bs_st }</td>
				<td><input type="button" value="수정" onclick="location='bsUpdate.do?emp_code=${bsMyList.emp_code }&bs_code=${bsMyList.bs_code }'"/>
				<input type="button" value="삭제" onclick="deleteEvent(${bsMyList.bs_code})"/></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="right">
					<input type="button" value="등록" onclick="location='bsInsert.do?emp_code=${emp_code}'"/>
				</td>
			</tr>
		</table>
	</c:if>	
	<br>
	<c:if test="${countDept == 0 }">
	<table align="center" border="1" width="720">
		<tr><td colspan="6"><strong>부서원의 업무명세표</strong></td></tr>
		<tr>
			<td>
				등록된 업무명세표가 없습니다.
			</td>
		</tr>
	</table>
	</c:if>
	<c:if test="${countDept > 0 }">
		<c:if test="${leaderCk.po_code <= 2 }" >
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
				<c:forEach var="bsDeptList" items="${bsDeptList }">
				<tr align="center">
					<td>${bsDeptList.bs_year }</td>
					<td>${bsDeptList.dept_name }</td>
					<td>${bsDeptList.emp_name }</td>
					<td>${bsDeptList.bs_date }</td>
					<td>${bsDeptList.bs_st }</td>
					<td align="left">
						<input type="button" value="검토" onclick="location='bsUpdate.do?emp_code=${bsDeptList.emp_code }&bs_code=${bsDeptList.bs_code }'"/>
					</td>
				</tr>
				</c:forEach>
			</table>
		</c:if>
	</c:if>
</div>
</body>
</html>