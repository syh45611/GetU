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
	<h2 class="title">공지사항</h2>
	<div class="searchDIV">
		<form action="adminNoticeList.do">
		<input type="hidden" name="pageNum" value="1">
			<select name="search" class="inputUnderLine">
				<c:forTokens var="sh" items="NT_title,NT_content,subcon" delims="," varStatus="i">
					<c:if test="${sh == notice.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != notice.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
			<input type="text" name="keyword" value="${notice.keyword }" class="inputUnderLine">
			<input type="submit" value="검색" class="btn_search">
		</form>
		</div>
		<table class="table">
			<tr>
				<th class="col-md-1 text-center" style="width: 15%;">번호</th>
				<th class="col-md-6 text-center" style="width: 45%;">제목</th>
				<th class="col-md-2 text-center" style="width: 20%;">작성자</th>
				<th class="col-md-2 text-center" style="width: 20%;">작성일</th>		
			</tr>
					<c:if test="${empty noticeAllList }">
				<tr>
					<th colspan="5" class="text-center">공지사항이 존재하지 않습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty noticeAllList }">
				<c:forEach var="notice" items="${noticeAllList }">
					<tr>
						<td class="col-md-1 text-center">${notice.NT_num }</td>
						<td class="col-md-6 text-center">
							<a href="adminNoticeView.do?NT_num=${notice.NT_num}&pageNum=${pb.currentPage}" class="menuTitle">${notice.NT_title }</a>										
						</td>
						<td class="col-md-2 text-center">관리자</td>
						<td class="col-md-2 text-center">${notice.NT_regDate }</td>			
					</tr>
				</c:forEach>
			</c:if>
			<tr>   
				<td colspan="4">
					<div class="btn_small" align="right">
						<a href="adminNoticeWriteForm.do?NT_num=0&pageNum=1">작성</a>
					</div>
				</td>
			</tr>
		</table>
		<div align="center" id="page_btn">
			<ul class="pagination_bottom">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<button onclick="location.href='adminNoticeList.do?pageNum=1&search=${notice.search }&keyword=${notice.keyword }'"
							class="page_num"><span class="glyphicon glyphicon-backward"></span>
					</button>
					<button onclick="location.href='adminNoticeList.do?pageNum=${pb.startPage - 1 }&search=${notice.search }&keyword=${notice.keyword }'"
							class="page_num"><span class="glyphicon glyphicon-triangle-left"></span>
					</button>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<button onclick="location.href='adminNoticeList.do?pageNum=${i }&search=${notice.search }&keyword=${notice.keyword }'"
							class="page_num page_current_num">${i}</button>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<button onclick="location.href='adminNoticeList.do?pageNum=${i }&search=${notice.search }&keyword=${notice.keyword }'"
							class="page_num">${i}</button>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<button onclick="location.href='adminNoticeList.do?pageNum=${pb.endPage + 1 }&search=${notice.search }&keyword=${notice.keyword }'"
						class="page_num"><span class="glyphicon glyphicon-triangle-right"></span>
					</button>
					<button onclick="location.href='adminNoticeList.do?pageNum=${pb.totalPage }&search=${notice.search }&keyword=${notice.keyword }'"
						class="page_num"><span class="glyphicon glyphicon-forward"></span>
					</button>
				</c:if>
			</ul>
		</div>
</body>
</html>