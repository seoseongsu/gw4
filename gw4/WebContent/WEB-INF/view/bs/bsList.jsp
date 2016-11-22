<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>aa</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">

var oTbl;
var count = 0;
//Row 추가

function insRow() {
  oTbl = document.getElementById("addTable");
  var oRow = oTbl.insertRow();
  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
  var oCell = oRow.insertCell();

  //삽입될 Form Tag
  var frmTag = "<tr><td><input type=text name=addText"+count+" style=width:350px; height:20px;></td>"+
  "<td><input type=text name=addText"+count+" style=width:50px; height:20px;></td>"+
  "<td><input type=text name=addText"+count+" style=width:50px; height:20px;></td>"+
  "<td><input type=text name=addText"+count+" style=width:50px; height:20px;></td>";
  frmTag += "<td><input type=button value='삭제' onClick='removeRow()' style='cursor:hand'></td></tr>";
  oCell.innerHTML = frmTag;
  count++;
  document.form.count.value=count;
  // 다음 페이지에 몇개의 폼을 넘기는지 전달하기 위해 히든 폼에 카운트 저장
}
//Row 삭제
function removeRow() {
  oTbl.deleteRow(oTbl.clickedRowIndex);
  count--;
  document.form.count.value=count;
}

function frmCheck()
{
  var frm = document.form;
  
  for( var i = 0; i <= frm.elements.length - 1; i++ ){
     if( frm.elements[i].name == "addText" )
     {
         if( !frm.elements[i].value ){
             alert("텍스트박스에 값을 입력하세요!");
                 frm.elements[i].focus();
	 return;
          }
      }
   }
 }

</script>
</head>
<body>
<form name="form" method="post">
<input type="text" name="count" value="0">
      <table width="100%" border="1" cellpadding="0" cellspacing="0">
        <tr>
         <td colspan="5" bgcolor="#FFFFFF" height="25" align="left">
         <input name="addButton" type="button" style="cursor:hand" onClick="insRow()" value="추가">
         <font color="#FF0000">*</font>추가버튼을 클릭해 보세요.</td>
        </tr>
        <tr>
         <td height="25">
           <table border="1" id="addTable" width="1000" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
            <tr>
              <td><input type="text" name="addText" style="width:350px; height:20px;"></td>
              <td align="left"></td>
            </tr>
          </table></td>
        </tr>
       </table>
 <table width="400" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="10">
      </td>
    </tr>
    <tr>
      <td align="center">
      <input type="button" name="button" value="확인" onClick="frmCheck();">
      </td>
    </tr>
 </table>
</form>
</body>
</html>