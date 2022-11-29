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
<div class="container">
	<h2 class="title">비밀번호 찾기 결과</h2>	
		<c:if test="${resultUpdatePw > 0 }">
			<p> 임시비밀번호는 [ ${msg } ] 입니다. 비밀번호를 수정해주세요</p>
			<input type="button" class="btn3" onclick="location.href='loginForm.do'" value="로그인 화면으로 돌아가기">	
		</c:if>
		<c:if test="${resultUpdatePw <= 0 }">
			<p style="font-size : 22px; color: #333333;"> 존재하지 않는 회원정보 입니다. </p>
			<input type="button" class="btn3" onclick="location.href='findForm.do'"value="아이디찾기">
		</c:if>
	</div>
</body>
</html>