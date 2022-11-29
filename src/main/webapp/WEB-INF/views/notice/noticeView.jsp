<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/memberadmin/memberadmin.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/bootstrap/css/bootstrap.min.css">
<style type="text/css">
body {
	padding-top: 0px;
}

</style>
</head>
<body>
	<h2 class="title">공지사항</h2>
	<table class="table">
		<tr>
			<td class="text-center">제목</td>
			<td colspan="3">${notice.NT_title }</td>
		</tr>
		<tr>
			<td class="col-md-2 text-center">작성자</td>
			<td class="col-md-4">관리자</td>
			<td class="col-md-2 text-center">작성일</td>
			<td class="col-md-4">${notice.NT_regDate }</td>
		</tr>
		<tr>
			<td class="text-center">내용</td>
			<td colspan="3"><pre class="textBox">${notice.NT_content }</pre></td>
		</tr>
	</table>
	<div class="btnDiv" align="center">
		<a href="noticeList.do?pageNum=${pageNum }" class="btn_prev">목록</a>
	</div>
</body>
</html>