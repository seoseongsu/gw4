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
<jsp:include page="/layout/header.jsp" />  

   <div id="sub_wrapper">
      <div id="sub_con_wrapper">
         <div id="left_wrapper">
            <div id="left_title">
               <span>
                  고객과의 신뢰를<br>최고로 여기는 기업
               </span>
               <h2>
                  인사관리
               </h2>
            </div>
            
            <ul>
               <a href="/gw4/emp/empList.do">사원관리<i class="fa fa-chevron-right"></i></a>   
               <a href="/gw4/salary/salaryList.do">급여관리<i class="fa fa-chevron-right"></i></a>         
               <a href="/gw4/fund/fundList.do">회계장부<i class="fa fa-chevron-right"></i></a>
               <a href="/gw4/commute/comList.do">근태관리<i class="fa fa-chevron-right"></i></a>         
               <a href="/gw4/product_List.do">H/W관리<i class="fa fa-chevron-right"></i></a>          
               <a class="active" href="/gw4/productSoft_List.do">S/W관리<i class="fa fa-chevron-right"></i></a>         
            </ul>
         </div>
         <div id="right_wrapper">
            <div id="right_path">
               <h5><i class="fa fa-home"></i>&nbsp; > 인사관리 > S/W관리</h5>
            </div>
            
            <div id="right_header">
               <h1>S/W 관리</h1>
            </div><br><br>
            
            <c:if test="${memId == null }">
		<script type="text/javascript">
			alert("로그인을 먼저 해주세요. 로그인창으로 이동합니다.");
			location.href='/gw4/main/login.do';
		</script>
	</c:if>
	
	<c:if test="${empVo.dept_name != '시설팀' && empVo.dept_name != '대표이사' && empVo.dept_name != '운영부' && memId != 'admin' }">
		<script type="text/javascript">
			alert("해당부서만 이용가능합니다. 메인으로 이동합니다.");
			location.href='/gw4/main/main.do';
		</script>
	</c:if>
	
	<c:if test="${empVo.dept_name == '시설팀' || empVo.dept_name == '대표이사' || empVo.dept_name == '운영부' || memId == 'admin' }">
    


<table align="center" cellspacing="0" cellpadding="0"  width="1200" border="1">
				<tr>
					<th width="100">분류</th>
					<th width="250">물품(코드)번호</th>
					<th width="250">물품명</th>
					<th width="150">재고</th>
					<th width="100">총수량</th>

					<th></th>
					
				</tr>
	<c:forEach var="productSoftList" items="${productSoftList}">
				<tr align="center">
					<td>${productSoftList.product_type}</td>
					<td>${productSoftList.sw_product_code}</td>
					<td>${productSoftList.product_name}</td>
					<td>${productSoftList.product_in}</td>
					<td>${productSoftList.product_quantity}</td>
				
					<td style="width:8%">
					<input type="button" value="수정" 
						onclick="javascript:window.open('productSoft_Modify.do?product_num=${productSoftList.product_num}','new','left=50, top=50, width=1000, height=500')">
					<input type="button" value="삭제"
						 onclick="document.location.href='productSoft_Delete.do?product_num=${productSoftList.product_num}'">
					</td>						

				</tr>			
			 </c:forEach>		 
	</table>

	
	<br />
<table align="center"  width="1200" >
<tr>
<td align="right" colspan="5">
<input type="button" value="물품 등록"	 onclick="javascript:window.open('productSoft_Insert.do','new','left=50, top=50, width=1000, height=500')"></td>
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


</c:if>

        </div>
      </div>
   </div>
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html>