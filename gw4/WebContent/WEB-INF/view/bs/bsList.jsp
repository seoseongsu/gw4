<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>업무명세서목록</title>
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
                  회사소개
               </h2>
            </div>
            
            <ul>
               <a href="/gw4/my/myView.do">정보조회<i class="fa fa-chevron-right"></i></a>   
               <a href="/gw4/my/myUpdate.do">정보수정<i class="fa fa-chevron-right"></i></a>         
               <a href="/gw4/commute/comDay">근태현황<i class="fa fa-chevron-right"></i></a>
               <a href="#">일정관리<i class="fa fa-chevron-right"></i></a>         
               <a class="active" href="/gw4/bs/bsList.do">업무관리<i class="fa fa-chevron-right"></i></a>          
               <a href="/gw4/dept/deptList.do">조직도<i class="fa fa-chevron-right"></i></a>   
            </ul>
         </div>
         <div id="right_wrapper">
            <div id="right_path">
               <h5><i class="fa fa-home"></i>&nbsp; > 개인정보 > 업무관리</h5>
            </div>
            
            <div id="right_header">
               <h1>업무 관리</h1>
            </div>



<div>
	<c:if test="${countMy == 0 }">
	<table align="center" border="1" width="720">
		<tr><td colspan="6"><strong>나의 업무명세표</strong></td></tr>
		<tr>
			<td>
				등록된 업무명세표가 없습니다.
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="등록" onclick="location='bsInsert.do?emp_code=${emp_code }'"/>
			</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${countMy > 0 }">
		<table align="center" border="1" width="720">
			<tr><td colspan="6"><strong>나의 업무명세표</strong></td></tr>
			<tr align="center">
				<td width="100">실행년도</td>
				<td width="70">부서</td>
				<td width="100">평가자</td>
				<td width="200">작성일</td>
				<td width="150">상태</td>
				<td width="100">&nbsp;</td>	
			</tr>
			<c:forEach var="bsMyList" items="${bsMyList }">
			<tr align="center">
				<td>${bsMyList.bs_year }</td>
				<td>${bsMyList.dept_name }</td>
				<td>${bsMyList.bs_ap }</td>
				<td>${bsMyList.bs_date }</td>
				<td>${bsMyList.bs_st }</td>
				<td><input type="button" value="수정" onclick="location='bsUpdate.do?emp_code=${bsMyList.emp_code }&bs_code=${bsMyList.bs_code }'"/>
				<input type="button" value="삭제" onclick="deleteEvent(${bsMyList.bs_code})"/></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="right">
					<input type="button" value="등록" onclick="location='bsInsert.do?emp_code=${emp_code}'"/>
				</td>
			</tr>
		</table>
	</c:if>	
	<br>
	<c:if test="${countDept == 0 }">
	<table align="center" border="1" width="720">
		<tr><td colspan="6"><strong>부서원의 업무명세표</strong></td></tr>
		<tr>
			<td>
				등록된 업무명세표가 없습니다.
			</td>
		</tr>
	</table>
	</c:if>
	<c:if test="${countDept > 0 }">
		<c:if test="${leaderCk.po_code <= 2 }" >
			<table align="center" border="1" width="720">
				<tr><td colspan="6"><strong>부서원의 업무명세표</strong></td></tr>
				<tr align="center">
					<td width="100">실행년도</td>
					<td width="70">부서</td>
					<td width="100">작성자</td>
					<td width="200">작성일</td>
					<td width="150">상태</td>
					<td width="100">&nbsp;</td>			
				</tr>
				<c:forEach var="bsDeptList" items="${bsDeptList }">
				<tr align="center">
					<td>${bsDeptList.bs_year }</td>
					<td>${bsDeptList.dept_name }</td>
					<td>${bsDeptList.emp_name }</td>
					<td>${bsDeptList.bs_date }</td>
					<td>${bsDeptList.bs_st }</td>
					<td align="left">
						<input type="button" value="검토" onclick="location='bsUpdate.do?emp_code=${bsDeptList.emp_code }&bs_code=${bsDeptList.bs_code }'"/>
					</td>
				</tr>
				</c:forEach>
			</table>
		</c:if>
	</c:if>
</div>


		</div>
      </div>
   </div>
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html>