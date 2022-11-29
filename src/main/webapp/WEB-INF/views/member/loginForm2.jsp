<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header2.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/memberadmin/memberadmin.css">
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 body {
    padding-top: 0px;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}
input {   
 	width: 388px;
    height: 65px;
   border: none;
   border-bottom: 1px solid #000;
   outline: 0;
   font-size: 15px;
   margin-bottom: 16px;
   font-family: inherit;
   margin-left: 95px;
}
.btn {
    width: 388px;
    height: 65px;
    background-color: var(--point-color);
    border: none;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    margin-bottom: 24px;
    cursor: pointer;
}
</style>
</head>
<body>
	<div class="container" style="margin-top: 80px">
		<form action="loginResult2.do" method="post">      
	         <img alt="header이미지" src="resources/images/mainLogo10.jpg" style="width: 300px; margin-left: 150px; margin-bottom: 50px;">
		         <input type="text" name="memberId" required="required"   autofocus="autofocus" placeholder="아이디"> 
		         <input type="password" name="memberPass" required="required" placeholder="비밀번호">
		         
	         <input type="submit" class="btn" value="로그인">
      </form>
	</div>

</body>
</html>