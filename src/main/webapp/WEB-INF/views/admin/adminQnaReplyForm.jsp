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
<script type="text/javascript">
	$(document).ready( function(){ 
		var fileTarget = $('.filebox .upload-hidden'); 
		
		fileTarget.on('change', function(){ // 값이 변경되면 
			if(window.FileReader){ // modern browser 
				var filename = $(this)[0].files[0].name;
			} 
			else { // old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} 
		// 추출한 파일명 삽입 
		$(this).siblings('.upload-name').val(filename);
		}); 
	});
</script>
</head>
<body>
<div align="center">
	<h2 class="title">1:1 문의답글</h2>
	<form action="adminQnaReplyResult.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="QA_num" value="${QA_num }">	 <!-- model 컬럼명과 일치해야함 -->
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="QA_ref" value="${QA_ref }">
		<input type="hidden" name="QA_refLevel" value="${QA_refLevel }">
		<input type="hidden" name="QA_refStep" value="${QA_refStep }">
		<table class="table narrowWidth">
			<c:if test="${num==0 }">
				<tr>
					<td><input type="text" name="QA_title" required="required" autofocus="autofocus" class="inputLine" placeholder="제목을 입력하세요"></td>
				</tr>
			</c:if>
			<c:if test="${num!=0 }">
				<tr>
					<td><input type="text" name="QA_title" required="required" autofocus="autofocus" value="답변)${QA_title }"></td>
				</tr>
			</c:if>
			<tr>
				<td><textarea rows="10" cols="100" name="QA_content" required="required" class="inputLine" placeholder="내용을 입력하세요"></textarea></td>
			</tr>
			<tr>
				<td class="text-center"><input type="submit" value="답글 작성" class="btn_small"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>