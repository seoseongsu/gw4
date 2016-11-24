<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>업무명세표등록</title>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        $(function() {
        	var count = 0;
            $("#btnAddRow").on("click",function() {
                // clone
                $.trClone = $("#memberTable tr:last").clone().html();
                $.newTr = $("<tr>"+$.trClone+"</tr>");
 
                // append
               $("#memberTable").append($.newTr);
                
 				count++;
                
                //bb_main input text 추가
                $.inputText = $(document.createElement("input"));
                $.inputText.attr({
                    name : "bb_main"+count,
                    type : "text" ,
                    id : "bb_main"+count,
                    value : "bb_main"+count
                });
                $("#memberTable tr:last td:eq(0)").html("");
                $("#memberTable tr:last td:eq(0)").append($.inputText);
                
             	//bb_status input text 추가
                $.inputText = $(document.createElement("input"));
                $.inputText.attr({
                    name : "bb_status"+count,
                    type : "text" ,
                    id : "bb_status"+count,
                    value : "bb_main"+count
                });
                $("#memberTable tr:last td:eq(1)").html("");
                $("#memberTable tr:last td:eq(1)").append($.inputText);
                
              	//bb_time input text 추가
                $.inputText = $(document.createElement("input"));
                $.inputText.attr({
                    name : "bb_time"+count,
                    type : "text" ,
                    id : "bb_time"+count,
                    value : "bb_time"+count
                });
                $("#memberTable tr:last td:eq(2)").html("");
                $("#memberTable tr:last td:eq(2)").append($.inputText);
                
              	//bb_product input text 추가
                $.inputText = $(document.createElement("input"));
                $.inputText.attr({
                    name : "bb_product"+count,
                    type : "text" ,
                    id : "bb_product"+count,
                    value : "bb_product"+count
                });
                $("#memberTable tr:last td:eq(3)").html("");
                $("#memberTable tr:last td:eq(3)").append($.inputText);
            });
 			
            //삭제
             $("#btnDelRow").on("click",function(){ 
            	 if(count <= 0){
            		 alert("삭제 할 행이 없습니다.");
            	 }else{
            		 $("#memberTable tr:last").remove();
            		 count--;
            	 }
            });
        });
    </script>
    <style type="text/css">
    	.a{width:200px; height:20px; text-align:left; padding-bottom:5px; float:left; margin:left:5px; layout:fixed;}
    	.b{width:520px; height:20px; text-align:right; padding-bottom:5px; float:left; margin:left:5px; layout:fixed;}
    </style>
</head>
 
<body>
<form method="post" action="#" id="bs">
	<table border="1" style="width:720px;">
		<tr><td colspan="6"><strong>기본정보</strong></td></tr>
		<tr>
			<td>사원</td>
			<td><input type="text" name="emp_name" size="20" value="" readonly/></td>
			<td>부서</td>
			<td><input type="text" name="dept_name" value="" readonly/></td>
			<td>직급</td>
			<td><input type="text" name="po_name" value="" readonly/></td>
		</tr>
		<tr>
			<td>실행년도</td>
			<td>
				<select name="bs_date" style="width:60px;height:23px;">
					<option value="2016">2016</option>
					<option value="2017">2017</option>
					<option value="2018">2018</option>
				</select>
			</td>
			<td>평가자</td>
			<td><input type="text" name="" value=""/></td>
			<td>상태</td>
			<td>
				<select name="bs_st" style="width:100px;height:23px;">
					<option value="임시저장">임시저장</option>
					<option value="검토요청">검토요청</option>
					<option value="검토완료">검토완료</option>
				</select>
			</td>
		</tr>
		<tr><td colspan="6"><strong>업무목표</strong></td></tr>
	    <tr>
	    	<td colspan="6"><textarea style="resize: none;" rows="10" cols="98"></textarea></td>
	    </tr>
	</table>
</form>﻿
    <div class="a">
    	<strong>업무내역</strong>
    </div>
    <div class="b">
	    <input type="button" value="행추가"  id="btnAddRow"/>
	    <input type="button" value="행삭제"  id="btnDelRow"/>
    </div>
<form method="post" action="#" id="frmTest">
	<table id="memberTable" border="1" style="width:720px;">
	    <tr>
	        <td style="width:180px;">주요업무</td>
	        <td style="width:180px;">중요도</td>
	        <td style="width:180px;">시간비중</td>
	        <td style="width:180px;">결과물</td>
	    </tr>
	    <tr>
	        <td style="width:180px;"></td>
	        <td style="width:180px;"></td>
	        <td style="width:180px;"></td>
	        <td style="width:180px;"></td>
	    </tr>
	</table>
</form>
</body>
</html>
