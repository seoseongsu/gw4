<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
    
	
	<c:if test="${sessionScope.memId == null }">
            <script> alert('로그인을 먼저 하세요');
             location.href = "/gw4/main/login.do";
              </script>          
	</c:if>
	
	       접속자 : ${count} <br />
	       <hr>
	       	<c:forEach var="c" items="${nowlist}">                                                      
	              <font color="red">   
	              	${c.mapName}[${c.mapId}]   <br />
	              </font>
			</c:forEach>       
