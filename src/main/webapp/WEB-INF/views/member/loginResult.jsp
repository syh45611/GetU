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
		alert("로그인 되었습니다");
		location.href="mainPage.do"
		</script>
		</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.\n다시 시도해주세요.")
			history.back();
		</script>
	</c:if>
	
	<c:if test="${result < 0 }">
		<script type="text/javascript">
			alert("일치하는 아이디가 없습니다")
			history.back();
		</script>
	</c:if>

</body>
</html>