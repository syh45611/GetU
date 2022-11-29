<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %> 
<c:set var="memberNo" value="${sessionScope.memberNo }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		@import url("resources/myPageCSS/star.css")
	</style>
	<style>
		@font-face 
		{
    		font-family: 'GmarketSansMedium';
    		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    		font-weight: normal;
    		font-style: normal;
		}
	</style>
	<style type="text/css">
		* 
		{
		  box-sizing: border-box;
		  margin: 0;
		  padding: 0;
		}
		
		:root 
		{
		  --padding: 20px;
		}
		
		.box
		{
		  position: relative;
		  width: 400px;
		  height : 456px;
		  margin-top : 6%;
		  left : 35%;
		  display: flex;
		  flex-direction: column;
		  justify-content: center;
		  padding: var(--padding);
		  background-color: #c4dfff;
		  border-radius: 6px;
		}
	</style>
	<script type="text/javascript" src="../../js/jquery.js"></script>
</head>
<body>
	<h2 style="position:relative; top:77px; font-size:40px; font-weight:bold; color:#86B6F6; text-align:center;"> 결제정보 </h2>
	<div style="display:flex;">
		<div class="pic" style="position:relative; left:28%; margin-top:7%; padding:8px; width:280px;">
			<a href="houseContent.do?houseNo=${Res.houseNo}">
				<img style="width:353px;" src="resources/images/${Res.houseNo}.jpg" alt="포스터">
			</a>
		</div>
		<div class="box">
			<div class="info" style="font-family: 'GmarketSansMedium', sans-serif; position:relative; left:2%; top:-2%; width:363px; height:600px;">
				<p style="padding : 6px; font-size : 17px; font-weight : 555;">회원 : ${memberName}</p>
				<p style="padding : 4px;">숙소 : ${houseName}</p>			
				<p style="padding : 4px;">주소 : ${houseAddr}</p>
				<c:forEach var="rnl" items="${roomNameList}" varStatus="rnlIndex">
				<p style="padding : 4px;">예약 방 : ${roomNameList[rnlIndex.index]} </p>
				</c:forEach>
				<p style="padding : 4px;">체크인 : ${Res.chkIn}</p>
				<p style="padding : 4px;">체크아웃 : ${Res.chkOut}</p>
				<p style="padding : 4px;">방 개수 : ${Res.roomCount}</p>
			</div>	
	  	</div>
  	</div>
</body>
</html>