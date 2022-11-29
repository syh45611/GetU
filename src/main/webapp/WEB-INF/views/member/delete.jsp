<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %> 
<c:set var="id" value='${sessionScope.memberId}'></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/memberadmin/memberadmin.css">
</head>
<body>
<c:if test="${result > 0 }">	
		<c:if test="${memberId != 'admin'}">
			<script type="text/javascript">	
				alert("탈퇴처리 되었습니다");
				location.href="loginForm.do"
			</script>
		</c:if>	
		<c:if test="${memberId == 'admin'}">
			<script type="text/javascript">	
				alert("탈퇴처리 되었습니다");
				location.href="adminMember.do"
			</script>
		</c:if>	
</c:if>
<c:if test="${result==0 }">
	<script type="text/javascript">
		alert("탈퇴 실패\n다시 시도해주세요");
		history.go(-1);
	</script>
</c:if>
</body>
</html>