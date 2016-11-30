<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>근태관리</title>
</head>

<body onload="confirmLeaveToWork();">
</body>

<script>
function confirmLeaveToWork(){
	if(confirm("퇴근처리 하시겠습니까?") == true){
		document.location="/gw4/commute/comOffPro.do?emp_code=${emp_code}";
	}else{
	 	history.go(-1);
	}
}
</script>
</html>