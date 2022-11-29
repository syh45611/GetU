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
		<form action="adminQnaList.do">
			<input type="hidden" name="pageNum" value="1">
			<select name="search" class="inputUnderLine">
				<c:forTokens var="sh" items="QA_title, memberId, QA_content, subcon" delims="," varStatus="i">
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
			<th class="col-md-2 text-center" style="width: 20%;">작성자</th>
			<th class="col-md-6 text-center" style="width: 55%;">제목</th>
			<th class="col-md-2 text-center" style="width: 25%;">작성일</th>
		</tr>
		<c:if test="${qnaAllList == null}">
			<tr>
				<td colspan="4" class="text-center">문의내역이 존재하지 않습니다</td>
			</tr>
		</c:if>
		<c:if test="${qnaAllList != null }">
			<c:forEach var="qna" items="${qnaAllList }">
				<tr>
					<c:if test="${qna.QA_refLevel > 0 }">
						<td class="col-md-2 text-center">${qna.QA_regDate }</td>
						<td class="col-md-2 text-center">${qna.memberId }</td>
						<td class="col-md-6 text-center">
							<a href="adminQnaView.do?QA_num=${qna.QA_num }&pageNum=${pb.currentPage}" class="menuTitle">${qna.QA_title }</a>													
							</td>
						<td class="col-md-2 text-center">${qna.QA_del }</td>
					</c:if>
					<c:if test="${qna.QA_refLevel == 0 }">						
						<td class="col-md-2 text-center">${qna.memberId }</td>
						<td class="col-md-6 text-center">
							<a href="adminQnaView.do?QA_num=${qna.QA_num }&pageNum=${pb.currentPage}" class="menuTitle">${qna.QA_title }</a>
						</td>
						<td class="col-md-2 text-center">${qna.QA_regDate }</td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>
		<div align="center" id="page_btn">
			<ul class="pagination_bottom">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">					
					<button onclick="location.href='adminQnaList.do?pageNum=1&search=${qna.search }&keyword=${qna.keyword }
						&memberNo=${memberNo}'"	class="page_num"><span class="glyphicon glyphicon-backward"></span>
					</button>
					<button onclick="location.href='adminQnaList.do?pageNum=${pb.startPage - 1 }&search=${qna.search }
						&keyword=${qna.keyword }&memberNo=${memberNo}'"	class="page_num"><span class="glyphicon glyphicon-triangle-left"></span>
					</button>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<button onclick="location.href='adminQnaList.do?pageNum=${i }&search=${qna.search }&keyword=${qna.keyword }&memberNo=${memberNo}'"
							class="page_num page_current_num">${i }</button>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<button onclick="location.href='adminQnaList.do?pageNum=${i }&search=${qna.search }&keyword=${qna.keyword }&memberNo=${memberNo}'"
							class="page_num">${i }</button>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<button onclick="location.href='adminQnaList.do?pageNum=${pb.endPage + 1 }&search=${qna.search }
						&keyword=${qna.keyword }&memberNo=${memberNo}'"	class="page_num"><span class="glyphicon glyphicon-triangle-right"></span>
					</button>
					<button onclick="location.href='adminQnaList.do?pageNum=${pb.totalPage }&search=${qna.search }
					&keyword=${qna.keyword }&memberNo=${memberNo}'"	class="page_num"><span class="glyphicon glyphicon-forward"></span>
					</button>					
				</c:if>
			</ul>
	</div>
</body>
</html>