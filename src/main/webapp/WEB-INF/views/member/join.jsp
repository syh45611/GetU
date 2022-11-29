<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/memberadmin/memberadmin.css">
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("회원가입이 완료되었습니다")
		location.href="loginForm.do"
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("회원가입을 실패하셨습니다")
		history.back();
	</script>
</c:if>
<c:if test="${result < 0 }">
	<script type="text/javascript">
		alert("있는 아이디입니다")
		history.back();
	</script>
</c:if>
</body>
</html>