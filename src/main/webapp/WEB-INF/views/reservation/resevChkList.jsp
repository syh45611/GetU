<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("예약방을 선택해주세요.");
		history.back();
	</script>
</c:if>
</head>
<body>
<h3>결제리스트</h3>


	
</body>
</html>