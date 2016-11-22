<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부서등록</title>
<script language="JavaScript">
    function checkIt() {
        var userinput = eval("document.userinput");
        var str = userinput.dept_name.value;
        var dept = str.charAt(str.length - 1);
        if(!userinput.dept_name.value) {
            alert("부서이름을 입력하세요");
            return false;
        }else if(!(dept == '부' || dept == '팀' || userinput.dept_name.value == '대표이사' )){
        	alert("부서이름을 정확히 입력하세요");
        	return false;
        }
        if(!userinput.dept_higher.value) {
            alert("상위부서을 입력하세요");
            return false;
        }
        if(!userinput.dept_leader.value) {
            alert("부서장이름을 입력하세요");
            return false;
        }
        if(!userinput.dept_phone.value) {
            alert("부서연락처를 입력하세요");
            return false;
        }
        if(!userinput.jumin1.value  || !userinput.jumin2.value )
        {
            alert("주민등록번호를 입력하세요");
            return false;
        }
    }
</script>

</head>
<body>
<form method="get" action="deptInsertPro.do" name="userinput" onSubmit="return checkIt()">
  <table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
    <tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b>부서등록</b></font></td>
    </tr>
    <tr> 
      <td width="200"> 부서이름</td>
      <td width="400" > 
        <input type="text" name="dept_name" size="15" maxlength="15">
        <font size="1" color="red">*부서순서(대표이사->OO부->OO팀).</font>
      </td>
    </tr>
    <tr> 
      <td width="200"> 상위부서</td>
      <td width="400"> 
        <input type="text" name="dept_higher" size="15" maxlength="15">
       
      </td>
    </tr>
    <tr> 
      <td width="200"> 부서장이름</td>
      <td width="400"> 
        <input type="text" name="dept_leader" size="15" maxlength="10">
      </td>
    </tr>
     <tr> 
      <td width="200"> 부서연락처</td>
      <td width="400"> 
        <input type="text" name="dept_phone" size="15" maxlength="30">
      </td>
    </tr>
    <tr> 
      <td colspan="2" align="center"> 
          <input type="submit" name="confirm" value="등록" >
          <input type="reset" name="reset" value="다시입력">
          <input type="button" value="취소" onclick="javascript:window.location='deptList.do'">
      </td>
    </tr>
  </table>
</form>
    
</body>
</html>