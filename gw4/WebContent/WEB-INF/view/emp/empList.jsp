<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>사원목록</title>


<script>
function deleteEvent(a){
	if(confirm("정말 삭제하시겠습니까??")==true){
		location.href="empDeletePro.do?emp_code="+a
	}else{
		return;
	}
}
</script>
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
                  인사관리
               </h2>
            </div>
            
            <ul>
               <a class="active" href="/gw4/emp/empList.do">사원관리<i class="fa fa-chevron-right"></i></a>   
               <a href="/gw4/salary/salaryList.do">급여관리<i class="fa fa-chevron-right"></i></a>         
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
               <h1>사원 관리</h1>
            </div><br><br>
            

    <c:if test="${memId == null }">
		<script type="text/javascript">
			alert("로그인을 먼저 해주세요. 로그인창으로 이동합니다.");
			location.href='/gw4/main/login.do';
		</script>
	</c:if>
	
	<c:if test="${empVo.dept_name != '인사팀' && empVo.dept_name != '대표이사' && empVo.dept_name != '운영부' && memId != 'admin' }">
		<script type="text/javascript">
			alert("해당부서만 이용가능합니다. 메인으로 이동합니다.");
			location.href='/gw4/main/main.do';
		</script>
	</c:if>
	
	<c:if test="${empVo.dept_name == '인사팀' || empVo.dept_name == '대표이사' || empVo.dept_name == '운영부' || memId == 'admin' }">
            
            
    <c:if test="${count == 0 }">
	<table id="border_table">
		<tr style="border-bottom:1px solid;">
				<form method="get" action="/gw4/emp/empListSh.do" name="empSh" onSubmit="return checkIt()">
				<th style="background-color:#3e779d;">부서</th>
				    <td colspan="2">
					    <select name="dept_code" style="width:125px;">
					    	<option value="d">전체</option>
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
				     <th style="background-color:#3e779d;">직급</th>
      				 <td>
      				  	<select name="po_code" style="width:125px;">
      				  		<option value="p">전체</option>
					      	<c:forEach var="poList" items="${poList }">
					      		<option value ="${poList.po_code }">${poList.po_name }</option>
						    </c:forEach>
	      				</select>
	      			</td>
					<td style="border-right: hidden; border-top: hidden;">
						<input type="submit" class="button" value="검색" />
						<input type="button" class="button" value="전체보기" onclick="location.href='empList.do';"/>
					</td>
					</form>
				<td colspan="8" style="text-align:right;border-right: hidden; border-top: hidden; border-bottom: hidden;"><button type="button" class="button" onclick="javascript:window.open('empInsert.do','new','left=50, top=50, width=700, height=500')">사원등록</button></td>
			</tr>
		<tr>
			<td colspan="14">	
				등록된 사원 정보가 없습니다.
			</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${count > 0 }">
		<table id="border_table">
			<tr style="border-bottom:1px solid;">
				<form method="get" action="/gw4/emp/empListSh.do" name="empSh" onSubmit="return checkIt()">
				<th style="background-color:#3e779d;">부서</th>
				    <td colspan="2">
					    <select name="dept_code" style="width:125px;">
					    	<option value="d">전체</option>
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
				     <th style="background-color:#3e779d;">직급</th>
      				 <td>
      				  	<select name="po_code" style="width:125px;">
      				  		<option value="p">전체</option>
					      	<c:forEach var="poList" items="${poList }">
					      		<option value ="${poList.po_code }">${poList.po_name }</option>
						    </c:forEach>
	      				</select>
	      			</td>
					<td style="border-right: hidden; border-top: hidden;">
						<input type="submit" class="button" name="confirm" value="검색" />
						<input type="button" class="button" value="전체보기" onclick="location.href='empList.do';"/>
					</td>
					</form>
				<td colspan="8" style="text-align:right;border-right: hidden; border-top: hidden; border-bottom: hidden;"><button type="button" class="button" onclick="javascript:window.open('empInsert.do','new','left=50, top=50, width=700, height=500')">사원등록</button></td>
			</tr>
			<tr>
				<td colspan="5" style="border-left:hidden; border-right: hidden"></td>
				<td colspan="9" style="border-left:hidden; border-top: hidden; border-right: hidden">&nbsp;</td>
			</tr>
			<tr style="background-color:#3e779d;">
				<th>사원번호</th>
				<th>성명</th>
				<th>부서(조직)</th>
				<th>직급</th>
				<th>주민번호</th>
				<th>생년월일</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>최종학력</th>
				<th>경력</th>		
				<th>입사일자</th>
				<th>은행명</th>
				<th>계좌번호</th>
				<th>&nbsp;</th>					
			</tr>
			<c:forEach var="article" items="${articleList }">
			<tr>
				<td>${article.emp_code }</td>
				<td>${article.emp_name }</td>
				<td>${article.dept_name }</td>
				<td>${article.po_name }</td>
				<td>${article.emp_jumin }</td>
				<td>${article.emp_birth }</td>
				<td>${article.emp_phone }</td>
				<td>${article.emp_email }</td>
				<td>${article.emp_acability }</td>
				<td>${article.emp_career }</td>
				<td>${article.emp_join }</td>
				<td>${article.emp_bank }</td>
				<td>${article.emp_acnum }</td>
				<td><input type="button" class="buttonS" value="수정" onclick="javascript:window.open('empUpdate.do?emp_code=${article.emp_code }','new','left=50, top=50, width=700, height=500')"/>
				<input type="button" class="buttonS" value="삭제" onclick="deleteEvent(${article.emp_code})"/></td>
			</tr>
			</c:forEach>
		</table>
	</c:if>
	
	
	</c:if>

	
         </div>
      </div>
   </div>
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html>