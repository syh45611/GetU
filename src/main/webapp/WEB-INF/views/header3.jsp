<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous">
</script>
<!DOCTYPE html>
<html style="font-size: 16px; " lang="en" >
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords" content="">
<meta name="description" content="">
<title>main</title>
<link rel="stylesheet" href="resources/testImage/nicepage.css"
	media="screen">
<link rel="stylesheet" href="resources/testImage/Home.css"
	media="screen">
<script class="u-script" type="text/javascript"
	src="resources/bootstrap/js/jquery.js" defer=""></script>
<script class="u-script" type="text/javascript"
	src="resources/testImage/nicepage.js" defer=""></script>
<meta name="generator" content="Nicepage 4.21.5, nicepage.com">
<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">

<script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "header"
}</script>
<meta name="theme-color" content="#478ac9">
<meta property="og:title" content="Home">
<meta property="og:type" content="website">
<script type="text/javascript">
	function ssChk(name) {
		if (${memberId == null}) {
			var con = confirm("로그인 후 이용해 주시기 바랍니다.");			
			if (con) {
				if (name == 'main') {
					location.href = "mainPage.do";
				} 
			} 
		} else {	
				location.href = "myPage.do";				
	}
}
</script>
</head>
<body class="u-body u-xl-mode" data-lang="en" >
	<header class="u-clearfix u-custom-color-1 u-header u-header"
	id="sec-8c59" 
		>
		<div class="u-clearfix u-sheet u-sheet-1">
			<nav class="u-menu u-menu-one-level u-offcanvas u-menu-1">
				<div class="menu-collapse"
					style="font-size: 1rem; letter-spacing: 0px;">
					<a
						class="u-button-style u-custom-color u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-text-active-color u-custom-text-color u-custom-text-hover-color u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
						href="#"> <svg class="u-svg-link" viewBox="0 0 24 24">
							<use xmlns:xlink="http://www.w3.org/1999/xlink"
								xlink:href="#menu-hamburger"></use></svg> <svg class="u-svg-content"
							version="1.1" id="menu-hamburger" viewBox="0 0 16 16" x="0px"
							y="0px" xmlns:xlink="http://www.w3.org/1999/xlink"
							xmlns="http://www.w3.org/2000/svg">
							<g>
							<rect y="1" width="16" height="2"></rect>
							<rect y="7" width="16" height="2"></rect>
							<rect y="13" width="16" height="2"></rect>
</g></svg>
					</a>
				</div>
				<div class="u-custom-menu u-nav-container">
					<ul class="u-nav u-unstyled u-nav-1">
				
						<c:if test="${memberId == null }">
							<c:if test="${memberId != 'admin'}">
								<li class="u-nav-item"><a
									class="u-button-style u-custom-color-1 u-nav-link u-text-active-grey-80 u-text-body-alt-color u-text-hover-palette-1-dark-1"
									href="logout.do" style="padding: 10px 20px;">로그아웃</a></li>
							</c:if>
							<c:if test="${memberId == 'admin'}">
								<li class="u-nav-item"><a
									class="u-button-style u-custom-color-1 u-nav-link u-text-active-grey-80 u-text-body-alt-color u-text-hover-palette-1-dark-1"
									href="logout.do" style="padding: 10px 20px;">로그아웃</a></li>
							</c:if>
						</c:if>
					</ul>
				</div>
			</nav>
		
		<img src="resources/images/mainLogo.jpg" width="120" style="margin-top: -34px;">
		</div>
	</header>




</body>
</html>
