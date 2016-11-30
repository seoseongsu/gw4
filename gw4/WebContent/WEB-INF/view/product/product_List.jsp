<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>물품 관리</title>
</head>
<body>
<table align="center"  width="1150" border="1">
<b><center>물품 관리</center></b><br />
				<tr>
					<th width="100">분류</th>
					<th width="250">물품(코드)번호</th>
					<th width="250">물품명</th>
					<th width="150">재고</th>
					<th width="100">총수량</th>
					<th width="150">상태</th>
					<th></th>
					
				</tr>
	<c:forEach var="productList" items="${productList}">
				<tr align="center">
					<td>${productList.product_type}</td>
					<td>${productList.hw_product_code}</td>
					<td>${productList.product_name}</td>
					<td>${productList.product_in}</td>
					<td>${productList.product_quantity}</td>
					<td>${productList.product_divide}</td>	
					<td style="width:8%">
					<input type="button" value="수정" 
						 onclick="document.location.href='product_Modify.do?product_num=${productList.product_num}'">
					<input type="button" value="삭제">
					</td>							
				</tr>			
			 </c:forEach>		 
	</table>

	
	<br />
<table align="center"  width="1150" >
<tr>
<td align="right" colspan="5">
<input type="button" value="등록"	 onclick="document.location.href='product_Insert.do'"></td>
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
</body>
</html>