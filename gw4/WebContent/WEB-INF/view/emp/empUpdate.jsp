<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>사원등록</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="#" />
<script>
$(function(){
	$("#emp_birth").datepicker({
		dateFormat: 'yymmdd',
		monthNamesShort: ['1월', '2월','3월', '4월','5월', '6월','7월', '8월','9월', '10월','11월', '12월'],
		dayNameMin: ['일','월','화','수','목','금','토'],
		changeMonth: true,	//월변경가능
		changeYear: true,	//일변경가능
		showMonthAfterYear: true	//년 뒤에 월표시
	});
});
$(function(){
	$("#emp_join").datepicker({
		dateFormat: 'yymmdd',
		monthNamesShort: ['1월', '2월','3월', '4월','5월', '6월','7월', '8월','9월', '10월','11월', '12월'],
		dayNameMin: ['일','월','화','수','목','금','토'],
		changeMonth: true,	//월변경가능
		changeYear: true,	//일변경가능
		showMonthAfterYear: true	//년 뒤에 월표시
	});
});
</script>
</head>
<body>
<form method="get" action="empUpdatePro.do" name="userinput" onSubmit="return checkIt()">
  <table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
    <input type="hidden" name="emp_code" value="${empVo.emp_code }" />
    <tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b>사원정보수정</b></font></td>
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
      <td><input type="text" name="emp_jumin" value="${empVo.emp_jumin }"></td>
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
          <input type="submit" value="수정" onclick="goSubmit()">
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
    document.userinput.action = "/gw4/emp/empUpdatePro.do";
    document.userinput.submit();
    self.close();
}
</script>
</body>
</html>
    