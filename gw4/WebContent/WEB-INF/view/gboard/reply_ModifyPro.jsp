<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>게시판</title>

<form>
<center><b>댓글 수정</b>
<table width="800"  align="center">
	<tr>
	<th  align="center" width="125">작성자</th> 
	<td align="left" width="500">작성자</td>	
	
	</tr>
	<tr>
	<th align="center" wwidth="125">내용</th>
	<td align="left" width="500">
	<input type="text" size ="50" name="reply_text" value="${replyList.reply_text}" >
	</td>
	</tr>
	<tr>
	<td align="center" colspan="2">
	<input type="submit" value="댓글 수정">
	<input type="button" value="취소" 
       onclick="javascript:history.go(-1)">
	
	</td>
	</tr>
	
	
<table >
</head>
