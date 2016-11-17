<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>게시판</title>
</head>
<body >  
	
<br>

 <form method="post" name="boarfd_Writeform" action="board_ModifyPro.do?pageNum=${pageNum}" onsubmit="return writeSave()">
	<table width="800" border="1" align="center">  
  
	  <tr height="30">
		    <td align="center" width="125" >글번호</td>
		    <td align="center" width="125" " align="center" name="board_num" >${boardList.board_num}</td>
		    <td align="center" width="125">조회수</td>
		    <td align="center" width="125" align="center" name="board_readcount">${boardList.board_readcount}</td>
	  </tr>
	  
	  <tr height="30">
		    <td align="center" width="125" >작성자</td>
		    <td align="center" width="125" align="center"></td>
		   
		    <td align="center" width="125" >작성일</td>
		    <td align="center" width="125" align="center" name="board_date">${boardList.board_date}</td>
	  </tr>
	  
	  <tr height="30">
		    <td align="center" width="125" >글제목</td>
		    <td align="center" width="375" align="center" colspan="3">
		    	<input type="text" size="40" maxlength="50" name="board_subject" value="${boardList.board_subject}"></td>
	  </tr>
	  
	  <tr>	
		    <td align="center" width="125" >글내용</td>
		    <td align="left" width="375" rows="30" colspan="3"><pre>
		      	<textarea name="board_content" rows="13" cols="40" value="${boardList.board_content}" ></textarea></pre></td>
	  </tr>
	  
	   <tr>
		    <td  width="70" >비밀번호</td>
		    <td align="left" width="330" >
	    		<input type="password" size="8" maxlength="12" name="board_passwd">
			</td>
	  </tr>
	  
  
   <td colspan=2 align="center"> 
     <input type="submit" value="글수정" >  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="document.location.href='board_List.do?pageNum=${pageNum}'">
   </td>
 </tr>
 </table>
</form>
</body>
</html>      
