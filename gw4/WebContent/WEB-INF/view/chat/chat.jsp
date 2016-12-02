<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="accessUserCount" class="java.util.ArrayList" scope="application" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/gw4/js/jquery-1.10.2.min.js"></script>
<script src="/gw4/js/socket.io.js"></script>
<style>
#mainContent{
	width: 100%;
	clear: both;
	padding-top: 30px;
}
.textarea_size {
    resize:none;
    line-height:150%;
    width:60%;
    overflow-y:auto;
    height:100px;
    border:1px solid #ccc;
}
</style>


<c:if test="${sessionScope.memId == null }">
            <script> alert('로그인을 먼저 하세요');
             location.href = "/gw/main/main.do";
              </script>          
</c:if>
<script>

var xmlHttp;
	$(document).ready(function() {
		var socket = io.connect("http://192.168.10.156:12345");  //서버연결 
		
		socket.on('in',function(inmsg){
			
			  $('#masseage').append(inmsg.inmsg+ ' 님이 입장 하셨습니다. \n');
					
			});
		socket.on('out',function(exit){
			
			  $('#masseage').append(exit.exit+' 님이 퇴장 하셨습니다. \n');
					
			});
		socket.on('nicresponse',function(id){
			
			  $('#masseage').append(id.id+' : ');
					
			});
		socket.on('response', function(msg){// 서버로부터 채팅메세지를 계속 받고있다. .. 
			$('#masseage').append(msg.msg+'\n');// 채팅 메세지 받아 출력 부분..
		});
		socket.on('listmember',function(list){
			
			  $('#listmessage').append(list.list+' 접속중\n');
					
			});
						
		// 텍스트박스내부의 채팅 내용 보내기
		$("#sendBtn").bind("click", function() {	
		
      		var id= $("input[name=uesrid]").val();
			socket.emit('id', {id:id});
			
			var msg = $("input[name=chat]").val();
			socket.emit('msg', {msg:msg});	
			
		     var offset = $("#masseage").offset();
			$("#masseage").scrollTop($("#masseage")[0].scrollHeight);
		});
		
         $("#exitBtn").bind("click", function() {
			var exit= $("input[name=userout]").val();
			socket.emit('exit', {exit:exit});
		
				
		});

     	var inmsg = $("input[name=userin]").val();
		socket.emit('inmsg', {inmsg:inmsg});
		
		var list = $("input[name=chatlist]").val();
		socket.emit('list', {list:list});
	});

function chkEnter(){
   if(event.which || event.keyCode) {
      if((event.which == 13) || (event.keyCode == 13)) {
         document.getElementById("sendBtn").click();
         document.getElementById("chat").value="";
      
         return false;
      }
   }
   else{
      return true;
   }
}


	// XMLHttpRequest  
	function startRequest() {
		if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		} 
		else if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}
		xmlHttp.onreadystatechange = handleStateChange;
		xmlHttp.open("GET", "/gw4/chat/chatlist.do", true);
		xmlHttp.send(null);

		// 2초마다 서버와 통신
		setTimeout("startRequest()", 2000);
		return false;
	}

	// OutPut
	function handleStateChange() {
		if(xmlHttp.readyState == 4) {
			if(xmlHttp.status == 200) {
				document.getElementById("listmember").innerHTML = xmlHttp.responseText;
			}
		}
	}

	// 브라우저의 종료, 새로고침, 이동등을 체크
	function accessExit() 
	{ 
		// 브라우저 종료 ( 종료시 self.screenTop = 10119)
		//alert(self.screenTop + " : " + document.readyState);
		if (self.screenTop > 2000) {
			exitRequest();
		} 
		// 새로고침
		else if(document.readyState == "complete") {
		} 
		// 다른 사이트 이동
		else if(document.readyState == "loading") {
		} 

		return false;
	} 

	// 브라우저 종료시 호출 (로그아웃 호출)
	function exitRequest() {
		if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		} 
		else if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}

		xmlHttp.onreadystatechange = handleStateChange;
		xmlHttp.open("GET", "/gw/main/logout.do", true);
		xmlHttp.send(null);

		return false;
	}
</script>
<script>
$(document).ready(function(){
	$("#moreInfo").click(function(){
		$("#moreInfoContent").slideToggle();
	})
})
</script>
</head>
<body>
	<!-- mainContent 시작 본문 내용 삽입-->
	<div id="mainContent">
		<table border="1">
			<tr>
				<td>
					<textarea  name="massage" id="masseage"   cols="100"  rows="15" onKeyDown="setLine( this )"  readonly="readonly"  class="textarea_size"  ></textarea> <br />
					<input type="hidden" name="userin" value="${list.dto.emp_name}"/>
					<input type="hidden" name="userout" value="${list.dto.emp_name}"/>
					<input type="text" name="uesrid" id="id" size="7"   readonly="readonly"  value="${sessionScope.emp_name}" onkeydown="chkEnter()"/>
					<input type="text"  name="chat" id="chat"  value="" onkeydown="chkEnter()" onfocus="sa();"/>
					<input type="button"  value="전송" id="sendBtn" />
					<input type="button"  id="exitBtn"  value="채팅방 나가기" onclick="javascript:window.location='/gw4/chat/chatExit.do'"/><br>		
				</td>
				<td>
					<div id="listmember">
      					<iframe name="chatlist" id="listmessage" frameborder="0" scrolling="auto" src="/gw4/chat/chatlist.do" ></iframe>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<!-- mainContent 끝 -->

</div>
</body>
</html>
	
