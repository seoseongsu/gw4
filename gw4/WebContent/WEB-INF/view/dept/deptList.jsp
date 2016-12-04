<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>조직도</title>
	<link rel="stylesheet" href="/gw4/css/styleS.css">
	<link rel="stylesheet" href="/gw4/css/tree/jquery.jOrgChart.css"/>
	<link rel="stylesheet" href="/gw4/css/tree/custom.css"/>

    <script type="text/javascript" src="/gw4/js/tree/prettify.js"></script>
    
    <!-- jQuery includes -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
    
    <script src="/gw4/js/tree/jquery.jOrgChart.js"></script>

    <script>
	    jQuery(document).ready(function() {
	        $("#org").jOrgChart({
	            chartElement : '#chart',
	            dragAndDrop  : true
	        });
	    });
    </script>
    <script>
		function deptDeleteEvent(a){
			if(confirm("정말 삭제하시겠습니까??")==true){
				location.href="deptDeletePro.do?dept_code="+a
			}else{
				return;
			}
		}
	</script>
	<style type="text/css">
		#ch
		{
		width:300px;
		height:300px;
		background-color:grreen;
		position: relative;
		top:100px;
		left:100px;
		}
		#bt
		{
		width:100px;
		height:100px;
		position: absolute;;
		top:0px;
		left:650px;
		}
		
	</style>
</head>

<body onload="prettyPrint();">




<div id="ch">

       <c:forEach var="treeList" items="${treeList }">
       <c:if test="${treeList.dept_higher eq null }">
	   <ul id="org" style="display:none">
		     <li>${treeList.dept_name }
			   		<p>${treeList.dept_leader }</p>
			   		<p>${treeList.dept_phone }</p>
			   		<font size="1"><a href="deptUpdate.do?dept_code=${treeList.dept_code}">수정</a> / 
			   						<a href="#" onclick="deptDeleteEvent(${treeList.dept_code})">삭제</a></font>	   		
			   		<ul>
				       	<c:forEach var="treeListD" items="${treeListD }">
					        <li>${treeListD.dept_name}
					        	<p>${treeListD.dept_leader}</p>
					        	<p>${treeListD.dept_phone}</p>
					        	<font size="1"><a href="deptUpdate.do?dept_code=${treeListD.dept_code}">수정</a> / 
			   						<a href="#" onclick="deptDeleteEvent(${treeListD.dept_code})">삭제</a></font>	  
					        	<ul>
					        		<c:forEach var="treeListT" items="${treeListT }">
					        			<c:if test="${treeListD.dept_name eq treeListT.dept_higher }">
					        				<li>${treeListT.dept_name}
					        					<p>${treeListT.dept_leader}</p>
					        					<p>${treeListT.dept_phone}</p>
					        					<font size="1"><a href="deptUpdate.do?dept_code=${treeListT.dept_code}">수정</a> / 
			   										<a href="#" onclick="deptDeleteEvent(${treeListT.dept_code})">삭제</a></font>	  
					        				</li>
					        			</c:if>
					        		</c:forEach>
					        	</ul>
					        </li>
				      	</c:forEach>
				    </ul>
			    </li>
		</ul>
		<div id="chart" class="orgChart"></div>
		</c:if>
		</c:forEach>
	
	<div id="bt">
	    <input type="button" class="button" value="부서등록" onclick="location='deptInsert.do'">
	</div>
    
</div>
    
    <script>
        jQuery(document).ready(function() {
            
            /* Custom jQuery for the example */
            $("#show-list").click(function(e){
                e.preventDefault();
                
                $('#list-html').toggle('fast', function(){
                    if($(this).is(':visible')){
                        $('#show-list').text('Hide underlying list.');
                        $(".topbar").fadeTo('fast',0.9);
                    }else{
                        $('#show-list').text('Show underlying list.');
                        $(".topbar").fadeTo('fast',1);                  
                    }
                });
            });
            
            $('#list-html').text($('#org').html());
            
            $("#org").bind("DOMSubtreeModified", function() {
                $('#list-html').text('');
                
                $('#list-html').text($('#org').html());
                
                prettyPrint();                
            });
        });
    </script>
    


</body>
</html>