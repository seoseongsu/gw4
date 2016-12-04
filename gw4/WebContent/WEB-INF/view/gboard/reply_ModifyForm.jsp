<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<c:if test="${empVo.emp_code != reply_emp && memId != 'admin' }">
		<script type="text/javascript">
			alert("수정 하실 수 없습니다.");
			location.href='board_Content.do?board_num=${board_num}&pageNum=${pageNum}';
		</script>
	</c:if>
 
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
</head>
<body>

<form method="post" name="replyModify"  action="reply_ModifyPro.do?reply_num=${reply_num}&board_num=${board_num}&pageNum=${pageNum}">
<table id="border_table"  border="1" width="800" cellspacing="0" cellpadding="0" align="left">
	<tr>
	<th  align="center" width="125">작성자</th> 
	<td align="left" width="500">작성자</td>	
	<td align="center" width="125" >작성일</td>
	    <td align="center" width="125" >${boardList.board_date}</td>
	</tr>
	<tr>
	<th align="center" wwidth="125">내용</th>
	<td colspan="3" align="left" width="500">
	<input type="text" size ="50" name="reply_text" value="${replyList.reply_text}" >
	</td>
	</tr>
	<tr>
	<td align="center" colspan="4" style="text-align:right;border-right: hidden; border-bottom: hidden; border-left: hidden;">
	<input type="submit" class="button" value="댓글 수정" onclick="goSubmit()">
	<input type="button" class="button" value="취소" 
       onclick="javascript:self.close()">
	
	</td>
	</tr>
	
</table>
<script type="text/javascript">
function goSubmit() {
    window.opener.name = "parentPage"; // 부모창의 이름 설정
    document.replyModify.target = "parentPage"; // 타켓을 부모창으로 설정
    document.replyModify.action = "/gw4/reply_ModifyPro.do?reply_num=${reply_num}&board_num=${board_num}&pageNum=${pageNum}";
    document.replyModify.submit();
    self.close();
}
</script>
</body>
</html>
