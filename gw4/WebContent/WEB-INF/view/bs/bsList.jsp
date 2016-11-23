<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
     
    <script type="text/javascript">
        $(document).ready(function(){
        	var count = 1;
            // 추가 버튼 클릭시
            $("#addBtn").click(function(){
                // item 의 최대번호 구하기
                //var lastNo = $("#example tr:last").attr("class").replace("item", "");
                var newitem = $("#example tr:eq(1)").clone();
                count++;
                //newitem.removeClass();
                //newitem.find("td:eq(0)").attr("rowspan", "1");
                //newitem.addClass("item"+count);
 				
                $("#example > tbody:last").append(newitem);
                $("#bb_main1").attr("value", "bb_main"+count);
                $("#bb_status1").attr("value", "bb_status"+count);
                $("#bb_time1").attr("value", "bb_time"+count);
                $("#bb_product1").attr("value", "bb_product"+count);
                
               // alert(count);
            });
             
            // 삭제버튼 클릭시
            $(".delBtn").live("click", function(){
            	if( $("#example tr:eq(1)").is($(this).parents("tr")) ){
               		alert("처음 업무내역은 삭제 할 수 없습니다.");
            		return false;
            	}
                var clickedRow = $(this).parent().parent();
                var cls = clickedRow.attr("class");
                /* 
                // 각 항목의 첫번째 row를 삭제한 경우 다음 row에 td 하나를 추가해 준다.
                if( clickedRow.find("td:eq(0)").attr("rowspan") ){
                    if( clickedRow.next().hasClass(cls) ){
                        clickedRow.next().prepend(clickedRow.find("td:eq(0)"));
                    }
                }*/
                clickedRow.remove();
                alert("123"+$(this).parent().parent());
                count--;
                // rowspan 조정
               // resizeRowspan(cls);
            });
 
            // cls : rowspan 을 조정할 class ex) item1, item2, ...
            function resizeRowspan(cls){
                var rowspan = $("."+cls).length;
                $("."+cls+":first td:eq(0)").attr("rowspan", rowspan);
            }
        });
    </script>
</head>
 
<body>
<button id="addBtn">추가</button>
<form method="post" action="bsInsertPro.do" name="userinput" onSubmit="return checkIt()">
	<input type="hidden" name="count" value="0">
	<table id="example" border="1px">
	        <tr>
	            <th>주요업무</th>
	            <th>중요도</th>
	            <th>시간비중</th>
	            <th>결과물</th>
	            <th>&nbsp;</th>
	        </tr>
	        <tr class="item1">
	            <td><input type="text" id="bb_main1" name="bb_main1" size="70" value="bb_main1 원본"/></td>
	            <td><input type="text" id="bb_status1" name="bb_status1" size="10" value="bb_status1"/></td>
	            <td><input type="text" id="bb_time1" name="bb_time1" size="10" value="bb_time1"/></td>
	            <td><input type="text" id="bb_product1" name="bb_product1" size="15" value="bb_product1" /></td>
	            <td><button class="delBtn">삭제</button></td>
	        </tr>
	</table>
</form>
</body>
</html>   