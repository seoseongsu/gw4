<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>급여등록</title>
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
<script type="text/javascript">
	window.onload=function(){
		document.getElementById("po_code").onchange=function(){
			var jid = document.getElementById("po_code").value;
			document.getElementById("normal").innerHTML = normal(jid);
		}
	}
	function normal(jid){
		var array = ["0","8000000","5500000","5000000","4000000","3000000","2500000","2000000"]
		return array[jid];
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



	<table>
		<tr>
			<td align="left">사원급여 등록</td>
		</tr>
	</table>
	
	
	<table border="1" width="100%" >
	<form method="get" action="salaryAddPro.do" name="salaryinput" onSubmit="return checkIt()">
		<tr>
		<td>등록일자</td>
		<td>부서명</td>
		<td>직급명</td>
		<td>사원이름</td>
		<td>기본급</td>
		<td>상여금</td>
		</tr>
		
		<tr>
			<td>
				<input type="text" id="salary_days" name="salary_days" onclick="fnPopUpCalendar(salary_days,salary_days,'yyyy - mm - dd')">
			</td>
			<td>
				<select name="dept_code">
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
			<td>
				<select name="po_code" id="po_code">
				<c:forEach var="poList" items="${poList }">
					<option value="${poList.po_code }">${poList.po_name }</option>
				</c:forEach>
			</select>
			</td>
			<td>
				<select name="emp_code">
					<c:forEach var="empList" items="${empList }">
						<option value="${empList.emp_code }">${empList.emp_name }</option>
					</c:forEach>
				</select>
			</td>
  		   <td>
 		   <input type="text" id="salary_normal" name="salary_normal">
		   (해당직급의 기본급은 <span id="normal">0</span> 원입니다.)
		   </td>
		   <td>
		   <input type="text" id="salary_bonus" name="salary_bonus">
		   </td>
		</tr>
	
	</table>
		<tr>
			<td>
				<span style="float:right"><input type="submit" name="confirm" value="등록">
				<span style="float:right"><input type="button" value="취소" onclick="javascript:window.location='salaryList.do'">
			</td>
		</tr>
	</form>
	

		</div>
      </div>
   </div>
	
<jsp:include page="/layout/footer.jsp" />
	
</body>
</html>