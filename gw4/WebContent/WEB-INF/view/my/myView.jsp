<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>나의 사원 정보</title>
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
                  개인정보
               </h2>
            </div>
            
            <ul>
               <a class="active" href="/gw4/my/myView.do">정보조회<i class="fa fa-chevron-right"></i></a>   
               <a href="/gw4/commute/comDay.do">근태현황<i class="fa fa-chevron-right"></i></a>
               <a href="#">일정관리<i class="fa fa-chevron-right"></i></a>         
               <a href="/gw4/bs/bsList.do">업무관리<i class="fa fa-chevron-right"></i></a>          
               <a href="/gw4/dept/deptList.do">조직도<i class="fa fa-chevron-right"></i></a>         
            </ul>
         </div>
         <div id="right_wrapper">
            <div id="right_path">
               <h5><i class="fa fa-home"></i>&nbsp; > 개인정보 > 정보조회</h5>
            </div>
            
            <div id="right_header">
               <h1>정보 조회</h1>
            </div><br><br>


<table id="border_table" width="400" border="1" cellspacing="0" cellpadding="3" align="center" >
  	<tr>
  	<td colspan="2" style="text-align:right;border-right: hidden; border-top: hidden; border-left: hidden;">
  		<input type="button" class="button" value="수정" onclick="javascript:window.open('myUpdate.do?','new','left=50, top=50, width=700, height=500')">
  	</td>
  	</tr>
    <tr> 
    <th colspan="2" height="39" align="center" style="background-color:#3e779d;">
       <font size="+1" ><b>나의 사원 정보</b></font></th>
    </tr>
    <tr> 
      <td> 사원번호</td>
      <td>${empVo.emp_code }</td>
    </tr>
    <tr> 
      <td>이름</td>
      <td>${empVo.emp_name }</td>
    </tr>
    <tr>
      <td>부서</td>
      <td>${empVo.dept_name}</td>
    </tr>
    <tr>
      <td>직급</td>
      <td>${empVo.po_name}</td>
    </tr>
    <tr>
      <td>주민번호</td>
      <td>${empVo.emp_jumin }</td>
    </tr>
    <tr>
      <td>생년월일</td>
      <td>${empVo.emp_birth }</td>
    </tr>
    <tr>
      <td>연락처</td>
      <td>${empVo.emp_phone }</td>
    </tr>
    <tr>
      <td>이메일</td>
      <td>${empVo.emp_email }</td>
    </tr>
    <tr>
      <td>최종학력</td>
      <td>${empVo.emp_acability}</td>
    </tr>
    <tr>
      <td>경력</td>
      <td>${empVo.emp_career }년</td>
    </tr>
    <tr>
      <td>입사일자</td>
      <td>${empVo.emp_join }</td>
    </tr>
    <tr>
      <td>은행명</td>
      <td>${empVo.emp_bank }은행</td>
    </tr>
    <tr>
      <td>계좌번호</td>
      <td>${empVo.emp_acnum }</td>
    </tr>
  </table>
  
  		</div>
      </div>
   </div>
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html>