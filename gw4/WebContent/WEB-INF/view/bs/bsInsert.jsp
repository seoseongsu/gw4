<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>업무명세표등록</title>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link rel="stylesheet" href="/gw4/css/styleS.css">
<style type="text/css">
#border_table, #memberTable{
	border: 1px solid #32607F;
	margin: auto;
	line-height: auto;
	border-collapse: collapse;
}
	
#border_table tr, #border_table td, #memberTable tr, #memberTable td{
	border: 1px solid #32607F;
	text-align:center;
	vertical-align:middle;
	padding: 1px;
	border-collapse: collapse;
}

#border_table th, #memberTable th{
	border: 1px solid #32607F;
	text-align:center;
	vertical-align:middle;
	padding: 1px;
	border-collapse: collapse;
	color: #ffffff;
	background-color:#3e779d;
}
</style>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
    	
        $(function() {
        	var count = 0;
            $("#btnAddRow").on("click",function() {
                // clone
                $.trClone = $("#memberTable tr:last").clone().html();
                $.newTr =$("<tr>"+$.trClone+"</tr>");
 
                // append
               $("#memberTable").append($.newTr);
                
 				count++;
                
                //bb_main input text 추가
                $.inputText = $(document.createElement("input"));
                $.inputText.attr({
                    name : "bb_main"+count,
                    type : "text" ,
                    id : "bb_main"+count,
                    value : "주요업무"
                });
                $("#memberTable tr:last td:eq(0)").html("");
                $("#memberTable tr:last td:eq(0)").append($.inputText);
                
             	//bb_status input text 추가
                $.inputText = $(document.createElement("input"));
                $.inputText.attr({
                    name : "bb_status"+count,
                    type : "text" ,
                    id : "bb_status"+count,
                    value : "0"
                });
                $("#memberTable tr:last td:eq(1)").html("");
                $("#memberTable tr:last td:eq(1)").append($.inputText);
                
              	//bb_time input text 추가
                $.inputText = $(document.createElement("input"));
                $.inputText.attr({
                    name : "bb_time"+count,
                    type : "text" ,
                    id : "bb_time"+count,
                    value : "0"
                });
                $("#memberTable tr:last td:eq(2)").html("");
                $("#memberTable tr:last td:eq(2)").append($.inputText);
                
              	//bb_product input text 추가
                $.inputText = $(document.createElement("input"));
                $.inputText.attr({
                    name : "bb_product"+count,
                    type : "text" ,
                    id : "bb_product"+count,
                    value : "결과물"
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
</head>
 
<body>
<form method="get" action="bsInsertPro.do" name="bs">
	<table id="border_table" border="1" style="width:720px;">
		<tr><th colspan="6"><strong>기본정보</strong></th></tr>
		<tr>
			<th width="70">사원</th>
			<td width="170">${empJoinVo.emp_name }
			<input type="hidden" name="emp_code" value="${empJoinVo.emp_code }"/></td>
			<th width="70">부서</th>
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
			<th width="70">직급</th>
			<td width="170">${empJoinVo.po_name }
			<input type="hidden" name="po_code" value="${empJoinVo.po_code }"/></td>
		</tr>
		<tr>
			<th>실행년도</th>
			<td>
				<select name="bs_year" style="width:60px;height:23px;">
					<option value="2016">2016</option>
					<option value="2017">2017</option>
					<option value="2018">2018</option>
				</select>
			</td>
			<th>평가자</th>
			<td>
				<select name="bs_ap" style="width:80px;height:23px;">
					<c:if test="${empVo.po_name == '대표이사' || empVo.po_name == '부장' || empVo.po_name == '차장'}">
						<option value="문근혁">문근혁</option>
					</c:if>
					<c:forEach var="bsApList" items="${bsApList }">
						<option value="${bsApList.emp_name }">${bsApList.emp_name }</option>	
					</c:forEach>
				</select>
			</td>
			<th>상태</th>
			<td>
				<select name="bs_st" style="width:100px;height:23px;">
					<option value="임시저장">임시저장</option>
					<option value="검토요청">검토요청</option>
					<option value="검토완료">검토완료</option>
				</select>
			</td>
		</tr>
		<tr>
		<td style="border-left:hidden; border-right: hidden;">&nbsp;</td>
		</tr>
		<tr><th colspan="6"><strong>업무목표</strong></th></tr>
	    <tr>
	    	<td colspan="6"><textarea name="bs_goal" style="resize: none;" rows="10" cols="98"></textarea></td>
	    </tr>
	</table>
	<br>
	<table id="border_table" border="1" style="width:720px;border:hidden;">
    	<tr>
	    	<th>
	    		<strong>업무내역</strong>
	    	</th>
	    	<td style="text-align:right;">
			    <input type="button" class="button" value="행추가"  id="btnAddRow"/>
			    <input type="button" class="button" value="행삭제"  id="btnDelRow"/>
		    </td>
    	</tr>
    </table>
	<table id="memberTable" border="1" style="width:720px;text-align:center;vertical-align:middle;">
	    <tr>
	        <th style="width:180px;">주요업무</th>
	        <th style="width:180px;">중요도(%)</th>
	        <th style="width:180px;">시간비중(%)</th>
	        <th style="width:180px;">결과물</th>
	    </tr>
	    <tr>
	        <td style="width:180px;"></td>
	        <td style="width:180px;"></td>
	        <td style="width:180px;"></td>
	        <td style="width:180px;"></td>
	    </tr>
	</table>
	<input type="hidden" name="count" value="0" />
	<table id="border_table" border="1" style="width:720px;">
		<tr>
	    	<td style="text-align:right;border-top:hidden; border-right: hidden; border-left: hidden; border-bottom: hidden">
	    		<input type="submit" class="button" value="저장" onclick="goSubmit()"/>
	    		<input type="button" class="button" value="취소" onclick="javascript:self.close()"/>
	    	</td>
	    </tr>
	</table>
</form>
</body>


<script type="text/javascript">
function goSubmit() {
    window.opener.name = "parentPage"; // 부모창의 이름 설정
    document.bs.target = "parentPage"; // 타켓을 부모창으로 설정
    document.bs.action = "/gw4/bs/bsInsertPro.do";
    document.bs.submit();
    self.close();
}
</script>
</html>
