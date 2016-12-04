<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>급여관리</title>
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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="#" />
<link rel="stylesheet" type="text/css" href="/gw4/css/flexslider.css">
<link rel="stylesheet" type="text/css" href="/gw4/css/style.css">
<script type="text/javascript" src="/gw4/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="/gw4/calendar/calendar.js"></script>
<script language="javaScript">
function checkIt(){
	var days = eval("document.salaryDays");
	var str = days.salary_days.value;
	var salary_days = str.charAt(str.length - 1);
	if(!days.salary_days.value){
		alert("처음 조회날짜를 정해주세요");
		return false;
	}else if(!days.salary_day.value){
		alert("마지막 조회날짜를 정해주세요");
		return false;
	}
}
</script>

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
                  인사관리
               </h2>
            </div>
            
            <ul>
               <a href="/gw4/emp/empList.do">사원관리<i class="fa fa-chevron-right"></i></a>   
               <a class="active" href="/gw4/salary/salaryList.do">급여관리<i class="fa fa-chevron-right"></i></a>         
               <a href="/gw4/fund/fundList.do">회계장부<i class="fa fa-chevron-right"></i></a>
               <a href="/gw4/commute/comList.do">근태관리<i class="fa fa-chevron-right"></i></a>         
               <a href="/gw4/product_List.do">H/W관리<i class="fa fa-chevron-right"></i></a>          
               <a href="/gw4/productSoft_List.do">S/W관리<i class="fa fa-chevron-right"></i></a>         
            </ul>
         </div>
         <div id="right_wrapper">
            <div id="right_path">
               <h5><i class="fa fa-home"></i>&nbsp; > 인사관리 > 급여관리</h5>
            </div>
            
            <div id="right_header">
               <h1>급여 관리</h1>
            </div><br><br>
	
	<c:if test="${memId == null }">
		<script type="text/javascript">
			alert("로그인을 먼저 해주세요. 로그인창으로 이동합니다.");
			location.href='/gw4/main/login.do';
		</script>
	</c:if>
	
	<c:if test="${empVo.dept_name != '운영부' && empVo.dept_name != '총무팀' && empVo.dept_name != '대표이사' && memId != 'admin'}">
		<script type="text/javascript">
			alert("해당부서만 이용가능합니다. 메인으로 이동합니다.");
			location.href='/gw4/main/main.do';
		</script>
	</c:if>
		
	<c:if test="${empVo.dept_name == '운영부' || empVo.dept_name == '총무팀' || empVo.dept_name == '대표이사' || memId == 'admin'}">
	<table width="110">
		<tr>
			<td align="center">급여조회</td>
		</tr>
	</table>
	<table id="border_table" border="1" align="left" >
		<form method="get" action="salaryDays.do" name="salaryDays" onSubmit="return checkIt()">
			<tr><input type="text" style="border: 1px solid;" id="salary_days" name="salary_days" onclick="fnPopUpCalendar(salary_days,salary_days,'yyyy - mm - dd')"> 일정별 조회<input type="text" style="border: 1px solid;" id="salary_day" name="salary_day" onclick="fnPopUpCalendar(salary_day,salary_day,'yyyy - mm - dd')"></tr>
			<tr><input type="submit" class="button" value="조회하기"></tr>
		</form>
	</table>
	<span style="float:right"><input type="button" class="button" value="급여등록" onclick="window.open('/gw4/salary/salaryAdd.do','_self')"></span>
	<table id="border_table" border="1" align="left" width="100%">
	<form>
		<tr>
			<th align="center" style="width: 30px;">등록일자</th>
			<th align="center">부서명</th>
			<th align="center">직급명</th>
			<th align="center">사원명</th>
			<th align="center">기본급</th>
			<th align="center" style="width: 30px;">상여금</th>
			<th align="center">지급액</th>
			<th align="center">국민연금</th>
			<th align="center">건강보험</th>
			<th align="center" >요양보험</th>
			<th align="center">고용보험</th>
			<th align="center">소득세</th>
			<th align="center" style="width: 30px;">주민세</th>
			<th align="center">공제액</th>
			<th align="center">실지급액</th>
			<th align="center">은행</th>
			<th align="center">계좌번호</th>
			<th align="center">비고</th>
		</tr>
		<c:forEach var="salary" items="${salaryList }">
		<tr>
			
			<c:set var="pay" value="${salary.salary_normal+salary.salary_bonus }"/>
			<c:set var="pension" value="${pay*0.045}"/>
			<c:set var="health" value="${pay*0.03}"/>
			<c:set var="nursing" value="${pay*0.05 }"/>
			<c:set var="employ" value="${pay*0.05}"/>
			<c:set var="income" value="${pay*0.004 }"/>
			<c:set var="resident" value="${income*0.01 }"/>
			<c:set var="deduction" value="${pension+health+nursing+employ+income+resident }"/>
			<c:set var="acpay" value="${pay-deduction }"/>
			<c:set var="acpa" value="${acpa + acpay }"/>
			<c:set var="dedu" value="${dedu + deduction  }"/>
			<td align="center">${salary.salary_days }</td>
			<td align="center">${salary.dept_name}</td>
			<td align="center">${salary.po_name}</td>
			<td align="center">${salary.emp_name}</td>
			<td align="center"><fmt:formatNumber value="${salary.salary_normal }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${salary.salary_bonus }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${pay }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${pension }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${health }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${nursing }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${employ }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${income }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${resident }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${deduction }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${acpay }" type="number" maxFractionDigits="0"/></td>
			<td align="center">${salary.emp_bank }</td>
			<td align="center">${salary.emp_acnum }</td>
			<td align="center">
			<input type="button" class="buttonS" value="수정" onclick="document.location.href='salaryUpdate.do?salary_code=${salary.salary_code}&emp_code=${salary.emp_code}'"/>
			<input type="button" class="buttonS" value="삭제" onclick="document.location.href='salaryDeletePro.do?salary_code=${salary.salary_code}&emp_code=${salary.emp_code}'" />
			</td>
		</tr>
		</c:forEach>
		
		<tr>
			<td colspan="13" align="center">공제합계 및 실지급액 합계</td>
			<td align="center"><fmt:formatNumber value="${dedu }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${acpa }" type="number" maxFractionDigits="0"/></td>
		</tr>

	</form>
	</table>
	</c:if>
		</div>
      </div>
   </div>
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html>