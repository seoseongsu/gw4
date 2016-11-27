<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
<html>
<head>
<title>게시판</title>
<!-- 
<script>

function onDownload(board_num){
	
	var o = document.getElementByID("ifrm_filedown");
	o.src="download.do?board_num="+${boardList.board_num};
}


</script>
 -->
<script type="text/javascript">
	function reply(a){
		location.href="replyInsert.do?reply_text="+a
		return;
	}
</script>

</head>

<body >  
<center><b>공지 사항</b>
<br>
	<form method="post" action="replyInsert.do" name="Board_reply">
<input type="hidden" name="board_num" value="${boardList.board_num}">
<!-- <iframe id="ifrm_filedown" style="position:absolute; z-index:1; visivility : hidden;"></iframe>  -->
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
  	<td align="center" width="125" >첨부파일</td>
  	<td><a href="#" onclick="onDownload('${boardList.board_num}')">${boardList.board_file_orgname}</a></td>
  	</tr>
  <tr>	
    <td align="center" width="125" >글내용</td>
    <td align="left" width="375" rows="30" colspan="3"><pre>${boardList.board_content}</pre></td>
  </tr>
 
 
 
 	<!-- ---------------------------------댓글--------------------------------------- -->
 
 	<table width="800"   align="center">
  	<tr>
  	<input type="hidden" name="pageNum" value="${pageNum}">
  	<td>
  	<c:forEach items="${replyList}"  var="replyView">

  			
  			<tr>
  			<td align="center" width="125"  > 작성자 </td>
  			<td align="left" width="569"  >${replyView.reply_text}
  			</td>
  			<td>
  			<input type="button" value="수정"
  			onclick="document.location.href='reply_DeletePro.do?reply_num=${reply_num}'">
  			
  			<input type="button" value="삭제"  
  			onclick="document.location.href='reply_DeletePro.do'">
  			<input type="text" name="reply_num" value="${replyView.reply_num}">
  			</td>
  			</tr>	
  	</c:forEach>
  	</td>
  	</tr>
  	<tr>
  	<td colspan="4" align="center">
  		<c:forEach  items="${reply}" var="board_reply">
  		</c:forEach>
  		<br/>
  		<textarea rows ="1" cols="80" name="reply_text"
  		placeholder="댓글을 작성하세요"></textarea>
  		<input type="submit" value="댓글 등록">
	 </td>
  	</tr>
 </table>
 </form>
  	<!-- ---------------------------------댓글--------------------------------------- -->	
  
  
  <tr height="30">      
    <td colspan="4" align="right" > 
	  <input type="button" value="글수정" 
       onclick="document.location.href='board_ModifyForm.do?board_num=${boardList.board_num}&pageNum=${pageNum}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="글삭제" 
       onclick="document.location.href='board_DeleteForm.do?board_num=${boardList.board_num}&pageNum=${pageNum}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록" 
       onclick="document.location.href='board_List.do'">
    </td>
  </tr>
</table>    

<table width="800"  align="center">
	

</table>

</form>      
</body>
</html>      