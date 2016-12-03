<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Hard Ware 삭제</title>
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
               <a href="/gw4/emp/empList.do">사원관리<i class="fa fa-chevron-right"></i></a>   
               <a href="/gw4/salary/salaryList.do">급여관리<i class="fa fa-chevron-right"></i></a>         
               <a href="/gw4/fund/fundList.do">회계장부<i class="fa fa-chevron-right"></i></a>
               <a href="/gw4/commute/comList.do">근태관리<i class="fa fa-chevron-right"></i></a>         
               <a class="active" href="/gw4/product_List.do">H/W관리<i class="fa fa-chevron-right"></i></a>          
               <a href="/gw4/productSoft_List.do">S/W관리<i class="fa fa-chevron-right"></i></a>         
            </ul>
         </div>
         <div id="right_wrapper">
            <div id="right_path">
               <h5><i class="fa fa-home"></i>&nbsp; > 인사관리 > H/W관리</h5>
            </div>
            
            <div id="right_header">
               <h1>H/W 관리</h1>
            </div><br><br>


<form method="post" name="delForm"  action="product_DeletePro.do?product_num=${productList.product_num}" >
 <table border="1" align="center" cellspacing="0" cellpadding="0" width="500">
  <tr height="30">
     <td align=center  >
       <b>${productList.product_name}를 삭제 하시 겠습니까?</b></td>
  </tr>
 <tr height="30">
    <td align=center >
      <input type="submit" value="삭제" >
      <input type="button" value="취소" 
       onclick="document.location.href='product_List.do'">     
   </td>
 </tr>  
</table> 
</form>




        </div>
      </div>
   </div>
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html> 