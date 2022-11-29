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
	select {
    border: none;
    width: 15%;
    height: 48px;
    font-size: 16px;
    border-bottom: 1px solid #000;
    margin-bottom: 16px;
    outline: 0;
}
table {
	margin-left:auto;
	margin-right:auto;
	width: 100%;
	margin-top: 5px;
	table-layout: fixed;
	border: 1px solid #444444;
}
body {
	padding-top: 0px;
}

</style>
<script type="text/javascript">
	function del(delMno) {
		var con = confirm("탈퇴처리 하시겠습니까?");
		if(con) {
			location.href="delete.do?memberNo="+delMno+"&memberId=${member.memberId }";
		}
	}
	function chk(){
		if(!frm.searchValue.value){
			alert("검색어를 입력하세요");
			frm.searchValue.focus();
			return false;
		}
	}
</script>
</head>
<body>
<section class="container_wide">
<h2 class="title">회원목록</h2>	
	<div class="top">
		<div class="searchForm">
			<form action="adminFindMember.do" name="frm" onsubmit="return chk();" >
				<select name="searchKey" class="searchTab">
					<option value="memberId" >아이디</option>
					<option value="memberName">이름</option>
				</select>
				<input type="text" name="searchValue" class="searchTab" placeholder="검색어를 입력해주세요." required="required">
				<input type="submit" value="검색" class="searchTab">
			</form>
		</div>
		<div class="btn_box">
			<a class="btn_stroke" href="joinForm.do">등록</a>	
		</div>
	</div>
	<div class="container-table">
		<table>
			<tr>
				<th>회원번호</th><th>이름</th><th>아이디</th><th>이메일</th><th>성별</th><th>회원가입일</th><th>탈퇴여부</th><th>탈퇴</th>
			</tr>
			<c:if test="${list == null} ">
				<tr><th colspan="14">회원 데이터가 존재하지 않습니다</th></tr>
			</c:if>
			<c:if test="${list != null}">
				<c:forEach var="member" items="${list }">
					<tr>
						<td>${member.memberNo}</td>
						<td>${member.memberName}</td>
						<td>${member.memberId}</td>
						<td style="font-size=100px;">${member.memberEmail}</td>
						<td>${member.memberGender}</td>
						<td>${member.reg_date}</td>						
						<td>${member.memberDel}</td>					
						<td><a onclick="del(${member.memberNo})" class="btn btn_small">탈퇴</a></td>
					</tr>
				</c:forEach>
			</c:if>			
		</table>
	</div>
	<div align="center">
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button onclick="location.href='adminMember.do?pageNum=${startPage - 1}&memberId=${member.memberId }'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage == i }">
				<button onclick="location.href='adminMember.do?pageNum=${i}&memberId=${member.memberId }'">${i }</button>
			</c:if>
			<c:if test="${currentPage != i }">
				<button onclick="location.href='adminMember.do?pageNum=${i}&memberId=${member.memberId }'">${i }</button>
			</c:if>		
		</c:forEach>
		<c:if test="${totalPage > endPage }">
			<button onclick="location.href='adminMember.do?pageNum=${endPage + 1}&memberId=${member.memberId }'">다음</button>
		</c:if>
	</div>
</section>
</body>
</html>