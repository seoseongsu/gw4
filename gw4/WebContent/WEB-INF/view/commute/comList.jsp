<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>근태검색</title>
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
<script type="text/javascript" src="/gw4/calendar/calendar.js"></script>
<script language="JavaScript">
    function checkIt() {
        if(!document.comListSh.searchDate1.value) {
            alert("기간을 선택하세요");
            return false;
        }
        if(!document.comListSh.searchDate2.value) {
            alert("기간을 선택하세요");
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
               <a href="/gw4/salary/salaryList.do">급여관리<i class="fa fa-chevron-right"></i></a>         
               <a href="/gw4/fund/fundList.do">회계장부<i class="fa fa-chevron-right"></i></a>
               <a class="active" href="/gw4/commute/comList.do">근태관리<i class="fa fa-chevron-right"></i></a>         
               <a href="/gw4/product_List.do">H/W관리<i class="fa fa-chevron-right"></i></a>          
               <a href="/gw4/productSoft_List.do">S/W관리<i class="fa fa-chevron-right"></i></a>         
            </ul>
         </div>
         <div id="right_wrapper">
            <div id="right_path">
               <h5><i class="fa fa-home"></i>&nbsp; > 인사관리 > 근태관리</h5>
            </div>
            
            <div id="right_header">
               <h1>근태 관리</h1>
            </div><br><br>



<form method="get" action="/gw4/commute/comListSearch.do" name="comListSh" onSubmit="return checkIt()">
<table id="border_table" border="1" align="left" width="70%">
	<tr>
		<th>
			기간별검색
		</th>
		<td colspan="3">
			<input type="text" style="border: 1px solid;" name="searchDate1" id="searchDate1" onclick="fnPopUpCalendar(searchDate1,searchDate1,'yyyy-mm-dd')"/>~
			<input type="text" style="border: 1px solid;" name="searchDate2" id="searchDate2" onclick="fnPopUpCalendar(searchDate2,searchDate2,'yyyy-mm-dd')"/>
		</td>
		<td style="border-left:hidden; border-right: hidden;">
			<select name="dept_code" style="width:120px;height:23px;border: 1px solid;">
				<c:forEach var="deptList" items="${deptList }">
		      		<c:choose>
			      		<c:when test="${deptList.dept_higher eq null}">
			      			<option value ="${deptList.dept_code }">${deptList.dept_name }</option>
			      		</c:when>
			      		<c:otherwise>
			      			<option value ="${deptList.dept_code }">${deptList.dept_higher }>${deptList.dept_name }</option>
			      		</c:otherwise>
		      		</c:choose>
		      	</c:forEach>
	    	</select>
		</td> 
		<td >
			<input type="submit" class="button" name="confirm" value="검색" />
		</td>
	</tr>
</form>
	<tr>
		<td style="border-left:hidden; border-right: hidden;">&nbsp;</td>
	</tr>
	<tr>
		<th>사원번호</th>
		<th>성명</th>
		<th>직급</th>
		<th>부서</th>
		<th>출근시각</th>
		<th>퇴근시각</th>
		<th>PC IP</th>
	</tr>
	
	<c:forEach var="comSearchVo" items="${comSearchVo }">
		<tr>
			<td>${comSearchVo.emp_code }</td>
			<td>${comSearchVo.emp_name }</td>
			<td>${comSearchVo.po_name }</td>
			<td>${comSearchVo.dept_name }</td>
			<td><fmt:formatDate pattern="HH:mm" value="${comSearchVo.com_go }" /></td>
			<td><fmt:formatDate pattern="HH:mm" value="${comSearchVo.com_off }" /></td>
			
			<td>${comSearchVo.com_ip }</td>
		</tr>
	</c:forEach>
</table>


         </div>
      </div>
   </div>
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html>