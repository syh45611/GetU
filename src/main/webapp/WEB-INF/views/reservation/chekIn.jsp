<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function back() {
		 location.href="houseContent.do?houseNo=1"; 
		
	}
</script>
<style type="text/css">
th, td {
	padding: 17px;
	text-align: center;
	font-size: 40px;
}

</style>
</head>
<body>
<br>
<br>

<div align="center">
	<table border="1">
	<tr><th>객실명</th><th>수량</th><th>이용기간</th><th>숙박인원</th><th>금액</th></tr>
	<c:forEach var = "room" items="${RoomList}">
	<tr><th>${room.roomName}</th><th>${room.roomCount}</th>
	<th>${room.chkIn} ~ ${rOut}</th>
	<th></th>
	<th>${room.roomPrice}</th></tr>
	</c:forEach>
	<tr><th colspan="4">결제금액 : ${sum}</th></tr>
	</table>
	
	<form action="pay.do" id="check_module" 	>
		<c:forEach var="room" items="${RoomList}">
		<input type="hidden" name="houseNo" value="${room.houseNo }">
		<input type="hidden" name="roomType" value="${room.roomType }">
		<input type="hidden" name="chkIn" value="${room.chkIn }">
		<input type="hidden" name="chkOut" value="${room.chkOut }">
		<input type="hidden" name="roomCount" value="${room.roomCount }">
		<input type="hidden" name="rOut" value="${rOut}">
		</c:forEach>
		<input type="hidden" name="sum" value="${sum}">
		<input type="hidden" name="Days" value="${Days}">
		<table >
		<tr><th>카카오페이</th><th>핸드폰결제</th><th>카드결제</th><tr>
		<tr><th><img alt="" src="resources/testImage/k.jpg" width="105"></th>
		<th><img alt="" src="resources/testImage/p.jpg" width="105"></th>
		<th><img alt="" src="resources/testImage/c.jpg" width="105"></th>
		<tr>
		<td><input type="radio" name="method" value="kakaopay" style="width:30px;height:30px;border:1px;"></td>
		<td><input type="radio" name="method" value="danal" style="width:30px;height:30px;border:1px;"></td>
		<td><input type="radio" name="method" value="nice" style="width:30px;height:30px;border:1px;"></td>
		</tr>
		<tr><td colspan="3"><input type="submit" value="결제하기">	</td></tr>
		<tr><td colspan="3"><input type="button" value="뒤로가기" onclick="return back()"></td></tr>
		</table>
	</form>
	</div>
</body>
</html>