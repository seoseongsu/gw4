<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>사원등록</title>
<script type="text/javascript" src="/gw4/calendar/calendar.js"></script>
<script language="JavaScript">
    function checkIt() {
    	 if(!document.userinput.emp_passwd.value) {
             alert("비밀번호를 입력해 주세요");
             return false;
         }
    	 if(!document.userinput.emp_name.value) {
             alert("이름을 입력해 주세요");
             return false;
         }
    	 if(!document.userinput.emp_jumin.value) {
             alert("주민번호를 입력해 주세요");
             return false;
         }
    	 if(!document.userinput.emp_birth.value) {
             alert("생년월일을 입력해 주세요");
             return false;
         }
    	 if(!document.userinput.emp_phone.value) {
             alert("연락처를 입력해 주세요");
             return false;
         }
    	 if(!document.userinput.emp_email.value) {
             alert("메일을 입력해 주세요");
             return false;
         }
    	 if(!document.userinput.emp_acability.value) {
             alert("최종학력을 입력해 주세요");
             return false;
         }
    	 if(!document.userinput.emp_career.value) {
             alert("경력을 입력해 주세요");
             return false;
         }
    	 if(!document.userinput.emp_join.value) {
             alert("입사일자를 입력해 주세요");
             return false;
         }
    	 if(!document.userinput.emp_bank.value) {
             alert("은행명을 입력해 주세요");
             return false;
         }
    	 if(!document.userinput.emp_acnum.value) {
             alert("계좌번호를 입력해 주세요");
             return false;
         }
    	 
    }
</script>
</head>
<body>
<form method="get" action="empInsertPro.do" name="userinput" onSubmit="goSubmit()">
  <table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
    <tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b>사원등록</b></font></td>
    </tr>
     
    <tr> 
      <td width="200"> 비밀번호</td>
      <td width="400" > 
        <input type="password" name="emp_passwd" size="15" maxlength="12">
      </td>
    </tr>
    <tr> 
      <td width="200">이름</td>
      <td width="400"> 
        <input type="text" name="emp_name" size="15" maxlength="10">
      </td>
    </tr>
    <tr>
      <td>부서</td>
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
    </tr>
    <tr>
      <td>직급</td>
      <td><select name="po_code">
	      	<c:forEach var="poList" items="${poList }">
	      		<option value ="${poList.po_code }">${poList.po_name }</option>
		    </c:forEach>
	      </select></td>
    </tr>
    <tr>
      <td>주민번호</td>
      <td><input type="text" name="emp_jumin"></td>
    </tr>
    <tr>
      <td>생년월일</td>
      <td><input type="text" id="emp_birth" name="emp_birth" onclick="fnPopUpCalendar(emp_birth,emp_birth,'yyyy-mm-dd')"></td>
    </tr>
    <tr>
      <td>연락처</td>
      <td><input type="text" name="emp_phone"></td>
    </tr>
    <tr>
      <td>이메일</td>
      <td>
        <input type="text" name="emp_email">
      </td>
    </tr>
    <tr>
      <td>최종학력</td>
      <td><input type="text" name="emp_acability"></td>
    </tr>
    <tr>
      <td>경력</td>
      <td><input type="text" name="emp_career"></td>
    </tr>
    <tr>
      <td>입사일자</td>
      <td><input type="text" id="emp_join" name="emp_join" onclick="fnPopUpCalendar(emp_join,emp_join,'yyyy-mm-dd')"></td>
    </tr>
    <tr>
      <td>은행명</td>
      <td><input type="text" name="emp_bank"></td>
    </tr>
    <tr>
      <td>계좌번호</td>
      <td><input type="text" name="emp_acnum"></td>
    </tr>
    <tr> 
      <td colspan="2" align="center"> 
          <input type="submit" value="등록" onclick="return checkIt()">
          <input type="reset" name="reset" value="다시입력">
          <input type="button" value="취소" onclick="javascript:self.close()">
      </td>
    </tr>
  </table>
</form>
<script type="text/javascript">
function goSubmit() {
    window.opener.name = "parentPage"; // 부모창의 이름 설정
    document.userinput.target = "parentPage"; // 타켓을 부모창으로 설정
    document.userinput.action = "/gw4/emp/empInsertPro.do";
    document.userinput.submit();
    self.close();
}
</script>
</body>

</html>
