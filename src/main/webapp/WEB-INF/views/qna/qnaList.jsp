<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/memberadmin/memberadmin.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
body {
	padding-top: 0px;
}
</style>
</head>
<body>
<h1 class="title">문의내역</h1>
<div class="searchDIV">
	<form action="qnaList.do">
		<input type="hidden" name="pageNum" value="1">
		<input type="hidden" name="memberNo" value="${memberNo }">
			<select name="search" class="inputUnderLine">
				<c:forTokens var="sh" items="QA_title, QA_content, subcon" delims="," varStatus="i">
					<c:if test="${sh == qna.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != qna.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
				<input type="text" name="keyword" value="${qna.keyword }" class="inputUnderLine">
				<input type="submit" value="검색" class="btn_search">
			</form>
		</div>
<table class="table">
	<tr>
		<th class="col-md-8 text-center">제목</th>
		<th class="col-md-2 text-center" style="width: 20%;">작성일</th>		
	</tr>
	<c:if test="${empty list}">
		<tr>
			<td colspan="3" class="text-center">문의내역이 존재하지 않습니다</td>
		</tr>
	</c:if>
	<c:if test="${not empty list }">
		<c:forEach var="qna" items="${list }">
			<tr>
			<c:if test="${qna.QA_del != 'y' }">
				<c:if test="${qna.QA_refLevel > 0 }">					
					<td class="col-md-6 text-center">
						<a href="qnaView.do?QA_num=${qna.QA_num }&pageNum=${pb.currentPage}" class="menuTitle">${qna.QA_title }</a>			
					</td>		
					<td class="col-md-2 text-center">${qna.QA_regDate }</td>		
				</c:if>
				<c:if test="${qna.QA_refLevel == 0 }">
					<td class="col-md-6 text-center">
						<a href="qnaView.do?QA_num=${qna.QA_num }&pageNum=${pb.currentPage}&memberId=${memberId}" class="menuTitle">${qna.QA_title }</a>					
					</td>					
					<td class="col-md-2 text-center">${qna.QA_regDate }</td>
				</c:if>
			</c:if>
			</tr>
		</c:forEach>
	</c:if>	
</table>
<div align="center">
	<ul class="pagination_bottom">
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<button onclick="location.href='qnaList.do?pageNum=1&search=${qna.search }&keyword=${qna.keyword}&memberNo=${memberNo}'" 
					class="page_num"><span class="glyphicon glyphicon-backward"></span>
			</button>
			<button onclick="location.href='qnaList.do?pageNum=${pb.pagePerBlock }&search=${qna.search }&keyword=${qna.keyword}&memberNo=${memberNo}'" 
					class="page_num"><span class="glyphicon glyphicon-triangle-left"></span>
			</button>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
			<c:if test="${pb.currentPage == i }">
				<button onclick="location.href='qnaList.do?pageNum=${i}&search=${qna.search }&keyword=${qna.keyword}&memberNo=${memberNo}'" 
						class="page_num page_current_num">${i}
				</button>
			</c:if>
			<c:if test="${pb.currentPage != i }">
				<button onclick="location.href='qnaList.do?pageNum=${i}&search=${qna.search }&keyword=${qna.keyword}&memberNo=${memberNo}'" 
						class="page_num">${i}
				</button>
			</c:if>
		</c:forEach>
		<c:if test="${pb.endPage < pb.totalPage }">
			<button onclick="location.href='qnaList.do?pageNum=${pb.endPage+1 }&search=${qna.search }&keyword=${qna.keyword}&memberNo=${memberNo}'" 
					class="page_num">
				<span class="glyphicon glyphicon-triangle-right"></span>
			</button>
			<button onclick="location.href='qnaList.do?pageNum=${pb.totalPage }&search=${qna.search }&keyword=${qna.keyword}&memberNo=${memberNo}'" 
					class="page_num">
				<span class="glyphicon glyphicon-forward"></span>
			</button>
		</c:if>
	</ul>
</div>
</body>
</html>