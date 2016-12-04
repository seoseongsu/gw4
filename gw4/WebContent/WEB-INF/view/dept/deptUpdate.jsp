<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부서수정</title>
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
	background-color:#3e779d;
}
</style>
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
<form method="get" action="deptUpdatePro.do" name="userinput" onSubmit="return checkIt()">
  <table id="border_table" width="600" cellspacing="0" cellpadding="3" align="center" >
    <input type="hidden" name="dept_code" value="${deptVo.dept_code }" />
    <tr> 
    <th colspan="2" height="39" align="center">
       <font size="+1" ><b>부서수정</b></font></th>
    </tr>
     
    <tr> 
      <th width="200"> 부서이름</th>
      <td width="400" > 
        <input type="text" name="dept_name" value="${deptVo.dept_name }" size="15" maxlength="15">
        <font size="1" color="red">*부서순서(대표이사->OO부->OO팀).</font>
      </td>
    </tr>
    <tr> 
      <th width="200"> 상위부서</th>
      <td width="400"> 
        <input type="text" name="dept_higher" value="${deptVo.dept_higher }" size="15" maxlength="15">
      </td>
    </tr>
    <tr> 
      <th width="200"> 부서장이름</th>
      <td width="400"> 
        <input type="text" name="dept_leader" value="${deptVo.dept_leader }" size="15" maxlength="10">
      </td>
    </tr>
     <tr> 
      <th width="200"> 부서연락처</th>
      <td width="400"> 
        <input type="text" name="dept_phone" value="${deptVo.dept_phone }" size="15" maxlength="30">
      </td>
    </tr>
    <tr> 
      <td colspan="2" align="center" style="text-align:right;border-right: hidden; border-bottom: hidden; border-left: hidden;"> 
          <input type="submit" class="button" name="confirm" value="수정" >
          <input type="reset" class="button" name="reset" value="다시입력">
          <input type="button" class="button" value="취소" onclick="javascript:window.location='deptList.do'">
      </td>
    </tr>
  </table>
</form>
    
</body>
</html>