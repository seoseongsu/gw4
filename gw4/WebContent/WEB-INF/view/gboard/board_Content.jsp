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
            </div><br><br>
     


<br>
	<form method="post" action="replyInsert.do?board_num=${boardList.board_num}&pageNum=${pageNum}" name="Board_reply">
	

	<table id="border_table"  border="1" width="800" cellspacing="0" cellpadding="0" align="left">  
	  <tr>
	    <th style="width:100px;" align="center">조회수</th>
	    <td align="center" style="width:450px;">${boardList.board_readcount}</td>
	     <th align="center" >작성일</th>
	    <td align="center">${boardList.board_date}</td>
	  </tr>
	  <tr height="30" >
	    <th align="center">작성자</th>
	    <td align="left" width="375" align="center" colspan="3">${boardList.emp_name}</td>
	  </tr>
	  <tr height="30">
	    <th align="center">글제목</th>
	    <td align="left" width="375" colspan="3">${boardList.board_subject}</td>
	  </tr>
	   <tr>
	  	<th align="center">첨부파일</th>
	  	<td colspan="3"><a href="#" onclick="onDownload('${boardList.board_num}')">${boardList.board_file_orgname}</a></td>
	  	</tr>
	  <tr>	
	    <th align="center" >글내용</th>
	    <td align="left" width="375" rows="30" colspan="3"><pre>${boardList.board_content}</pre></td>
	  </tr>
	
	<tr>
		<td style="border-left:hidden; border-right: hidden;">&nbsp;</td>
	</tr>
	 
	 
	 	<!-- ---------------------------------댓글--------------------------------------- -->
	 
	  	<c:forEach items="${replyList}"  var="replyView">
		
	  			
	  			<tr>
	  			<td align="center"> ${replyView.emp_name} </td>
	  			<td colspan="2" align="left" width="500"  >${replyView.reply_text}
	
	  			<input type="text" id="replytext" style="display:none;">  			
	  			
	  			</td>
	  			<td style="width:100; text-align:right;  border-left: hidden;">
	  			<input type="button" class="buttonS" value="수정" 
	  			onclick="javascript:window.open('reply_ModifyForm.do?reply_num=${replyView.reply_num}&board_num=${replyView.board_num}&pageNum=${pageNum}&emp_code=${replyView.emp_code}','new','left=50, top=50, width=900, height=220')">
	  		
	  			
	  			
	  			<input type="button" class="buttonS" value="삭제"  
	  			onclick="document.location.href='reply_DeleteForm.do?reply_num=${replyView.reply_num}&board_num=${replyView.board_num}&pageNum=${pageNum}&emp_code=${replyView.emp_code}'">
	  			</td>
	  			</tr>	
	  	</c:forEach>
	  	<tr>
	  	<td colspan="3" align="center">
	  		<c:forEach  items="${reply}" var="board_reply">
	  		</c:forEach>
	  		
	  		<input type="hidden" name="emp_code" value="${emp_code}">
	  		<input type="hidden" name="emp_name"value="${emp_name}">
	  		<textarea style="border: 1px solid;" rows ="2" cols="90" name="reply_text"
	  		placeholder="댓글을 작성하세요"></textarea>
	  	</td>
	  	<td style="text-align:right; border-bottom: hidden; border-left: hidden;">
	  		<input type="submit" class="buttonS" value="댓글 등록">
		 </td>
	  	</tr>
	
	  	<!-- ---------------------------------댓글--------------------------------------- -->	
	  

	  <tr height="30">      
	    <td colspan="4" align="right" style="text-align:right;border-right: hidden; border-bottom: hidden; border-left: hidden;"> 
		  <input type="button" class="button" value="글수정" 
	       onclick="document.location.href='board_ModifyForm.do?board_num=${boardList.board_num}&pageNum=${pageNum}&emp_code=${boardList.emp_code}'">
		   &nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="button" class="button" value="글삭제" 
	       onclick="document.location.href='board_DeleteForm.do?board_num=${boardList.board_num}&pageNum=${pageNum}&emp_code=${boardList.emp_code}'">
		   &nbsp;&nbsp;&nbsp;&nbsp;
	       <input type="button" class="button" value="글목록" 
	       onclick="document.location.href='board_List.do'">
	    </td>
	  </tr>
	</table>    
	 </form>
	     
	     
	     </div>
      </div>
   </div>
	
	<jsp:include page="/layout/footer.jsp" />
	</body>
	</html>      