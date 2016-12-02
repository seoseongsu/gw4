<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>자금관리</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="#" />
<link rel="stylesheet" type="text/css" href="/gw4/css/flexslider.css">
<link rel="stylesheet" type="text/css" href="/gw4/css/style.css">
<script type="text/javascript" src="/gw4/js/jquery.flexslider.js"></script>
<script language="javaScript">
function checkIt(){
	var days = eval("document.fundDays");
	var str = days.fund_days.value;
	var fund_days = str.charAt(str.length - 1);
	if(!days.fund_days.value){
		alert("처음 조회날짜를 정해주세요");
		return false;
	}else if(!days.fund_day.value){
		alert("마지막 조회날짜를 정해주세요");
		return false;
	}
}
</script>
<script>
$(function(){
	$("#fund_days").datepicker({
		dateFormat: 'yy - mm - dd',
		monthNamesShort: ['1월', '2월','3월', '4월','5월', '6월','7월', '8월','9월', '10월','11월', '12월'],
		dayNameMin: ['일','월','화','수','목','금','토'],
		changeMonth: true,	//월변경가능
		changeYear: true,	//일변경가능
		showMonthAfterYear: true	//년 뒤에 월표시
	});
});
$(function(){
	$("#fund_day").datepicker({
		dateFormat: 'yy - mm - dd',
		monthNamesShort: ['1월', '2월','3월', '4월','5월', '6월','7월', '8월','9월', '10월','11월', '12월'],
		dayNameMin: ['일','월','화','수','목','금','토'],
		changeMonth: true,	//월변경가능
		changeYear: true,	//일변경가능
		showMonthAfterYear: true	//년 뒤에 월표시
	});
});
</script>
<script>
function fundDelete(a){
	if(confirm("정말 삭제하시겠습니까??")==true){
		location.href="fundDeletePro.do?fund_code="+a
	}else{
		return;
	}
}
</script>


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
                  회사소개
               </h2>
            </div>
            
            <ul>
               <a href="/gw4/emp/empList.do">사원관리<i class="fa fa-chevron-right"></i></a>   
               <a href="/gw4/salary/salaryList.do">급여관리<i class="fa fa-chevron-right"></i></a>         
               <a class="active" href="/gw4/fund/fundList.do">회계장부<i class="fa fa-chevron-right"></i></a>
               <a href="/gw4/commute/comList.do">근태관리<i class="fa fa-chevron-right"></i></a>         
               <a href="/gw4/product_List.do">H/W관리<i class="fa fa-chevron-right"></i></a>          
               <a href="#">S/W관리<i class="fa fa-chevron-right"></i></a>         
            </ul>
         </div>
         <div id="right_wrapper">
            <div id="right_path">
               <h5><i class="fa fa-home"></i>&nbsp; > 인사관리 > 사원관리</h5>
            </div>
            
            <div id="right_header">
               <h1>사원 관리</h1>
            </div>


	<table width="110">
		<tr>
			<td align="center">자금수지 목록</td>
		</tr>
	</table>
	<table>
		<form method="get" action="fundDays.do" name="fundDays" onSubmit="return checkIt()">
			<tr><input type="text" id="fund_days" name="fund_days"> 일정별 조회<input type="text" id="fund_day" name="fund_day"></tr>
			<tr><input type="submit" value="조회하기"></tr>
		</form>
	</table>
		<span style="float:right"><input type="button"  value="자금등록" onclick="window.open('/spring/fund/fundAdd.do','_self')"></span>

	<table border="1" width="100%">
	<form>
		<tr>
			<td align="center" width="50">집행일</td>
			<td align="center" width="50">집행부서</td>
			<td align="center" width="50">집행직급</td>
			<td align="center" width="50">집행자</td>
			<td align="center" width="50">구분</td>
			<td align="center" width="80">자금항목</td>
			<td align="center" width="120">적요</td>
			<td align="center" width="50">거래처</td>
			<td align="center" width="50">입금액</td>
			<td align="center" width="50">출금액</td>
			<td align="center" width="50">잔액</td>
			<td align="center" width="50">비고</td>

		</tr>
			<c:forEach var="fund" items="${fundDays}">
			<tr>
				<c:set var="deposit" value="${deposit + fund.fund_deposit}"/>
				<c:set var="withdraw" value="${withdraw + fund.fund_withdraw}"/>
				<c:set var="balance" value="${deposit - withdraw }"/>
				<td align="center" width="50">${fund.fund_days}</td>
				<td align="center" width="50">${fund.dept_name }</td>
				<td align="center" width="50">${fund.po_name }</td>
				<td align="center" width="50">${fund.emp_name }</td>
				<td align="center" width="50">${fund.fund_division}</td>
				<td align="center" width="80">${fund.fund_item}</td>
				<td align="center" width="120">${fund.fund_briefs}</td>
				<td align="center" width="50">${fund.fund_account}</td>
				<td align="center" width="50"><fmt:formatNumber value="${fund.fund_deposit }" type="number"/></td>
				<td align="center" width="50"><fmt:formatNumber value="${fund.fund_withdraw }" type="number"/></td>
				<td align="center" width="50"><fmt:formatNumber value="${balance }" type="number"/></td>
				<td align="center" width="50">				
				<input type="button" value="수정" onclick="location='fundUpdate.do?fund_code=${fund.fund_code }'"/>
				<input type="button" value="삭제" onclick="fundDelete(${fund.fund_code})"/>
				</td>
			</tr>

			</c:forEach>

		<tr>
			<td colspan="5" align="center">합계</td>
			<td align="center" width="50"><fmt:formatNumber value="${deposit }" type="number"/></td>
			<td align="center" width="50"><fmt:formatNumber value="${withdraw }" type="number"/></td>
			<td align="center" width="50"><fmt:formatNumber value="${balance }" type="number"/></td>
			<td align="center" width="50"></td>
		</tr>
	</table>
		<input type="button" value="전체보기" onclick="window.open('/gw4/fund/fundList.do','_self')">
	</form>
	
	
	         </div>
      </div>
   </div>
	
	<jsp:include page="/layout/footer.jsp" />
</body>