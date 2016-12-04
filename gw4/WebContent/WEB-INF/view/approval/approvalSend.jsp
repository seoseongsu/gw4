<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>받은결재</title>
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
	text-align:center;
	vertical-align:middle;
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
<jsp:include page="/layout/header.jsp" />  

   <div id="sub_wrapper">
      <div id="sub_con_wrapper">
         <div id="left_wrapper">
            <div id="left_title">
               <span>
                  고객과의 신뢰를<br>최고로 여기는 기업
               </span>
               <h2>
                  전자결재
               </h2>
            </div>
            
            <ul>
               <a href="/gw4/approval/approvalGuide.do">기안서작성<i class="fa fa-chevron-right"></i></a>   
               <a href="/gw4/approval/approvalUp.do">올린결재<i class="fa fa-chevron-right"></i></a>         
               <a class="active" href="/gw4/approval/approvalSend.do">받은결재<i class="fa fa-chevron-right"></i></a>
                </ul>
         </div>
         <div id="right_wrapper">
            <div id="right_path">
               <h5><i class="fa fa-home"></i>&nbsp; > 전자결재 > 받은결재</h5>
            </div>
            
            <div id="right_header">
               <h1>받은 결재</h1>
            </div><br><br>


	<c:if test="${memId == null }">
		<script type="text/javascript">
			alert("로그인을 먼저 해주세요. 로그인창으로 이동합니다.");
			location.href='/gw4/main/login.do';
		</script>
	</c:if>
	
	<c:if test="${empVo.dept_name != '대표이사' && memId != 'admin' }">
		<script type="text/javascript">
			alert("대표이사 전용페이지입니다. 메인으로 이동합니다.");
			location.href='/gw4/main/main.do';
		</script>
	</c:if>
	
	<c:if test="${empVo.dept_name == '대표이사' || memId == 'admin' }">
	<table id="border_table" border="1" width="60%" align="left">
		<form method="get" action="approvalSucces.do" name="approvalSucces">
			<tr>
				<th align="center" width="50">기안자</th>
				<th align="center" width="50">상신일자</th>
				<th align="center" width="50">제목</th>
				<th align="center" width="50">비고</th>
			</tr>
			<c:forEach var="approval" items="${approvalList }">
				<tr>
					<td align="center" width="50">${approval.emp_name }</td>
					<td align="center" width="50">${approval.approval_day }</td>
					<td align="center" width="50"><a href="approvalDiningContent.do?approval_code=${approval.approval_code }">${approval.approval_title }</a></td>
					<td align="center" width="50">
					<input type="button" class="button" value="결재반려" onclick=""/>
					<input type="submit" class="button" value="결재완료" />
			</c:forEach>
		</form>
	</table>
	</c:if>
	
	
		</div>
      </div>
   </div>
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html>