<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>조직도</title>
	<link rel="stylesheet" href="/gw4/css/tree/bootstrap.min.css"/>
	<link rel="stylesheet" href="/gw4/css/tree/jquery.jOrgChart.css"/>
	<link rel="stylesheet" href="/gw4/css/tree/custom.css"/>
	<link href="/gw4/css/tree/prettify.css" type="text/css" rel="stylesheet" />

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
</head>

<body onload="prettyPrint();">
    <ul id="org" style="display:none">
    <li>대표이사
       <ul>
       	<c:forEach var="treeListD" items="${treeListD }">
	        <li>${treeListD.dept_name}
	        	<ul>
	        		<c:forEach var="treeListT" items="${treeListT }">
	        			<c:if test="${treeListD.dept_name eq treeListT.dept_higher }">
	        				<li>${treeListT.dept_name}</li>
	        			</c:if>
	        		</c:forEach>
	        	</ul>
	        </li>
      	</c:forEach>
       </ul>
     </li>
   </ul>            
    
    <div id="chart" class="orgChart"></div>
    
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