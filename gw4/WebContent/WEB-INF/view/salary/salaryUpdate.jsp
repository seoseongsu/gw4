<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>급여정보수정</title>
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
		var salaryinput = eval("document.salaryinput");
		var str = salaryinput.salary_days.value;
		var salary = str.charAt(str.length - 1);
		if(!salaryinput.salary_days.value){
			alert("등록일자를 입력하세요");
			return false;
		}if(!salaryinput.salary_normal.value){
			alert("기본급을 입력하세요");
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


<table id="border_table" border="1" align="left">
	<form method="get" action="salaryUpdatePro.do" name="salaryinput" onSubmit="return checkIt()">
		<input type="hidden" name="salary_code" value="${salaryJoinVo.salary_code }"/>
		<tr>
			<th>등록일자</th>
			<th>부서명</th>
			<th>직급명</th>
			<th>사원이름</th>
			<th>기본급</th>
			<th>상여금</th>
			</tr>
			
			<tr>
				<td>
					<input type="text" style="border: 1px solid;" id="salary_days" name="salary_days" value="${salaryJoinVo.salary_days }" onclick="fnPopUpCalendar(salary_days,salary_days,'yyyy - mm - dd')">
				</td>
				<td>
					${salaryJoinVo.dept_name }
				</td>
				<td>
					${salaryJoinVo.po_name }
				</td>
				<td>
					${salaryJoinVo.emp_name }
				</td>
	  		   <td>
	 		   <input type="text" style="border: 1px solid;" id="salary_normal" name="salary_normal" value="${salaryJoinVo.salary_normal }"/>
			   </td>
			   <td>
			   <input type="text" style="border: 1px solid;" id="salary_bonus" name="salary_bonus" value="${salaryJoinVo.salary_bonus }"/>
			   </td>
			</tr>
		
			<tr>
				<td colspan="6" style="text-align:right;border-right: hidden; border-bottom: hidden; border-left: hidden;">
					<span style="float:right"><input type="submit" class="button" name="confirm" value="수정">
					<span style="float:right"><input type="button" class="button" value="취소" onclick="javascript:window.location='salaryList.do'">
				</td>
			</tr>
			</table>
	</form>
</table>
</body>
</html>