<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Hard Ware 삭제</title>
<form method="post" name="delForm"  action="productSoft_DeletePro.do?product_num=${productSoftList.product_num}" >
 <table border="1" align="center" cellspacing="0" cellpadding="0" width="500">
  <tr height="30">
     <td align=center  >
       <b>${productSoftList.product_name}를 삭제 하시 겠습니까?</b></td>
  </tr>
 <tr height="30">
    <td align=center >
      <input type="submit" value="삭제" >
      <input type="button" value="취소" 
       onclick="document.location.href='productSoft_List.do'">     
   </td>
 </tr>  
</table> 
</form>
</body>
</html> 