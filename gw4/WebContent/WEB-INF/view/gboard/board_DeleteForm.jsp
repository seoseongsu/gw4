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
	text-align:left;
	vertical-align:left;
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


<form method="post" name="delForm"  action="board_DeletePro.do?pageNum=${pageNum}" 
   onsubmit="return deleteSave()"> 
 <table id="border_table" align="left" cellspacing="0" cellpadding="0" width="360">
  <tr height="30">
     <th align=center  >
       <b>비밀번호를 입력해 주세요.</b></th>
  </tr>
  <tr height="30">
     <td align=center >비밀번호 :   
       <input type="password" style="border: 1px solid;" name="board_passwd" size="12" maxlength="12">
	   <input type="hidden" name="board_num" value="${board_num}"></td>
 </tr>
 <tr height="30">
    <td align=center style="text-align:right;border-right: hidden; border-bottom: hidden; border-left: hidden;">
      <input type="submit" class="button" value="글삭제" >
      <input type="button" class="button" value="글목록" 
       onclick="document.location.href='board_List.do?pageNum=${pageNum}'">     
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