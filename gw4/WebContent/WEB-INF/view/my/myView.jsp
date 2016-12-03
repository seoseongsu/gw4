<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>나의 사원 정보</title>
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
               <a class="active" href="/gw4/my/myView.do">정보조회<i class="fa fa-chevron-right"></i></a>   
               <a href="/gw4/my/myUpdate.do">정보수정<i class="fa fa-chevron-right"></i></a>         
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



  <table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
    <tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b>나의 사원 정보</b></font></td>
    </tr>
    <tr> 
      <td width="200"> 사원번호</td>
      <td width="400" > 
        ${empVo.emp_code }
      </td>
    </tr>
    <tr> 
      <td width="200"> 비밀번호</td>
      <td width="400" > 
        <input type="password" name="emp_passwd" size="15" maxlength="12" value="${empVo.emp_passwd }">
      </td>
    </tr>
    <tr> 
      <td width="200">이름</td>
      <td width="400"> 
        <input type="text" name="emp_name" size="15" maxlength="10" value="${empVo.emp_name }">
      </td>
    </tr>
    <tr>
      <td>부서</td>
      <td>
	      <select name="dept_code">
	      	<c:forEach var="deptList" items="${deptList }">
	      		<c:choose>
		      		<c:when test="${deptList.dept_higher eq null}">
		      			<option value ="${deptList.dept_code }" ${deptList.dept_code == empVo.dept_code ? 'selected="selected"' : '' }>${deptList.dept_name }</option>
		      		</c:when>
		      		<c:otherwise>
		      			<option value ="${deptList.dept_code }" ${deptList.dept_code == empVo.dept_code ? 'selected="selected"' : '' }>${deptList.dept_higher }>${deptList.dept_name }</option>
		      		</c:otherwise>
	      		</c:choose>
	      	</c:forEach>
	      </select>
      </td>
    </tr>
    <tr>
      <td>직급</td>
      <td><select name="po_code">
	      	<c:forEach var="poList" items="${poList }">
	      		<option value ="${poList.po_code }"${poList.po_code == empVo.po_code ? 'selected="selected"' : '' }>${poList.po_name }</option>
		    </c:forEach>
	      </select></td>
    </tr>
    <tr>
      <td>주민번호</td>
      <td><input type="text" name="emp_jumin" value="${empVo.emp_jumin }"><font size="2" color="red">*</font></td>
    </tr>
    <tr>
      <td>생년월일</td>
      <td><input type="text" id="emp_birth" name="emp_birth" value="${empVo.emp_birth }"></td>
    </tr>
    <tr>
      <td>연락처</td>
      <td><input type="text" name="emp_phone" value="${empVo.emp_phone }"></td>
    </tr>
    <tr>
      <td>이메일</td>
      <td>
        <input type="text" name="emp_email" value="${empVo.emp_email }">
      </td>
    </tr>
    <tr>
      <td>최종학력</td>
      <td><input type="text" name="emp_acability" value="${empVo.emp_acability }"></td>
    </tr>
    <tr>
      <td>경력</td>
      <td><input type="text" name="emp_career" value="${empVo.emp_career }"></td>
    </tr>
    <tr>
      <td>입사일자</td>
      <td><input type="text" id="emp_join" name="emp_join" value="${empVo.emp_join }"></td>
    </tr>
    <tr>
      <td>은행명</td>
      <td><input type="text" name="emp_bank" value="${empVo.emp_bank }"></td>
    </tr>
    <tr>
      <td>계좌번호</td>
      <td><input type="text" name="emp_acnum" value="${empVo.emp_acnum }"></td>
    </tr>
    <tr> 
      <td colspan="2" align="center"> 
          <input type="submit" value="수정">
      </td>
    </tr>
  </table>
  
  
  
  		</div>
      </div>
   </div>
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html>