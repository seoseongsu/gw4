<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>게시판</title>
<link rel="stylesheet" type="text/css" href="/gw4/css/flexslider.css">
<link rel="stylesheet" type="text/css" href="/gw4/css/style.css">
<script type="text/javascript" src="/gw4/js/jquery.flexslider.js"></script>
<script src="/gw4/ckeditor/ckeditor.js"></script>

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
            </div>
     


<b><center>글 작성</b><br />
<form method="post" name="writeform" action="board_WritePro.do" enctype="multipart/form-data" > 
<input type="hidden" name="board_num" value="${board_num}">
<!-- <input type="text" name="board_readcount"> -->

<table width="900" border ="1" align="center" cellspacing="0" cellpadding="0">
	<tr>
		<th width ="100">카테고리</th>
		<td>
		<select id ="category" name="category_code"  >
			<option>--------------</option>
			<c:forEach items="${categoryList}" var="category">
				<option value="${category.category_code}">${category.category_code}</option>		
			</c:forEach>
		</select>		
	</tr>
	
	<tr>
		<th width="100">제목</th>
		<td width="600">
			<input type="text" width="600" name="board_subject" >
		</td>
	</tr>
	
	
	<tr>
		<th width="100">작성자</th>
		<td width="600">
	</tr>
	
	<tr>
		<th width="100">파일 첨부</th>
		<td width="600" >
		<input type="file" name="file">
		<input type="hidden" name="board_file_orgname" value="${board_file_orgname}">
		<input type="hidden" name="board_file_savname" value="${board_file_savname}">
		
		 </td>
	<tr>
		<th width="100">글 내용</th>
		<td><textarea rows="13" cols="101"  name="board_content" ></textarea></td>
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
	<td colspan="2" align="center"> 
	  	<input type="submit" value="글쓰기" >  
	  	<input type="reset" value="다시작성">
	 	<input type="button" value="목록보기" OnClick="window.location='board_List.do'">
	</tr>
	</table>

<script type="text/javascript">
var editor = CKEDITOR.replace('board_content');
</script>
	</form>
	
	
		</div>
      </div>
   </div>
	
	<jsp:include page="/layout/footer.jsp" />
</body>
</html>