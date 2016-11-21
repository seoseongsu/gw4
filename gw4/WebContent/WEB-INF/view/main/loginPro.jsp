<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${check != 1}">
	<script>
		alert("아이디 혹은 비번이 틀렸습니다");
		history.go(-1);
	</script>
</c:if>

<c:if test="${check == 1}">
	<script>
		alert("welcome to EYtime")
		document.location.href="main.do";
	</script>
</c:if>