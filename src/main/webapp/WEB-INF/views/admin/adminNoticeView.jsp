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
<script type="text/javascript">
	function del() {
		var cf = confirm("공지사항을 삭제하시겠습니까?");
		if(cf) {
			location.href="adminNoticeDelete.do?NT_num=${notice.NT_num }&pageNum=${pageNum }";
		} else {
			alert("삭제가 취소 되었습니다");
			return;
		}
	}
</script>
</head>
<body>
	<h2 class="title">공지사항</h2>
	<table class="table">
		<tr>
			<td class="text-center col-lg-2" style="width: 30%;">제목</td>
			<td class="col-lg-10">${notice.NT_title }</td>
		</tr>
		<tr>
			<td class="col-lg-2 text-center" style="width: 30%;">작성자</td>
			<td class="col-lg-4">관리자</td>
		</tr>
		<tr>
			<td class="col-lg-2 text-center" style="width: 30%;">작성일</td>
			<td class="col-lg-4">${notice.NT_regDate }</td>
		</tr>
		<tr>
			<td class="text-center" style="width: 30%;">내용</td>
			<td><pre class="textBox">${notice.NT_content }</pre></td>
		</tr>
	</table>
	<div align="center">
		<a href="adminNoticeList.do?pageNum=${pageNum }" class="btn_prev">목록</a> /
		<a href="adminNoticeUpdateForm.do?NT_num=${notice.NT_num }&pageNum=${pageNum}">수정</a> /
		<a onclick="del()" class="btn_prev">삭제</a>
	</div>
</body>
</html>