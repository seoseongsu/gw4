<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<html>
<head>
<title>게시판</title>
</head>

<body >  
<center><b>공지 사항</b>
<br>
<form>
<table width="800" border="1" align="center">  
  <tr height="30">
    <td align="center" width="125" >글번호</td>
    <td align="center" width="125" align="center">${boa.board_num}</td>
    <td align="center" width="125">조회수</td>
    <td align="center" width="125" align="center">${article.board_readcount}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" >작성자</td>
    <td align="center" width="125" align="center"></td>
    <td align="center" width="125" >작성일</td>
    <td align="center" width="125" align="center">${article.baord_date}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" >글제목</td>
    <td align="center" width="375" align="center" colspan="3">${article.board_subject}</td>
  </tr>
  <tr>	
    <td align="center" width="125" >글내용</td>
    <td align="left" width="375" rows="30" colspan="3"><pre>${article.board_content}</pre></td>
  </tr>
  <tr height="30">      
    <td colspan="4" align="right" > 
	  <input type="button" value="글수정" 
       onclick="document.location.href='updateForm.do?num=${article.board_num}&pageNum=${pageNum}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="글삭제" 
       onclick="document.location.href='deleteForm.do?num=${article.board_num}&pageNum=${pageNum}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록" 
       onclick="document.location.href='list.do?pageNum=${pageNum}'">
    </td>
  </tr>
</table>    
</form>      
</body>
</html>      