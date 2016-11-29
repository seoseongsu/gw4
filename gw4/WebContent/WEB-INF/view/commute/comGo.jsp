<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>근태관리</title>
</head>

<body onload="confirmGoToWork();">
</body>

<script>
function confirmGoToWork(){
	if(confirm("출근처리 하시겠습니까?") == true){
		document.location="/gw4/commute/comGoPro.do?emp_code=${emp_code}";
	}else{
	 	history.go(-1);
	}
}
</script>
</html>