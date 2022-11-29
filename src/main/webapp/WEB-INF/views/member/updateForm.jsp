<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/memberadmin/memberadmin.css">
<link rel="stylesheet" href="resources/memberadmin/magic-check.css">
<style type="text/css">
	input {
	width: 100%;
	height: 48px;
	border: none;
	border-bottom: 1px solid #000;
	outline: 0;
	font-size: 15px;
	margin-bottom: 16px;
	font-family: inherit;
}
body {
	padding-top: 0px;
}

</style>
<script type="text/javascript">
	/* 비밀번호 일치여부 확인 */
	function chkPassword() {
		if(frm.memberPass.value!=frm.confirmPassword.value){
			alert("비밀번호가 일치하지 않습니다")
			frm.memberPass.focus();
			frm.memberPass.value="";
			frm.confirmPassword.value="";
			return false;
		}
	}	
</script>
</head>
<body>
<div class="container">
	<h1 class="title">비밀번호 수정</h1>
	<form action="updateResult.do" method="post" name="frm" onsubmit="chkPassword()">
		<!-- 엔터키 전송 막기 -->
		<div style="display:none">
			<input type="submit" onclick="return false"/>
			<input type="text"/>
		</div>			
			<!-- 이름 -->
			<div>
				<input type="text" name="memberName" readonly="readonly" value="${member.memberName }" placeholder="${member.memberName }">
			</div>
			<!-- 아이디 -->
			<div>
				<input type="text" name="memberId" readonly="readonly" value="${member.memberId }" placeholder="${member.memberId }">
			</div>
			<!-- 이메일 -->
			<div class="check">
				<input type="email" name="memberEmail" readonly="readonly" value="${member.memberEmail }" placeholder="${member.memberEmail }"> 
			</div>
			<!-- 비밀번호 -->
			<div>
				<input type="password" name="memberPass" placeholder="비밀번호" required="required" > 
			</div>
			<div>
				<input type="password" name="confirmPassword" placeholder="비밀번호 확인" required="required" onChange="chkPassword()"> 
			</div>	
			<!-- 성별 -->
			<div class= "select-gender">
				<input class="magic-radio" type="radio" name="memberGender" id="mal" value="m" checked="<c:if test="${member.memberGender=='m'}">checked</c:if>">
				<label for="mal" class="radio-left">남자</label>
				<input class="magic-radio" type="radio" name="memberGender" id="fem" value="w" checked="<c:if test="${member.memberGender=='w'}">checked</c:if>">
				<label for="fem" >여자</label>
			</div><br>
			<!-- button -->
			<div>
				<input type="submit" class="btn_submit-btn" value="비밀번호 수정">
			</div>			
	</form>
</div>
</body>
</html>