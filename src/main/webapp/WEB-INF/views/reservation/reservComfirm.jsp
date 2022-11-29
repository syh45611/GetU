<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>방이름</th>
			<th>방번호</th>
			<th>정원</th>
			<th>가격</th>
		</tr>
		<c:forEach var="room" items="${list}">
			<tr>
				<td>${room.roomName}</td>
				<td>${room.roomNo}</td>
				<td>${room.roomCapa}</td>
				<td>${room.roomPrice}</td>
			</tr>
		</c:forEach>
		<tr>
			<th colspan="2">합계</th>
			<th>${total }<c:set var="total" value="0" /> <c:forEach
					var="price" items="${list}" varStatus="status">
					<c:set var="total" value="${total + price.roomPrice}" />
				</c:forEach> <c:out value="${total}" />
			</th>
	</table>
</body>
</html>