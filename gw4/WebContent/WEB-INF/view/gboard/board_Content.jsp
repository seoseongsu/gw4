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




<!--
<script>

function onDownload(board_num){
	
	var o = document.getElementByID("ifrm_filedown");
	o.src="download.do?board_num="+${boardList.board_num};
}


</script>
 -->
<script>
function show(a){
	replytext.style.display="inline"
}
</script>


</head>

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
            </div>
     


<center><b>공지 사항</b>
<br>
	<form method="post" action="replyInsert.do?board_num=${boardList.board_num}&pageNum=${pageNum}" name="Board_reply">
	

	<table width="800" cellspacing="0" cellpadding="0" border="1" align="center">  
	  <tr height="30">
	    <td align="center" width="125">조회수</td>
	    <td align="center" width="125" >${boardList.board_readcount}</td>
	     <td align="center" width="125" >작성일</td>
	    <td align="center" width="125" >${boardList.board_date}</td>
	  </tr>
	  <tr height="30" >
	    <td align="center" width="125" >작성자</td>
	    <td align="left" width="375" align="center" colspan="3">${boardList.emp_name}</td>
	  </tr>
	  <tr height="30">
	    <td align="center" width="125" >글제목</td>
	    <td align="left" width="375" colspan="3">${boardList.board_subject}</td>
	  </tr>
	   <tr>
	  	<td align="center" width="125" >첨부파일</td>
	  	<td colspan="3"><a href="#" onclick="onDownload('${boardList.board_num}')">${boardList.board_file_orgname}</a></td>
	  	</tr>
	  <tr>	
	    <td align="center" width="125" >글내용</td>
	    <td align="left" width="375" rows="30" colspan="3"><pre>${boardList.board_content}</pre></td>
	  </tr>
	 
	 
	 
	 	<!-- ---------------------------------댓글--------------------------------------- -->
	 
	 	<table width="800"  align="center" >
	  	<c:forEach items="${replyList}"  var="replyView">
		
	  			
	  			<tr>
	  			<td align="center" width="125"  > ${replyView.emp_name} </td>
	  			<td align="left" width="500"  >${replyView.reply_text}
	
	  			<input type="text" id="replytext" style="display:none;">  			
	  			
	  			</td>
	  			<td style="width:100" align="right">
	  			<input type="button" value="수정" 
	  			onclick="document.location.href='reply_ModifyForm.do?reply_num=${replyView.reply_num}&board_num=${replyView.board_num}&pageNum=${pageNum}&emp_code=${replyView.emp_code}'">
	  		
	  			
	  			
	  			<input type="button" value="삭제"  
	  			onclick="document.location.href='reply_DeleteForm.do?reply_num=${replyView.reply_num}&board_num=${replyView.board_num}&pageNum=${pageNum}&emp_code=${replyView.emp_code}'">
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
	  		
	  		<input type="hidden" name="emp_code" value="${emp_code}">
	  		<input type="hidden" name="emp_name"value="${emp_name}">
	  		<textarea rows ="2" cols="80" name="reply_text"
	  		placeholder="댓글을 작성하세요"></textarea>
	  		<input type="submit" value="댓글 등록">
		 </td>
	  	</tr>
	 </table>
	
	  	<!-- ---------------------------------댓글--------------------------------------- -->	
	  
	  
	  <tr height="30">      
	    <td colspan="4" align="right" > 
		  <input type="button" value="글수정" 
	       onclick="document.location.href='board_ModifyForm.do?board_num=${boardList.board_num}&pageNum=${pageNum}&emp_code=${boardList.emp_code}'">
		   &nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="button" value="글삭제" 
	       onclick="document.location.href='board_DeleteForm.do?board_num=${boardList.board_num}&pageNum=${pageNum}&emp_code=${boardList.emp_code}'">
		   &nbsp;&nbsp;&nbsp;&nbsp;
	       <input type="button" value="글목록" 
	       onclick="document.location.href='board_List.do'">
	    </td>
	  </tr>
	</table>    
	
	<table width="800"  align="center">
		
	
	</table>
	 </form>
	     
	     
	     </div>
      </div>
   </div>
	
	<jsp:include page="/layout/footer.jsp" />
	</body>
	</html>      