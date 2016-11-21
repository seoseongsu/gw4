<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부서수정</title>
</head>
<body>
<form method="get" action="deptUpdatePro.do" name="userinput" onSubmit="return checkIt()">
  <table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
    <input type="hidden" name="dept_code" value="${deptVo.dept_code }" />
    <tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b>부서수정</b></font></td>
    </tr>
     
    <tr> 
      <td width="200"> 부서이름</td>
      <td width="400" > 
        <input type="text" name="dept_name" value="${deptVo.dept_name }" size="15" maxlength="15">
      </td>
    </tr>
    <tr> 
      <td width="200"> 상위부서</td>
      <td width="400"> 
        <input type="text" name="dept_higher" value="${deptVo.dept_higher }" size="15" maxlength="15">
      </td>
    </tr>
    <tr> 
      <td width="200"> 부서장이름</td>
      <td width="400"> 
        <input type="text" name="dept_leader" value="${deptVo.dept_leader }" size="15" maxlength="10">
      </td>
    </tr>
     <tr> 
      <td width="200"> 부서연락처</td>
      <td width="400"> 
        <input type="text" name="dept_phone" value="${deptVo.dept_phone }" size="15" maxlength="30">
      </td>
    </tr>
    <tr> 
      <td colspan="2" align="center"> 
          <input type="submit" name="confirm" value="수정" >
          <input type="reset" name="reset" value="다시입력">
          <input type="button" value="취소" onclick="javascript:window.location='deptList.do'">
      </td>
    </tr>
  </table>
</form>
    
</body>
</html>