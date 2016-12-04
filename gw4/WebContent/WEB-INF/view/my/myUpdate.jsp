<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>사원등록</title>
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
<form method="get" action="myUpdatePro.do" name="userinput" onSubmit="return checkIt()">
  <table id="border_table" width="400" border="1" cellspacing="0" cellpadding="3" align="center" >
    <input type="hidden" name="emp_code" value="${empVo.emp_code }" />
    <tr> 
    <th colspan="2" height="39" align="center" style="background-color:#3e779d;">
       <font size="+1" ><b>사원정보수정</b></font></th>
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
	      <select name="dept_code" style="width:140px;">
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
      <td><select name="po_code" style="width:140px;">
	      	<c:forEach var="poList" items="${poList }">
	      		<option value ="${poList.po_code }"${poList.po_code == empVo.po_code ? 'selected="selected"' : '' }>${poList.po_name }</option>
		    </c:forEach>
	      </select></td>
    </tr>
    <tr>
      <td>주민번호</td>
      <td><input type="text" size="15" name="emp_jumin" value="${empVo.emp_jumin }"></td>
    </tr>
    <tr>
      <td>생년월일</td>
      <td><input type="text" size="15" id="emp_birth" name="emp_birth" value="${empVo.emp_birth }" onclick="fnPopUpCalendar(emp_birth,emp_birth,'yyyy-mm-dd')"/></td>
    </tr>
    <tr>
      <td>연락처</td>
      <td><input type="text" size="15"name="emp_phone" value="${empVo.emp_phone }"></td>
    </tr>
    <tr>
      <td>이메일</td>
      <td>
        <input type="text" size="15"name="emp_email" value="${empVo.emp_email }">
      </td>
    </tr>
    <tr>
      <td>최종학력</td>
      <td><input type="text" size="15" name="emp_acability" value="${empVo.emp_acability }"></td>
    </tr>
    <tr>
      <td>경력</td>
      <td><input type="text" size="15"name="emp_career" value="${empVo.emp_career }"></td>
    </tr>
    <tr>
      <td>입사일자</td>
      <td><input type="text" size="15"id="emp_join" name="emp_join" value="${empVo.emp_join }" onclick="fnPopUpCalendar(emp_join,emp_join,'yyyy-mm-dd')"/></td>
    </tr>
    <tr>
      <td>은행명</td>
      <td><input type="text" size="15" name="emp_bank" value="${empVo.emp_bank }"></td>
    </tr>
    <tr>
      <td>계좌번호</td>
      <td><input type="text" name="emp_acnum" value="${empVo.emp_acnum }"></td>
    </tr>
    <tr> 
      <th colspan="2" align="center"> 
          <input type="submit" class="button" value="수정" onclick="goSubmit()">
          <input type="reset" class="button" name="reset" value="다시입력">
          <input type="button" class="button" value="취소" onclick="javascript:self.close()">
      </th>
    </tr>
  </table>
</form>
<script type="text/javascript">
function goSubmit() {
    window.opener.name = "parentPage"; // 부모창의 이름 설정
    document.userinput.target = "parentPage"; // 타켓을 부모창으로 설정
    document.userinput.action = "/gw4/my/myUpdatePro.do";
    document.userinput.submit();
    self.close();
}
</script>
</body>
</html>
    