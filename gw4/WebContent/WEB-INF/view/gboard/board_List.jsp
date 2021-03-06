<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="/gw4/css/styleS.css">
<style type="text/css">
#border_table{
	border: 1px solid #32607F;
	margin: auto;
	line-height: auto;
	border-collapse: collapse;
}
	
#border_table tr, #border_table td{
	border: 1px solid #32607F;
	text-align:center;
	vertical-align:middle;
	padding: 1px;
	border-collapse: collapse;
}

#border_table th{
	border: 1px solid #32607F;
	text-align:center;
	vertical-align:middle;
	padding: 1px;
	border-collapse: collapse;
	color: #ffffff;
	background-color:#3e779d;
}
</style>
<link rel="stylesheet" type="text/css" href="/gw4/css/flexslider.css">
<link rel="stylesheet" type="text/css" href="/gw4/css/style.css">
<script type="text/javascript" src="/gw4/js/jquery.flexslider.js"></script>
<script>
			function categoryChange(category){
				window.location="/gw4/board_List.do?category_code="+category;
	
			}
		</script>
</head>
		
<body>
<jsp:include page="/layout/header.jsp" />  

   <div id="sub_wrapper">
      <div id="sub_con_wrapper">
         <div id="left_wrapper">
            <div id="left_title">
               <span>
                  고객과의 신뢰를<br>최고로 여기는 기업
               </span>
               <h2>
                  회사소개
               </h2>
            </div>
            
            <ul>
               <a class="active" href="/gw4/board_List.do">게시판<i class="fa fa-chevron-right"></i></a>   
               </ul>
         </div>
         <div id="right_wrapper">
            <div id="right_path">
               <h5><i class="fa fa-home"></i>&nbsp; > 게시판</h5>
            </div>
            
            <div id="right_header">
               <h1>게시판</h1>
            </div><br><br>
            
            
            
     <c:if test="${memId == null }">
		<script type="text/javascript">
			alert("로그인을 먼저 해주세요. 로그인창으로 이동합니다.");
			location.href='/gw4/main/login.do';
		</script>
	</c:if>
     
     

	
	<table id="border_table"  border="1" cellspacing="0" cellpadding="0" width="1000" align="left">
		<tr>
			<td colspan"4" style="text-align: right;vertical-align:right;border:hidden;">
			<select  id ="category" style="border: 1px solid;" name="category" onchange="categoryChange(this.value)">
				<option>---------</option>
			<c:forEach items="${categoryList}" var="category" >
					<option value="${category.category_code}">${category.category_name}</option>		
			</c:forEach>
			</select>
			</td>	
		</tr>
	</table>
	<br />
		<table id="border_table" border="1" cellspacing="0" cellpadding="0" border="1"  width="1000" align="left">
		<tr>	
		
				<th  height="40" width="600">제목</th>
				<th width="100">작성자</th>
				<th width="150">작성날짜</th>
				<th width="100">조회</th>
			</tr>
			
			<c:forEach var="boardList" items="${boardList}">
				<tr align="center">
			
					<td  height="40">
					<a href="board_Content.do?board_num=${boardList.board_num}&pageNum=${currentPage}">
						${boardList.category_name}${boardList.board_subject}</a></td>
					<td>${boardList.emp_name}</td>
					<td>${boardList.board_date}</td>
					<td>${boardList.board_readcount}</td>
								
				</tr>			
			 </c:forEach>	
			</table>
			
			<br />
		
		<table cellspacing="0" cellpadding="0" width="1000" align="center">
			<tr>
			<td colspan="4" align="right">
				<input  type="button" class="button" value="글등록" OnClick="window.location='board_WriteForm.do'">
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

		 </div>
      </div>
   </div>
	
	<jsp:include page="/layout/footer.jsp" />
</body>
</html>
 