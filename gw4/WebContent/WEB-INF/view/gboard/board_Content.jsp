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
<input type="hidden" name="board_num" value="${boardList.board_num}">
<table width="800" border="1" align="center">  
  <tr height="30">
    <td align="center" width="125">조회수</td>
    <td align="center" width="125" >${boardList.board_readcount}</td>
     <td align="center" width="125" >작성일</td>
    <td align="center" width="125" >${boardList.board_date}</td>
  </tr>
  <tr height="30" >
    <td align="center" width="125" >작성자</td>
    <td align="left" width="375" align="center" colspan="3">작성자</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" >글제목</td>
    <td align="left" width="375" colspan="3">${boardList.board_subject}</td>
  </tr>
  <tr>	
    <td align="center" width="125" >글내용</td>
    <td align="left" width="375" rows="30" colspan="3"><pre>${boardList.board_content}</pre></td>
  </tr>
  <tr>ㄴ
  	<td align="center" width="125" >첨부파일</td>
  	<td></td>
  	</tr>
  <tr height="30">      
    <td colspan="4" align="right" > 
	  <input type="button" value="글수정" 
       onclick="document.location.href='board_ModifyForm.do?board_num=${boardList.board_num}&pageNum=${pageNum}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="글삭제" 
       onclick="document.location.href='board_DeleteForm.do?board_num=${boardList.board_num}&pageNum=${pageNum}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록" 
       onclick="document.location.href='board_List.do?pageNum=${pageNum}'">
    </td>
  </tr>
</table>    
</form>      
</body>
</html>      