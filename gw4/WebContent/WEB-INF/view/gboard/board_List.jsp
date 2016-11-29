<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>
</head>
	
			<script>
			function categoryChange(category){
				window.location="/gw4/board_ListPro.do?category_code="+category;
	
			}
		</script>
	
	<table width="1000" align="center">
		<tr>
			<td align="center">
			<b></b><br />
			</td>
		</tr>
		</table>
	<table width="1000" align="center">
		<tr>
			<td colspan"4" align="right">
			<select  id ="category" name="category" onchange="categoryChange(this.value)">
				<option>통합게시판</option>
			<c:forEach items="${categoryList}" var="category" >
					<option value="${category.category_code}">${category.category_code}</option>		
			</c:forEach>
			</select>
			</td>	
		</tr>
	
	</table>
		<table border="1"  width="1000" align="center">
		<tr>	
				<th width="50">글번호</th>
				<th width="600">제목</th>
				<th width="100">작성자</th>
				<th width="150">작성날짜</th>
				<th width="100">조회</th>
			</tr>
			
			<c:forEach var="boardList" items="${boardList}">
				<tr align="center">
					<td>${boardList.board_num}</td>
					<td>
					<a href="board_Content.do?board_num=${boardList.board_num}&pageNum=${currentPage}">[${boardList.category_code}]${boardList.board_subject}</a></td>
					<td>작성자</td>
					<td>${boardList.board_date}</td>
					<td>${boardList.board_readcount}</td>
								
				</tr>			
			 </c:forEach>	
			</table>
		
		<table  width="1000" align="center">
			<tr>
			<td colspan="4" align="right">
				<input  type="button" value="글등록" OnClick="window.location='board_WriteForm.do'">
			</td>
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
        <a href="board_List.do?pageNum=${startPage - 10 }">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="board_List.do?pageNum=${i}">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="board_List.do?pageNum=${startPage + 10}">[다음]</a>
   </c:if>
</c:if>
</table>
</body>
</html>
 