<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/memberadmin/memberadmin.css">
<style type="text/css">
body {
	padding-top: 0px;
}
</style>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("문의글 등록이 완료되었습니다");
		location.href="qnaList.do?pageNum=${pageNum}&memberNo=${memberNo}";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("문의글 작성에 실패하였습니다\n다시 시도해주세요");
		history.back();
	</script>
</c:if>
</body>
</html>