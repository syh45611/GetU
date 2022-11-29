<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("이미 작성된 리뷰가 존재합니다");
			location.href="myPage.do"
		</script>
	</c:if>
	
	<c:if test="${result == 1}">
		<script type="text/javascript">
			alert("작성 완료");
			location.href="myPage.do"
		</script>
	</c:if>
	
	<c:if test="${result == -1}">
		<script type="text/javascript">
			alert("작성 실패!");
			location.href="myPage.do"
		</script>
	</c:if>
</body>
</html>