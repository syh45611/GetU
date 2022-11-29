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
			alert("공지사항이 수정되었습니다");
			location.href="adminNoticeList.do?pageNum=${pageNum }";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("공지사항 수정에 실패하였습니다");
			history.back();
		</script>
	</c:if>
</body>
</html>