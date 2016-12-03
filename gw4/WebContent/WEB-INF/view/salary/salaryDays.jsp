<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>급여관리</title>
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
<script>
function salaryDelete(a){
	if(confirm("정말 삭제하시겠습니까??")==true){
		location.href="salaryDeletePro.do?salary_code="+a
	}else{
		return;
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
               <h5><i class="fa fa-home"></i>&nbsp; > 인사관리 > 사원관리</h5>
            </div>
            
            <div id="right_header">
               <h1>급여 관리</h1>
            </div>


	<table width="110">
		<tr>
			<td align="center">급여조회</td>
		</tr>
	</table>
	<table>
		<form method="get" action="salaryDays.do" name="salaryDays" onSubmit="return checkIt()" >
			<tr><input type="text" id="salary_days" name="salary_days" onclick="fnPopUpCalendar(salary_days,salary_days,'yyyy - mm - dd')"> 일정별 조회<input type="text" id="salary_day" name="salary_day" onclick="fnPopUpCalendar(salary_day,salary_day,'yyyy - mm - dd')"></tr>
			<tr><input type="submit" value="조회하기"></tr>
		</form>
	</table>
	<span style="float:right"><input type="button" value="급여등록" onclick="window.open('/spring/salary/salaryAdd.do','_self')"></span>
	<table border="1" width="100%">
	<form>
		<tr>
			<td align="center">등록일자</td>
			<td align="center">부서명</td>
			<td align="center">직급명</td>
			<td align="center">사원명</td>
			<td align="center" >기본급</td>
			<td align="center">상여금</td>
			<td align="center">지급액</td>
			<td align="center">국민연금</td>
			<td align="center">건강보험</td>
			<td align="center" >요양보험</td>
			<td align="center">고용보험</td>
			<td align="center">소득세</td>
			<td align="center">주민세</td>
			<td align="center">공제액</td>
			<td align="center">실지급액</td>
			<td align="center">은행</td>
			<td align="center">계좌번호</td>
			<td align="center">비고</td>
		</tr>
		<c:forEach var="salary" items="${salaryDays }">
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
			<input type="button" value="수정" onclick="location='salaryUpdate.do?salary_code=${salary.salary_code }'"/>
			<input type="button" value="삭제" onclick="salaryDelete(${salary.salary_code})"/>
			</td>
		</tr>
		</c:forEach>
		
		<tr>
			<td colspan="13" align="center">공제합계 및 실지급액 합계</td>
			<td align="center"><fmt:formatNumber value="${dedu }" type="number" maxFractionDigits="0"/></td>
			<td align="center"><fmt:formatNumber value="${acpa }" type="number" maxFractionDigits="0"/></td>
		</tr>

	</form>
		<input type="button" value="전체보기" onclick="window.open('/gw4/salary/salaryList.do','_self')">
	</table>
	

		</div>
      </div>
   </div>
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html>