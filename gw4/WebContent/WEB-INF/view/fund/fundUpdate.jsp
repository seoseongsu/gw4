<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>자금수정</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="#" />
<script>
$(function(){
	$("#fund_days").datepicker({
		dateFormat: 'yymmdd',
		monthNamesShort: ['1월', '2월','3월', '4월','5월', '6월','7월', '8월','9월', '10월','11월', '12월'],
		dayNameMin: ['일','월','화','수','목','금','토'],
		changeMonth: true,	//월변경가능
		changeYear: true,	//일변경가능
		showMonthAfterYear: true	//년 뒤에 월표시
	});
});
</script>
<script>
function change(style){
	if(style == "출금")
		{
		
		fund_withdraw.style.display = "inline"
			fund_deposit.style.display = "none"
		
	}
	if(style == "입금")
		{
		fund_deposit.style.display = "inline"
			fund_withdraw.style.display = "none"
		}
	if(style == "")
		{
		fund_deposit.style.display = "none"
		fund_withdraw.style.display = "none"
		}
	
}
</script>

<body>
	<table>
		<tr>
			<td align="left">기등록자금 수정</td>
		</tr>
	</table>
<table border="1">	
<form method="get" action="fundUpdatePro.do" name="fundinput" onSubmit="return checkIt()">
	
		<input type="hidden" name="fund_code" value="${fundJoinVo.fund_code }" />
		<tr>
			<td>집행부서 : ${fundJoinVo.dept_name }</td>
			<td>집행직금 : ${fundJoinVo.po_name }</td>
			<td>집행자 : ${fundJoinVo.emp_name}</td>
		</tr>
		
		<tr>
			<td>집행일<input type="text" id="fund_days" name="fund_days" value="${fundJoinVo.fund_days }">
			<td>구분
				<select onChange="change(this.options[this.selectedIndex].value)" id="fund_division" name="fund_division">
					<option value="">선택</option>
					<option value="입금">입금</option>
					<option value="출금">출금</option>
				</select>
			</td>
			<td>
				<input type="text" id="fund_deposit" name="fund_deposit" placeholder="입금액을 입력하세요" style="display:none;" value="${fundJoinVo.fund_deposit }">
				<input type="text" id="fund_withdraw" name="fund_withdraw" placeholder="출금액을 입력하세요" style="display:none; value="${fundJoinVo.fund_withdraw }">
			</td>
		</tr>
		
		<tr>
			<td>적요<input type="text" id="fund_briefs" name="fund_briefs" value="${fundJoinVo.fund_briefs }">
			<td>자금항목
				<select id="fund_item" name="fund_item">
					<option value="">선택</option>
					<option value="물품구매">물품구매</option>
					<option value="학원비">학원비</option>
					<option value="보증금">보증금</option>
					<option value="급여">급여</option>
					<option value="기타수입">기타수입</option>
					<option value="기타지출">기타지출</option>
				</select>
			</td>
			<td>거래처
				<select id="fund_account" name ="fund_account">
					<option value="거래처외">거래처외</option>
					<option value="국제상사">국제상사</option>
					<option value="남성">남성</option>
					<option value="라스텔라">라스텔라</option>
					<option value="마스콧">마스콧</option>
					<option value="미니">미니</option>
					<option value="보람이">보람이</option>
					<option value="솜사탕">솜사탕</option>
					<option value="써니">써니</option>
					<option value="성광상사">성광상사</option>
					<option value="아이잼">아이잼</option>
					<option value="영광상사">영광상사</option>
					<option value="캠퍼스">캠퍼스</option>
					<option value="태극">태극</option>
				</select>
			</td>
		</tr>
		</table>
		<tr>
			<td>
				<input type="submit" name="confirm" value="수정">
				<input type="reset" name="reset" value="다시입력">
				<input type="button" value="취소" onclick="javascript:window.location='fundList.do'">
			</td>
		</tr>
	</form>
</body>