<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<b><center>글 수정</b>
 <br />	
     <c:if test="${memId == null }">
		<script type="text/javascript">
			alert("로그인을 먼저 해주세요. 로그인창으로 이동합니다.");
			location.href='/gw4/main/login.do';
		</script>
	</c:if>
	
	<c:if test="${empVo.emp_code != board_emp && memId != 'admin' }">
		<script type="text/javascript">
			alert("수정 하실 수 없습니다.");
			location.href='board_Content.do?board_num=${board_num}&pageNum=${pageNum}';
		</script>
	</c:if>
 
 
 
 
<script src="/gw4/ckeditor/ckeditor.js"></script>
<script language="javascript">

function categorycheck(c)
{
	if(c=='C001'){
		document.ModifyForm.category_name.value='[공지사항]';		
		'brake';
	}	
	
	else if (c=='C002'){
		document.ModifyForm.category_name.value='[자유게시판]';		
		'brake';
	}
	else if (c=='C003'){
		document.ModifyForm.category_name.value='[파일함]';		
		'brake';
	}
}

</script>

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


	
<br>


<!-- <input type="text" name="board_readcount"> -->


 <form method="post" name="ModifyForm" action="board_ModifyPro.do?pageNum=${pageNum}" onsubmit="return writeSave()">
<input type="hidden" name="board_num" value="${board_num}">
<table id="border_table"  border="1" width="900" align="left" cellspacing="0" cellpadding="0">
	<tr>
		<th width ="100">카테고리</th>
		<td>
		<select id ="category" style="border: 1px solid;" name="category_code"  onchange="categorycheck(this.value)">
			<option value="vacuum" >----------</option>
			<c:forEach items="${categoryList}" var="category">
				<option value="${category.category_code}">${category.category_name}</option>		
			</c:forEach>
		</select>		
	</tr>
	
	<tr>
		<th width="100">제목</th>
		<td width="600">
			<input type="text" width="600" style="border: 1px solid;" name="board_subject" value="${boardList.board_subject}" >
			<input type="hidden" name="category_name">
		</td>
	</tr>
	
	
	<tr>
		<th width="100">작성자</th>
		<td width="600"><input tpye=text style="border: 1px solid;" name="emp_name" readonly="readonly" value="${boardList.emp_name}"></td>
	</tr>
	
	<tr>
		<th width="100">글 내용</th>
		<td><textarea rows="13" cols="101"  style="border: 1px solid;" name="board_content" >"${boardList.board_content}"</textarea></td>
	</tr>
	
		<tr>
		<th width="100">비밀번호</th>
		<td><input type="password" size="8" style="border: 1px solid;" maxlength="12" name="board_passwd" ></td>
	</tr>
		<tr>
		<th width="100"></th>
		<td>
		</td>
	</tr>
	
	<tr>
	   <td colspan=2 align="center" align="center" style="text-align:right;border-right: hidden; border-bottom: hidden; border-left: hidden;"> 
     <input type="submit" class="button"  value="글수정" >  
     <input type="reset" class="button" value="다시작성">
     <input type="button" class="button" value="목록보기" 
       onclick="document.location.href='board_List.do?pageNum=${pageNum}'">
   </td>
 </tr>
 </table>

<script type="text/javascript">
var editor = CKEDITOR.replace('board_content');
</script>  


	     </div>
      </div>
   </div>
	
	<jsp:include page="/layout/footer.jsp" />
</form>
</body>
</html>      
