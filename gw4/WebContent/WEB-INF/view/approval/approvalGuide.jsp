<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>기안서작성</title>
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
               <a class="active" href="/gw4/approval/approvalGuide.do">기안서작성<i class="fa fa-chevron-right"></i></a>   
               <a href="/gw4/approval/approvalUp.do">올린결재<i class="fa fa-chevron-right"></i></a>         
               <a href="/gw4/approval/approvalSend.do">받은결재<i class="fa fa-chevron-right"></i></a>
               <a href="#">양식관리<i class="fa fa-chevron-right"></i></a>         
            </ul>
         </div>
         <div id="right_wrapper">
            <div id="right_path">
               <h5><i class="fa fa-home"></i>&nbsp; > 전자결재 > 기안서작성</h5>
            </div>
            
            <div id="right_header">
               <h1>기안서작성</h1>
            </div><br><br>



	
	<table id="border_table" border="1" width="50%" align="left">
		<form>
			<tr>
				<th align="center">결재양식명</th>
				<th align="center">해당결재작성</th>
			</tr>
			<tr>
				<td align="center">회식신청서</td>
				<td align="center"><input type="button" class="button" value="기안서작성" onclick="javascript:window.open('approvalDining.do','new','left=50, top=50, width=700, height=500')"/></td>
			</tr>
			<tr>
				<td align="center">휴가신청서</td>
				<td align="center"><input type="button" class="button" value="기안서작성" onclick="location='approvalGuide.do'"/></td>
			</tr>
		</form>
	</table>
	
	
	
	
		</div>
      </div>
   </div>
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html>