<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous">
	
</script>
<style type="text/css">
td{
font-size: 20px;
width: 100px;
border: 1px solid #bcbcbc;
text-align: center;
height: 70px;
}
th{
font-size: 20px;
width: 100px;
border: 1px solid #bcbcbc;
text-align: center;
height: 50px;
background-color: 86b6f6;
color: white;
}
input {
	width: 100px;
	font-size: 15px;
	text-align: center;
}
table{
	width: 220px;
}
.na{
	height: 45px;
	font-weight: 550;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class=10   style="width:1250; min-height:600px; text-align: center; display: flex; position: relative;  top: 90px;">
	<div class=1 style="width: 260px; height: 150px; float: left; padding-left: 5px">
		<form action="updateRoom.do">
			<input type="hidden" name="houseNo" value="${houseNo}">
			<input type="hidden" name="chkIn" value="${chk1}">
			<table>
				<tr>
					<th colspan="2">${chk1}</th>
				</tr>
				<tr>
					<td class="na">방이름</td>
					<td class="na">수량</td>
				</tr>
				<c:forEach var="room" items="${roomList1}">
					<tr>
						<td>${room.roomName}<input type="hidden" name="roomNo" value="${room.roomNo}"></td>
						<td><input type="text" name="roomRemain" value="${room.roomRemain}"></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정하기" 
					style="font-size: 15px; background: #86b6f6; color: white;"></td>
				</tr>
			</table>
		</form>
	</div>
	<div class=2 style="width: 260px; height: 150px; float: left; padding-left: 5px;">
		<form action="updateRoom.do">
		<input type="hidden" name="houseNo" value="${houseNo}">
		<input type="hidden" name="chkIn" value="${chk1}">
			<table>
				<tr>
					<th colspan="2">${chk2}</th>
				</tr>
				<tr>
					<td class="na">방이름</td>
					<td class="na">수량</td>
				</tr>
				<c:forEach var="room" items="${roomList2}">
					<tr>
						<td>${room.roomName}<input type="hidden" name="roomNo" value="${room.roomNo}"></td>
						<td><input type="text" name="roomRemain" value="${room.roomRemain}"></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정하기"
					style="font-size: 15px; background: #86b6f6; color: white;"></td>
				</tr>
			</table>
		</form>
	</div>
	<div class=3 style="width: 260px; height: 150px; float: left; padding-left: 5px;">
		<form action="updateRoom.do">
		<input type="hidden" name="houseNo" value="${houseNo}">
		<input type="hidden" name="chkIn" value="${chk1}">
			<table>
				<tr>
					<th colspan="2">${chk3}</th>
				</tr>
				<tr>
					<td class="na">방이름</td>
					<td class="na">수량</td>
				</tr>
				<c:forEach var="room" items="${roomList3}">
					<tr>
						<td>${room.roomName}<input type="hidden" name="roomNo" value="${room.roomNo}"></td>
						<td><input type="text" name="roomRemain" value="${room.roomRemain}"></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정하기"
					style="font-size: 15px; background: #86b6f6; color: white;"></td>
				</tr>
			</table>
		</form>
	</div>
	<div class=4 style="width: 260px; height: 150px; float: left; padding-left: 5px;">
		<form action="updateRoom.do">
		<input type="hidden" name="houseNo" value="${houseNo}">
		<input type="hidden" name="chkIn" value="${chk1}">
			<table>
				<tr>
					<th colspan="2">${chk4}</th>
				</tr>
				<tr>
					<td class="na">방이름</td>
					<td class="na">수량</td>
				</tr>
				<c:forEach var="room" items="${roomList4}">
					<tr>
						<td>${room.roomName}<input type="hidden" name="roomNo" value="${room.roomNo}"></td>
						<td><input type="text" name="roomRemain" value="${room.roomRemain}"></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정하기"
					style="font-size: 15px; background: #86b6f6; color: white;"></td>
				</tr>
			</table>
		</form>
	</div>
	<div class=5 style="width: 260px; height: 150px; float: left; padding-left: 5px;">
		<form action="updateRoom.do">
		<input type="hidden" name="houseNo" value="${houseNo}">
		<input type="hidden" name="chkIn" value="${chk1}">
			<table>
				<tr>
					<th colspan="2">${chk5}</th>
				</tr>
				<tr>
					<td class="na">방이름</td>
					<td class="na">수량</td>
				</tr>
				<c:forEach var="room" items="${roomList5}">
					<tr>
						<td>${room.roomName}<input type="hidden" name="roomNo" value="${room.roomNo}"></td>
						<td><input type="text" name="roomRemain" value="${room.roomRemain}"></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정하기"
					style="font-size: 15px; background: #86b6f6; color: white;"></td>
				</tr>
			</table>
		</form>
	</div>
	</div>
</body>
</html>