<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %> 
<!DOCTYPE html>
<html>
<%@ include file="sessionChk.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		.container_middle
		{
			padding-top : 48px;
			padding-bottom : 18px;
			padding-left : 280px;
			padding-right : 280px;
		}
		
		.content_main
		{
			position : relative;
			left : 60px;
			list-style: none; 
			display: flex;
		}
		
		.CT
		{
			text-align : center;
			position : relative;
			left : 28px;
			table-layout : fixed;
			overflow : hidden;
			width : 400px;
		}
		
		.CT td
		{
			overflow : hidden;
		}
	</style>
</head>
<body>
	<div class="container_middle">
		<jsp:include page="myPageMain.jsp"></jsp:include>
		<div class="content">
			<ul class="content_main">
				<li style="padding:8px; width:380px; position:relative; left:2%;">
					<h2 style="font-size:23px; font-weight:bold;"> 결제 목록 </h2>
					<c:if test="${reservationPageList.size() == 0}">
						<p> 예약 기록이 없습니다 </p>
					</c:if>
					<c:if test="${reservationPageList.size() != 0}">
						<table class="CT" style="font-family: 'GmarketSansMedium', sans-serif;">
							<tr>
								<th>숙소이름    </th>
								<th>날짜    </th>
							</tr>
							<c:forEach items="${reservationPageList}" var="RL" varStatus="RLindex">
								<tr>
									<td>${houseNameList[RLindex.index]}</td>
									<td>${RL.chkIn}</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</li>
				<li style="padding:8px; position:relative; left:24%; width:380px;">
					<h2 style="font-size:23px; font-weight:bold;"> 리뷰 목록 </h2>
					<c:if test="${empty reviewList}">
						<p> 작성된 리뷰가 없습니다 </p>
					</c:if>
					<c:if test="${not empty reviewList}">
						<table class="CT" style="font-family: 'GmarketSansMedium', sans-serif;">
							<tr>
								<th>리뷰제목    </th>
								<th>리뷰내용    </th>
							</tr>
							<c:forEach items="${reviewList}" var="review">
								<tr>
									<td>${review.reviewSubject}</td>
									<td>${review.reviewContent}</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>