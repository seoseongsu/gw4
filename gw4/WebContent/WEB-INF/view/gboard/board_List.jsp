<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>List</title>
</head>


	<center><b>[${category_name}]</b><br />
	<table>
		<tr>
			
			<select id ="category" name="category" >
				<option>통합게시판</option>
			<c:forEach items="${categoryList}" var="category">
					<option value="${category.category_code}">${category.category_name}</option>		
			</c:forEach>
			
		</tr>
		</select>
	</table>
		<table border="1"  width="900">
		<tr>
				<th width="600">제목</th>
				<th width="100">작성자</th>
				<th width="100">작성날짜</th>
				<th width="100">조회</th>
			</tr>
			
			<c:forEach var="boardList" items="${boardList}">
				<tr align="center">
					<td>
					<a href="board_Content.do?board_num=${boardList.board_num}&pageNum=${currentPage}">${boardList.board_subject}</a></td>
					<td>작성자</td>
					<td>${boardList.board_date}</td>
					<td>${boardList.board_readcount}</td>
								
				</tr>			
			 </c:forEach>	
			</table>
		
		<table>
			<tr>
				<input type="button" value="글등록" OnClick="window.location='board_WriteForm.do'">
			</tr>
		</table>

<c:if test="${count > 0}">
   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="pageBlock" value="${10}"/>
   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
   <c:set var="startPage" value="${result * 10 + 1}" />
   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
   </c:if> 
          
   <c:if test="${startPage > 10}">
        <a href="list.do?pageNum=${startPage - 10 }">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="list.do?pageNum=${i}">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="list.do?pageNum=${startPage + 10}">[다음]</a>
   </c:if>
</c:if>

</body>
</html>

 