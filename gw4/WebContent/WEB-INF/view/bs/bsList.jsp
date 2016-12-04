<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>업무명세서목록</title>
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
<script>
function deleteEvent(a){
	if(confirm("정말 삭제하시겠습니까??")==true){
		location.href="bsDeletePro.do?bs_code="+a
	}else{
		return;
	}
}
</script>
<link rel="stylesheet" type="text/css" href="/gw4/css/flexslider.css">
<link rel="stylesheet" type="text/css" href="/gw4/css/style.css">
<script type="text/javascript" src="/gw4/js/jquery.flexslider.js"></script>
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
                  개인정보
               </h2>
            </div>
            
            <ul>
               <a href="/gw4/my/myView.do">정보조회<i class="fa fa-chevron-right"></i></a>   
               <a href="/gw4/commute/comDay.do">근태현황<i class="fa fa-chevron-right"></i></a>
               <a href="/gw4/main/calendar.do">일정관리<i class="fa fa-chevron-right"></i></a>         
               <a class="active" href="/gw4/bs/bsList.do">업무관리<i class="fa fa-chevron-right"></i></a>          
               <a href="#" onclick="javascript:window.open('/gw4/dept/deptList.do','new','left=50, top=50, width=1000, height=700')">조직도</a>
			</ul>
         </div>
         <div id="right_wrapper">
            <div id="right_path">
               <h5><i class="fa fa-home"></i>&nbsp; > 개인정보 > 업무관리</h5>
            </div>
            
            <div id="right_header">
               <h1>업무 관리</h1>
            </div><br><br>



<div>
	<c:if test="${countMy == 0 }">
	<table id="border_table" align="left" border="1" width="720">
		<tr><th colspan="6"><strong>나의 업무명세표</strong></th></tr>
		<tr>
			<td>
				등록된 업무명세표가 없습니다.
			</td>
		</tr>
		<tr>
			<td style="text-align:right;">
				<input type="button" class="button" value="등록" onclick="javascript:window.open('bsInsert.do?emp_code=${emp_code}','new','left=50, top=50, width=900, height=500')"/>
			</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${countMy > 0 }">
		<table id="border_table" align="left" border="1" width="720">
			<tr><th colspan="6"><strong>나의 업무명세표</strong></th></tr>
			<tr align="center">
				<th width="100">실행년도</th>
				<th width="70">부서</th>
				<th width="100">평가자</th>
				<th width="200">작성일</th>
				<th width="150">상태</th>
				<th width="100">&nbsp;</th>	
			</tr>
			<c:forEach var="bsMyList" items="${bsMyList }">
			<tr align="center">
				<td>${bsMyList.bs_year }</td>
				<td>${bsMyList.dept_name }</td>
				<td>${bsMyList.bs_ap }</td>
				<td>${bsMyList.bs_date }</td>
				<td>${bsMyList.bs_st }</td>
				<td><input type="button" class="buttonS" value="수정" onclick="javascript:window.open('bsUpdate.do?emp_code=${bsMyList.emp_code }&bs_code=${bsMyList.bs_code }','new','left=50, top=50, width=900, height=500')"/>
				<input type="button" class="buttonS" value="삭제" onclick="deleteEvent(${bsMyList.bs_code})"/></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="right" style="text-align:right;">
					<input type="button" class="button"  value="등록" onclick="javascript:window.open('bsInsert.do?emp_code=${emp_code}','new','left=50, top=50, width=900, height=500')"/>
				</td>
			</tr>
		</table>
	</c:if>	
	<br>
	
	<c:if test="${empVo.po_name == '대표이사' || empVo.po_name == '부장' || empVo.po_name == '차장' || memId == 'admin' }">
	
		<c:if test="${countDept == 0 }">
		<table id="border_table" align="left" border="1" width="720">
			<tr><th colspan="6"><strong>부서원의 업무명세표</strong></th></tr>
			<tr>
				<td>
					등록된 업무명세표가 없습니다.
				</td>
			</tr>
		</table>
		</c:if>
		<c:if test="${countDept > 0 }">
			<c:if test="${leaderCk.po_code <= 2 }" >
				<table id="border_table" align="left" border="1" width="720">
					<tr><th colspan="6"><strong>부서원의 업무명세표</strong></th></tr>
					<tr align="center">
						<th width="100">실행년도</th>
						<th width="70">부서</th>
						<th width="100">작성자</th>
						<th width="200">작성일</th>
						<th width="150">상태</th>
						<th width="100">&nbsp;</th>			
					</tr>
					<c:forEach var="bsDeptList" items="${bsDeptList }">
					<tr align="center">
						<td>${bsDeptList.bs_year }</td>
						<td>${bsDeptList.dept_name }</td>
						<td>${bsDeptList.emp_name }</td>
						<td>${bsDeptList.bs_date }</td>
						<td>${bsDeptList.bs_st }</td>
						<td align="left">
							<input type="button" class="buttonS" value="검토" onclick="javascript:window.open('bsUpdate.do?emp_code=${bsDeptList.emp_code }&bs_code=${bsDeptList.bs_code }','new','left=50, top=50, width=900, height=500')"/>
						</td>
					</tr>
					</c:forEach>
				</table>
			</c:if>
		</c:if>
	</c:if>
</div>



		</div>
      </div>
   </div>
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html>