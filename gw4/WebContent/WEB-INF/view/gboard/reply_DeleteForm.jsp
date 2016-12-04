<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<c:if test="${empVo.emp_code != reply_emp && memId != 'admin' }">
		<script type="text/javascript">
			alert("삭제 하실 수 없습니다.");
			location.href='board_Content.do?board_num=${board_num}&pageNum=${pageNum}';
		</script>
	</c:if>
 
<title>게시판</title>

<form method="post" name="replyDelete"  action="reply_DeletePro.do?reply_num=${reply_num}&board_num=${board_num}&pageNum=${pageNum}">
<center><b>댓글 수정</b>
 <table border="1" align="center" cellspacing="0" cellpadding="0" width="500">
  <tr height="30">
     <td align=center  >
       <b>댓글을 삭제 하시 겠습니까?</b></td>
  </tr>
 <tr height="30">
    <td align=center >
      <input type="submit" value="삭제" >
      <input type="button" value="취소" 
       onclick="javascript:history.go(-1)">
	
	</td>
	</tr>
	
	
<table >
</head>
