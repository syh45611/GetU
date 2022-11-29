<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/memberadmin/memberadmin.css">
<style type="text/css">
	#name{
		width:20%;
	}
	body {
	padding-top: 0px;
}	
</style>
</head>
<body>
<div align="center">
	<h2 class="title"> 문의내역 </h2>
	<table class="table">
		<tr>
			<td class="col-md-2 text-center" id="name">제목</td>
			<td class="col-md-10">${qna.QA_title }</td>
		</tr>
		<tr>
			<td class="col-md-2 text-center" id="name">내용</td>
			<td><pre class="textBox"><c:out value="${qna.QA_content }"/></pre></td>
		</tr>
		<tr>
			<td class="col-md-2 text-center" id="name">첨부파일</td>			
				<td><img alt="첨부파일이 없습니다" src="/GetU/resources/upload/${qna.QA_fileName }" width="300"></td>
		</tr>
	</table>
	</div>
	<div align="center" >
			<a href="qnaList.do?pageNum=${pageNum}&memberNo=${memberNo}" class="btn_prev">목록</a>			
	</div>	
</body>
</html>