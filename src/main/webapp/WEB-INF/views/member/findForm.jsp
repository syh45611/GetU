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
<style type="text/css">
	input {
	width: 100%;
	height: 48px;
	border: none;
	border-bottom: 1px solid #000;
	outline: 0;
	font-size: 15px;
	margin-bottom: 16px;
	font-family: inherit;
}
</style>
</head>
<body>
<div class="container">
	<div class="find-id">
		<h1 class="title">아이디 찾기</h1>
		<form action="findIdResult.do" method="post">		
			<input type="text" name="memberName" placeholder="이름" required="required"> 
			<input type="email" name="memberEmail" placeholder="이메일" required="required"> 
			<input type="submit" class="btn" value="아이디 찾기">
		</form>
	</div>	
	<div class="find-password">
		<h1 class="title">비밀번호 찾기</h1>
		<form action="findPwResult.do" method="post">
			<input type="text" name="memberId" placeholder="아이디" required="required" > 
			<input type="text" name="memberName" placeholder="이름" required="required" > 
			<input type="submit" class="btn" value="비밀번호 찾기">
		</form>
	</div>
</div>
</body>
</html>