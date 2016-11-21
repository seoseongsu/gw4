<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<title>자금관리</title>
<script>
function fundDelete(a){
	if(confirm("정말 삭제하시겠습니까??")==true){
		location.href="fundDeletePro.do?fund_code="+a
	}else{
		return;
	}
}
</script>

<body>
	<table width="110">
		<tr>
			<td align="center">자금수지 목록</td>
		</tr>
	</table>
		<input type="button" value="자금등록" onclick="window.open('/gw4/fund/fundAdd.do','_self')">
	<table border="1" width="100%">
		<tr>
			<td align="center" width="50">집행일</td>
			<td align="center" width="50">구분</td>
			<td align="center" width="80">자금항목</td>
			<td align="center" width="120">적요</td>
			<td align="center" width="50">거래처</td>
			<td align="center" width="50">입금액</td>
			<td align="center" width="50">출금액</td>
			<td align="center" width="50">잔액</td>
			<td align="center" width="50">비고</td>

		</tr>
		
			<c:forEach var="fund" items="${fundList}">
			<tr>
				<td align="center" width="50">${fund.fund_days}</td>
				<td align="center" width="50">${fund.fund_division}</td>
				<td align="center" width="80">${fund.fund_item}</td>
				<td align="center" width="120">${fund.fund_briefs}</td>
				<td align="center" width="50">${fund.fund_account}</td>
				<td align="center" width="50">${fund.fund_deposit}</td>
				<td align="center" width="50">${fund.fund_withdraw}</td>
				<td align="center" width="50">${fund.fund_balance}</td>
				<td align="center" width="50">
				<input type="button" value="수정" onclick="location='fundUpdate.do?fund_code=${fund.fund_code }'"/>
				<input type="button" value="삭제" onclick="fundDelete(${fund.fund_code})"/>
				</td>
			</tr>
			</c:forEach>

		<tr>
			<td colspan="5" align="center">합계</td>
			<td align="center" width="50">${deposit.fund_deposit}</td>
			<td align="center" width="50">${deposit.fund_withdraw}</td>
			<td align="center" width="50">${deposit.fund_balance}</td>
		</tr>

	</table>
	</form>
</body>