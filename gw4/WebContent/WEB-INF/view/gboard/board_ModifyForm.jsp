<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>게시판</title>
</head>
<script src="/gw4/ckeditor/ckeditor.js"></script>
<script language="javascript">

function categorycheck(c)
{
	if(c=='C001'){
		document.ModifyForm.board_subject.value='[공지사항]';		
		'brake';
	}	
	
	else if (c=='C002'){
		document.ModifyForm.board_subject.value='[자유게시판]';		
		'brake';
	}
	else if (c=='C003'){
		document.ModifyForm.board_subject.value='[파일함]';		
		'brake';
	}
}

</script>

<body >  
	
<br>

 <form method="post" name="ModifyForm" action="board_ModifyPro.do?pageNum=${pageNum}" onsubmit="return writeSave()">
<input type="hidden" name="board_num" value="${num}">
<!-- <input type="text" name="board_readcount"> -->

<table width="900" border ="1">
	<tr>
		<th width ="100">카테고리</th>
		<td>
		<select id ="category" name="category_code"  onchange="categorycheck(this.value)">
			<option value="vacuum" >----------</option>
			<c:forEach items="${categoryList}" var="category">
				<option value="${category.category_code}">${category.category_name}</option>		
			</c:forEach>
		</select>		
	</tr>
	
	<tr>
		<th width="100">제목</th>
		<td width="600">
			<input type="text" width="600" name="board_subject" value="${boardList.board_subject}" >
		</td>
	</tr>
	
	
	<tr>
		<th width="100">작성자</th>
		<td width="600">
	</tr>
	
	<tr>
		<th width="100">글 내용</th>
		<td><textarea rows="13" cols="101"  name="board_content" >"${boardList.board_content}"</textarea></td>
	</tr>
	
		<tr>
		<th width="100">비밀번호</th>
		<td><input type="password" size="8" maxlength="12" name="board_passwd"></td>
	</tr>
		<tr>
		<th width="100"></th>
		<td>
		</td>
	</tr>
	
	<tr>
	   <td colspan=2 align="center"> 
     <input type="submit" value="글수정" >  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="document.location.href='board_List.do?pageNum=${pageNum}'">
   </td>
 </tr>
 </table>

<script type="text/javascript">
var editor = CKEDITOR.replace('board_content');
</script>  

</form>
</body>
</html>      
