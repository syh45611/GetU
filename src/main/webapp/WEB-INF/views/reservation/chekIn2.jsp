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
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("예약방을 선택해주세요.");
		history.back();
	</script>
</c:if>
<style type="text/css">
#paytable{
	width: 400px;
}
#list {
	padding: 17px;
	text-align: left;
	font-size: 40px;

}
#list th{
text-align: left;
font-size: 22px;
font-weight: 10px;
color: #918c8c;
border-top:2px solid #86b6f6;

}
#list td{
font-size: 32px;
}
#method{

width: 180px; 
padding: .8em .5em; 
border: 1px solid #999;
font-family: inherit;  
background: url('resources/testImage/50.jpg') no-repeat 95% 50%; 
border-radius: 0px; 
font-weight: bold;
-webkit-appearance: none; 
-moz-appearance: none;
appearance: none;

}
</style>
</head>
<body>
<br>
<br>
<div style="width: 1450px; display: flex; height: 350px; position: relative; left: 110px; top: 1px;" >
<div style="width:700px; height:150px; float:left; " align="right">
	<table  id="list" >
	<tr><th>숙소이름</th></tr>
	<tr><td>${houseName}</td></tr>
	<tr><td style="padding-top: 14px;"></td></tr>
	<tr><th>객실타입/수량</th></tr>
	<c:forEach var = "room" items="${RoomList}">
	<tr><td>${room.roomName} / ${room.roomCount}</td></tr>
	</c:forEach>
	<tr><td style="padding-top: 14px;"></td></tr>
	<tr><th>이용기간</th></tr>
	<tr><td>${chkIn} ~ ${rOut }</td></tr>
	<tr><td style="padding-top: 14px;"></td></tr>
	<tr><th>총결제금액</tr><tr>
	<tr><td style="border-bottom:2px solid #86b6f6;">${sum}원</td></tr>
	</table>
	
	<form action="pay.do" id="check_module" >
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
		<table  id="paytable">
		<tr ><th colspan="2" style="text-align: left; font-size: 25px; font-weight: 700;
		 height: 50px">결제수단 선택</th></tr>
		<tr>
		<td style="width: 160px; text-align: left; padding: 15px;"><select id="method" name="method" >
		<option value="kakaopay">카카오페이</option>
		<option value="danal" >핸드폰 결제</option>
		<option value="nice">카드 결제</option>
		</select></td>
		<td  style="width: 240px; padding: 15px;" align="left"><input type="submit" value="결제하기"
		style="font-size: 25px; background: #86b6f6; color: white;">	</td></tr>
		
		</table>
	</form>
	</div>
	
	<div style="width:700px; height:150px;  float:left;" align="center" >
	<img alt="" src="resources/testImage/chklist.jpg" width="400px">
	<div>
	<table>
	<tr><th>숙소이용규칙 및 취소/환불규정 동의 (필수)
	<input type="checkbox" required="required" id="chkC" checked="checked"></th></tr>
	</table>
	</div>
	 </div>
	</div>
</body>
</html>