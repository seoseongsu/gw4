<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>게시판</title>


<script language="JavaScript">      
<!--      
  function deleteSave(){	
	if(document.delForm.board_passwd.value==''){
	alert("비밀번호를 입력하십시요.");
	document.delForm.board_passwd.focus();
	return false;
 }
}    
// -->      
</script>
</head>
     <c:if test="${memId == null }">
		<script type="text/javascript">
			alert("로그인을 먼저 해주세요. 로그인창으로 이동합니다.");
			location.href='/gw4/main/login.do';
		</script>
	</c:if>
	
	<c:if test="${empVo.emp_code != board_emp && memId != 'admin' }">
		<script type="text/javascript">
			alert("삭제 하실 수 없습니다.");
			location.href='board_Content.do?board_num=${board_num}&pageNum=${pageNum}';
		</script>
	</c:if>

<body >
<center><b>글삭제</b>

<br>
<form method="post" name="delForm"  action="board_DeletePro.do?pageNum=${pageNum}" 
   onsubmit="return deleteSave()"> 
 <table border="1" cellspacing="0" cellpadding="0" align="center" cellspacing="0" cellpadding="0" width="360">
  <tr height="30">
     <td align=center  >
       <b>비밀번호를 입력해 주세요.</b></td>
  </tr>
  <tr height="30">
     <td align=center >비밀번호 :   
       <input type="password" name="board_passwd" size="8" maxlength="12">
	   <input type="hidden" name="board_num" value="${board_num}"></td>
 </tr>
 <tr height="30">
    <td align=center >
      <input type="submit" value="글삭제" >
      <input type="button" value="글목록" 
       onclick="document.location.href='board_List.do?pageNum=${pageNum}'">     
   </td>
 </tr>  
</table> 
</form>
</body>
</html> 