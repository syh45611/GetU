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
	function chkId(){
		if(!frm2.memberId.value) {
			alert("아이디를 입력하세요");
			frm2.memberId.focus();
			return false;
		}else{
				$.post("confirmId.do", "memberId="+frm2.memberId.value, function(data){
					$('#err_Id').html(data);
				});
			} 
		}
	function chkPass(){
		var pw = $("#memberPass").val();
		if(pw.length<8) {
			$('#err_pass').html("8자리 이상 입력해주세요");
			frm2.memberPass.focus();
			frm2.memberPass.value="";
			return false;
		}else {
			$('#err_pass').html("사용가능한 비밀번호입니다");
		}
	}
	
	/* 비밀번호 확인 일치여부 체크 */
	function chkPassword() {
		if(frm2.memberPass.value!=frm.confirmPassword.value){
			alert("비밀번호가 일치하지 않습니다")
			frm2.memberPass.focus();
			frm2.memberPass.value="";
			frm2.confirmPassword.value="";
			return false;
		}
	}
	function chkEmail(){
		if(!frm2.memberEmail.value) {
			alert("이메일을 입력하세요")
			frm2.memberEmail.focus();
			return false;
			}else{
				$.post("confirmEmail.do", "memberEmail="+frm2.memberEmail.value, function(data){
					$('#err_Email').html(data);
				});
			} 
		}

</script>
</head>
<body>
	<form action="join.do" method="post" name="frm2" onsubmit="return chkPassword()">
		<!-- 엔터키 전송 막기 -->
	 	<div style="display:none">
			<input type="submit" onclick="return false">
			<input type="text">
		</div> 		
		<div class="container1">
			<img alt="header이미지" src="resources/images/mainLogo10.jpg" style="width: 300px; margin-left: 150px; margin-bottom: 50px;">
				<!-- 이름 -->
			<div>
				<input type="text" name="memberName" placeholder="이름" required="required" autofocus="autofocus" >
			</div>					
			<!-- 아이디 -->
			<div>
				<input type="text" name="memberId" class="inputBox-left" placeholder="아이디" required="required" > 
				<input type="button" value="아이디 확인" onclick="chkId()">
				<div class="chk-msg" id="err_Id"></div>
			</div>		
			<!-- 비밀번호 -->
			<div class="check">
				<input type="password" name="memberPass" id="memberPass" placeholder="비밀번호" required="required" onChange="chkPass()"> 
				<div class="chk-msg" id="err_pass"></div>
			</div>
				<input type="password" name="confirmPassword" id="confirmPassword" placeholder="비밀번호 확인" required="required" > 
				<!-- 이메일 -->
			<div class="check">
				<input type="email" name="memberEmail" class="inputBox-left" placeholder="이메일" required="required"> 
				<input type="button" value="이메일 확인" onclick="chkEmail()">
			<div class="chk-msg" id="err_Email"></div>
			</div> 				
			<!-- 성별 -->
			<div class= "select-gender">
				<input class="magic-radio" type="radio" name="memberGender" id="mal" value="m" checked="checked">
				<label for="mal" class="radio-left">남자</label>
				<input class="magic-radio" type="radio" name="memberGender" id="fem" value="w">
				<label for="fem" >여자</label>
			</div><br>			
			</div>
			<!-- 회원가입 버튼 -->
			<div>
			<input type="submit" class="btn_submit-btn" value="회원가입">
			</div>
	</form>
</body>
</html>