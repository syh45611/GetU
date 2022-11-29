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
#icon {
	width: 250%;
	width: 101px;
}

.main{
	font-size: 0;
	width:85%;
	text-align: center;
	list-style: none; 
	display: flex; 
}

.mng{
	margin-left : 200px;
	display:inline-block;
	width:25%;
	text-align: center;
}

.txt{
	font-size: 20px;
}

a{
	display: inline-grid;
	width: 100px;
}
body {
	padding-top: 0px;
}

</style>
</head>
<body>
	<div class="container_middle">
		<h3 class="title2">관리자님 환영합니다</h3>
			<div class="main">		
				<div class="mng">
					<a class="txt" href="adminMember.do?memberId=${memberId }">
						<img id ="icon" alt="" src="resources/images/icons/user.png" width="90">회원관리
					</a>
				</div>	
				<div class="mng">
					<a class="txt" href="adminNoticeList.do?memberId=${memberId }">
						<img id ="icon" alt="" src="resources/images/icons/noticeImg.png" width="90">공지사항
					</a>
				</div>	
				<div class="mng">
					<a class="txt" href="adminQnaList.do?memberId=${memberId }">
						<img id ="icon" alt="" src="resources/images/icons/qnaImg.png" width="90">문의내역     
					</a>
				</div>					
			</div>
	</div>
</body>
</html>