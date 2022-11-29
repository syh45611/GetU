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
<style type="text/css">	
</style>
<script type="text/javascript">
	function del(memberNo) {
		var con = confirm("탈퇴처리 하시겠습니까?");
		if(con) {
			location.href="delete.do?memberNo="+memberNo;
		}
	}
	function chk(){
		if(!frm2.searchValue.value){
			alert("검색어를 입력하세요");
			frm.searchValue.focus();
			return false;
		}
	}
</script>
</head>
<body>
<section class="container_wide">
		<div class="searchForm">
			<form action="adminFindMember.do" name="frm2" onsubmit="return chk();" >
				<select name="searchKey" class="searchTab">
					<option value="memberId" >아이디</option>
					<option value="memberName">이름</option>
				</select>
				<input type="text" name="searchValue" class="searchTab" placeholder="검색어를 입력해주세요." required="required">
				<input type="submit" value="검색" class="searchTab">
			</form>
		</div>
	<div class="container-table">	
		<table>
			<tr>
				<th>회원번호</th><th>이름</th><th>아이디</th><th>이메일</th><th>성별</th><th>회원가입일</th><th>탈퇴여부</th><th>탈퇴</th>
			</tr>
			<c:if test="${list2 == null}">
				<tr><td colspan="14">검색된 회원정보가 없습니다</td></tr>
			</c:if>
			<c:if test="${list2 != null}">
				<c:forEach var="member" items="${list2 }">
					<tr>
						<td>${member.memberNo}</td>
						<td>${member.memberName}</td>
						<td>${member.memberId}</td>
						<td>${member.memberEmail}</td>						
						<td>${member.memberGender}</td>
						<td>${member.reg_date}</td>				
						<td>${member.memberDel}</td>						
						<td><a onclick="del(${member.memberNo})" class="btn_small">탈퇴</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</section>
</body>
</html>