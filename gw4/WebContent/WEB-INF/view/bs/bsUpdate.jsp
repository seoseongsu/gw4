<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>업무명세표수정</title>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        $(function() {
        	var count = document.getElementByName('count')[0].value;
        	var test = 100;
        	document.bs.test.value=test;
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
                document.bs.count.value=count;
            });
 			
            //삭제
             $("#btnDelRow").on("click",function(){ 
            	 if(count <= 0){
            		 alert("삭제 할 행이 없습니다.");
            	 }else{
            		 $("#memberTable tr:last").remove();
            		 count--;
            	 }
            	 document.bs.count.value=count;
            });
          	//document.bs.count.value=count;
        });
    </script>
    <style type="text/css">
    	.a{width:200px; height:20px; text-align:left; padding-bottom:5px; float:left; margin:left:5px; layout:fixed;}
    	.b{width:520px; height:20px; text-align:right; padding-bottom:5px; float:left; margin:left:5px; layout:fixed;}
    </style>
</head>
 
<body>
<form method="get" action="bsUpdatePro.do" name="bs">
	<table border="1" style="width:720px;">
		<tr><td colspan="6"><strong>기본정보</strong></td></tr>
		<tr>
			<td width="70">사원</td>
			<td width="170">${empJoinVo.emp_name }
			<input type="hidden" name="emp_code" value="${empJoinVo.emp_code }"/></td>
			<td width="70">부서</td>
			<td width="170">
				<c:if test="${empJoinVo.dept_higher eq null }">
					${empJoinVo.dept_name }
					<input type="hidden" name="dept_code" value="${empJoinVo.dept_code }"/>
				</c:if>
				<c:if test="${empJoinVo.dept_higher ne null }">
					${empJoinVo.dept_higher }>${empJoinVo.dept_name }
					<input type="hidden" name="dept_code" value="${empJoinVo.dept_code }"/>
				</c:if>
			</td>
			<td width="70">직급</td>
			<td width="170">${empJoinVo.po_name }
			<input type="hidden" name="po_code" value="${empJoinVo.po_code }"/></td>
		</tr>
		<tr>
			<td>실행년도</td>
			<td>
				<select name="bs_year" style="width:60px;height:23px;">
					<option value="2016" ${bsVo.bs_year == '2016' ? 'selected="selected"' : '' }>2016</option>
					<option value="2017" ${bsVo.bs_year == '2017' ? 'selected="selected"' : '' }>2017</option>
					<option value="2018" ${bsVo.bs_year == '2018' ? 'selected="selected"' : '' }>2018</option>
				</select>
			</td>
			<td>평가자</td>
			<td>
				<select name="bs_ap" style="width:80px;height:23px;">
					<c:forEach var="bsApList" items="${bsApList }">
						<option value="${bsApList.emp_name }" ${bsApList.emp_name == bsVo.bs_ap ? 'selected="selected"' : '' }>${bsApList.emp_name }</option>	
					</c:forEach>
				</select>
			</td>
			<td>상태</td>
			<td>
				<select name="bs_st" style="width:100px;height:23px;">
					<option value="임시저장" ${bsVo.bs_st == '임시저장' ? 'selected="selected"' : '' }>임시저장</option>
					<option value="검토요청" ${bsVo.bs_st == '검토요청' ? 'selected="selected"' : '' }>검토요청</option>
					<option value="검토완료" ${bsVo.bs_st == '검토완료' ? 'selected="selected"' : '' }>검토완료</option>
				</select>
			</td>
		</tr>
		<tr><td colspan="6"><strong>업무목표</strong></td></tr>
	    <tr>
	    	<td colspan="6"><textarea name="bs_goal" style="resize: none;" rows="10" cols="98">${bsVo.bs_goal}</textarea></td>
	    </tr>
	</table>﻿
    <div class="a">
    	<strong>업무내역</strong>
    </div>
    <div class="b">
	    <input type="button" value="행추가"  id="btnAddRow"/>
	    <input type="button" value="행삭제"  id="btnDelRow"/>
    </div>
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
	<input type="hidden" name="count" value="${bbCount }" />
	<table border="1" style="width:720px;">
		<c:forEach var="bbList" items="${bbList }">
	    	<tr>
		        <td style="width:180px;"><input name="bb_main" type="text" id="bb_main" value="${bbList.bb_main }" /></td>
		        <td style="width:180px;"><input name="bb_status" type="text" id=""bb_status"" value="${bbList.bb_status }" /></td>
		        <td style="width:180px;"><input name="bb_time" type="text" id="bb_time" value="${bbList.bb_time }" /></td>
		        <td style="width:180px;"><input name="bb_product" type="text" id="bb_product" value="${bbList.bb_product }" /></td>
	    	</tr>
	    </c:forEach>
		<tr>
	    	<td align="right" colspan="4">
	    		<input type="submit" value="저장" onsubmit='return countCk();'/>
	    		<input type="button" value="취소" onclick="javascript:window.location='bsList.do'"/>
	    	</td>
	    </tr>
	</table>
	${bbCount}
	<input type="button" value="test" onclick="test();"/>
</form>
</body>
<script type="text/javascript">
	function test() {
		var test = document.getElementByName('count').value;;
    	alert(test);
	}
</script>
</html>
