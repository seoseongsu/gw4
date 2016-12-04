<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>기안서작성</title>
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



	<table width="110">
		<tr>
			<td align="center">기안서작성</td>
		</tr>
	</table>
	
	<table border="1" width="50%" align="center">
		<form>
			<tr>
				<td align="center">결재양식명</td>
				<td align="center">해당결재작성</td>
			</tr>
			<tr>
				<td align="center">회식신청서</td>
				<td align="center"><input type="button" value="기안서작성" onclick="location='approvalDining.do'"/></td>
			</tr>
			<tr>
				<td align="center">휴가신청서</td>
				<td align="center"><input type="button" value="기안서작성" onclick="location='approvalGuide.do'"/></td>
			</tr>
		</form>
	</table>
	
	
	
	
		</div>
      </div>
   </div>
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html>