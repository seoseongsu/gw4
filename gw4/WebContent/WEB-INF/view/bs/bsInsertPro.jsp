<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>테이블에 동적으로 TR 추가 /삭제 하기</title>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        $(function() {
        	var count = 1;
            $("#btnAddRow").on("click",function() {
                // clone
                $.trClone = $("#memberTable tr:last").clone().html();
                $.newTr = $("<tr>"+$.trClone+"</tr>");
 
                // append
                $("#bb_main1").attr("value", "bb_main1"+count);
                $("#bb_status1").attr("value", "bb_status1"+count);
                $("#bb_time1").attr("value", "bb_time1"+count);
                $("#bb_product1").attr("value", "bb_product1"+count);
                $("#memberTable").append($.newTr);
                
 				count++;
                
                //input text 추가
                $.inputText = $(document.createElement("input"));
                $.inputText.attr({
                    name : "inputText",
                    type : "text" ,
                    value : "id"+count
                });
                $("#memberTable tr:last td:last").html("");
                $("#memberTable tr:last td:last").append($.inputText);
            });
 			
            //삭제
             $("#btnDelRow").on("click",function(){ 
            	/*if( $("#example tr:eq(1)").is($(this).parents("tr")) ){
            		alert("처음 업무내역은 삭제 할 수 없습니다.");
         			return false;
         		}*/
            	 if(count <= 1){
            		 alert("처음 업무내용은 삭제 할 수 없습니다.");
            	 }else{
            		 $("#memberTable tr:last").remove();
            		 count--;
            	 }
            });
        });
    </script>
</head>
 
<body >﻿
<div style="width:500px;text-align:right;">
    <input type="button" value="행추가"  id="btnAddRow" />
    <input type="button" value="행삭제"  id="btnDelRow" />
</div>
<form method="post" id="frmTest">
<table id="memberTable" border="1" style="width:500px;">
    <tr>
        <td><input type="text" name="bb_main1" id="bb_main1" value="bb_main1원본"/></td>
        <td><input type="text" id="bb_status1" name="bb_status1" size="10" value="bb_status1원본" /></td>
	    <td><input type="text" id="bb_time1" name="bb_time1" size="10" value="bb_time1원본" /></td>
	    <td><input type="text" id="bb_product1" name="bb_product1" size="15" value="bb_product1원본" /></td>
	    <td style="width:50px;"></td>
    </tr>
</table>
</form>
</body>
</html>
