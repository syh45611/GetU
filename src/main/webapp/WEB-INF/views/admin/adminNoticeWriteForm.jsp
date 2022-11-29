<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/memberadmin/memberadmin.css">
<style type="text/css">
body {
	padding-top: 0px;
}
</style>
</head>
<body>
	<h2 class="title">공지사항 작성</h2>
		<form action="adminNoticeWriteResult.do" method="post" name="frm">
			<input type="hidden" name="NT_num" value="${NT_num }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<table class="table">
				<tr>
					<td class="col-md-1 text-center" style="width: 30%;">제목</td>
					<td class="col-md-11"><input type="text" name="NT_title" required="required" autofocus="autofocus" class="inputLine"></td>
				</tr>
				<tr>
					<td class="col-md-1 text-center" style="width: 30%;">작성자</td>
					<td>관리자</td>
				</tr>
				<tr>
					<td class="col-md-1 text-center" style="width: 30%;">내용</td>
					<td><textarea class="summernote" rows="5" cols="40" name="NT_content" required="required"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="작성" class="btn_sm_full"></td>
				</tr>
			</table>
		</form>
</body>
</html>