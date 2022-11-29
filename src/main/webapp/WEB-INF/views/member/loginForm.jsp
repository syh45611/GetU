<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/memberadmin/memberadmin.css">
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 body {
    padding-top: 0px;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}
input {   
 	width: 388px;
    height: 65px;
   border: none;
   border-bottom: 1px solid #000;
   outline: 0;
   font-size: 15px;
   margin-bottom: 16px;
   font-family: inherit;
   margin-left: 95px;
}
.btn {
    width: 388px;
    height: 65px;
    background-color: var(--point-color);
    border: none;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    margin-bottom: 24px;
    cursor: pointer;
}
</style>
</head>
<body>
	<div class="container" style="margin-top: 80px">
		<form action="loginResult.do" method="post">      
	         <img alt="header이미지" src="resources/images/mainLogo10.jpg" style="width: 300px; margin-left: 150px; margin-bottom: 50px;">
		         <input type="text" name="memberId" required="required"   autofocus="autofocus" placeholder="아이디"> 
		         <input type="password" name="memberPass" required="required" placeholder="비밀번호">
	         <input type="submit" class="btn" value="로그인">
      </form>
	  <ul style="list-style-type: none;">
   		<li><a id="naverIdLogin_loginButton" href="javascript:void(0)">
            <img alt="" src="resources/images/naverlogin.jpg" 
          				style=" margin-bottom: 0px;  margin-top: -26px; margin-left: 74px;height: 68px;"></a>   
       </li>
	  </ul>
		<ul style="list-style-type: none;">
			<li><a href="#" onclick="kakaoLogin()">
		  	  <img alt="" src="resources/images/kakaologin.jpg" 
		    			style="margin-bottom: -3px; height: 68px;  margin-top: -9px; margin-left: 74px;"></a>   
     		</li>      
		</ul>
  		 <a href ="joinForm.do" style="margin-left: 100px">회원가입</a>
     	 <a style="margin-left: 160px" href="findForm.do">아이디/비밀번호 찾기</a>
	</div>
<!-- 네이버 스크립트 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<script>

var naverLogin = new naver.LoginWithNaverId(
      {
         clientId: "KSlPyJ36zqn6mkst5lYV", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
         callbackUrl: "http://localhost:8080/GetU/naverChk.do", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.         
         isPopup: false,
         callbackHandle: true
      }
   );   
naverLogin.init();
window.addEventListener('load', function () {
   naverLogin.getLoginStatus(function (status) {
      if (status) {
         var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.          
         console.log(naverLogin.user);           
            if( email == undefined || email == null) {
            alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
            naverLogin.reprompt();
            return;
         }
      } else {
         console.log("callback 처리에 실패하였습니다.");
      }
   });
});
var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
   openPopUp();
   setTimeout(function() {
      closePopUp();
      }, 1000);   
}
</script>
<button  id="naverIdLogin_loginButton"></button>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('861c7ac8d8edd9756fd2467688343065'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {     
	           console.log(response);
	           const kaka = JSON.stringify(response.kakao_account); 
	           const kaka2 = JSON.stringify(response.properties); 
	           console.log(kaka);           
	           const ka2 = JSON.parse(kaka2);
	           const ka = JSON.parse(kaka);           
	           const ka3 = JSON.stringify(ka2.nickname);
	           const ka4 = JSON.stringify(ka.email);           
        location.href="kakaoLoginResult.do?account_email="+ka4+"&memberId="+ka3;           
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
</script>
</body>
</html>