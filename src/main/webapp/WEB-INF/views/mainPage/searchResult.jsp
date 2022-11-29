<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@alphardex/aqua.css/dist/aqua.min.css">
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
		}
		
		.list
		{ 
			float : left; 
			padding : 10px;
		}
		
		span
		{
			font-size : 18px;
		}
		
		ul
		{
			list-style: none; 
			display: flex;
			align-content : flex-start;
			flex-wrap : wrap;
		}
		
		li
		{
			padding : 28px;
		}
		
		.btn 
		{
			margin: 1rem;
		
			&-open 
			{
    			transition: 0.3s;

   				&::before 
   				{
			      position: absolute;
			      content: "";
			      top: 0;
			      left: 0;
			      z-index: -1;
			      width: 100%;
			      height: 100%;
			      background: var(--btn-bg);
			      transform: scaleX(0);
			      transition: 0.3s;
    			}
			  &-jittery 
			  {
			    animation: jittery 4s infinite;
			  }
			
			  &-icon 
			  {
			    position: relative;
			    margin-left: 8px;
			    overflow: hidden;
			
			    i 
			    {
			      position: absolute;
			      top: 41%;
			      left: 48%;
			      transform: scale(0.75) translate(-16%, 400%);
			      transition: 0.2s;
			    }
			
			    span 
			    {
			      display: flex;
			      justify-content: center;
			      align-items: center;
			      transition: 0.2s;
			    }
			
			    &:hover 
			    {
			      i {
			        transform: scale(0.75) translate(-16%, 0);
			      }
			
			      span {
			        transform: translateY(-400%);
			      }
			    }
			  }
			
			  &-jelly 
			  {
			    &:hover 
			    {
			      animation: jelly 0.5s;
			    }
			  }
			
			  &-fill 
			  {
			    transition: 0.3s;
			
			    &:hover 
			    {
			      background: transparent;
			      box-shadow: inset 0 0 0 36px var(--btn-bg);
			    }
			  }
			
			@keyframes jittery 
			{
			  5%,
			  50% 
			  {
			    transform: scale(1);
			  }
			
			  10% 
			  {
			    transform: scale(0.9);
			  }
			
			  15% 
			  {
			    transform: scale(1.15);
			  }
			
			  20% 
			  {
			    transform: scale(1.15) rotate(-5deg);
			  }
			
			  25% 
			  {
			    transform: scale(1.15) rotate(5deg);
			  }
			
			  30% 
			  {
			    transform: scale(1.15) rotate(-3deg);
			  }
			
			  35% 
			  {
			    transform: scale(1.15) rotate(2deg);
			  }
			
			  40% 
			  {
			    transform: scale(1.15) rotate(0);
			  }
			}
			
			@keyframes jelly 
			{
			  25% 
			  {
			    transform: scale(0.9, 1.1);
			  }
			
			  50% 
			  {
			    transform: scale(1.1, 0.9);
			  }
			
			  75% 
			  {
			    transform: scale(0.95, 1.05);
			  }
			}
			
			@keyframes pulse 
			{
			  from 
			  {
			    box-shadow: 0 0 0 0 var(--btn-bg);
			  }
			}
			
			@keyframes move-left 
			{
			  to 
			  {
			    transform: translateX(-100%);
			  }
		}
	</style>
</head>
<body>
	<div class="container_middle">
		<div class="content">
			<c:if test="${resultHousePageList.size() == 0}">
				<ul class="noItems">
					<li>
						<span style="font-size : 28px; font-weight:bold; font-weight : 484; margin-top : 28px; padding : 21px; text-align : center;"> 검색 결과가 없습니다 </span>
					</li>
				</ul>
			</c:if>
			<c:if test="${resultHousePageList.size() != 0}">
				<h3 style="font-size:28px; font-weight:bold; position:relative; left:8%;"> 검색 결과 </h3>
				<ul>
					<c:forEach var="RHPL" items="${resultHousePageList}">
						<li class="list" style="width:330px; table-layout:fixed; overflow:hidden;">
							<a href="houseContent.do?houseNo=${RHPL.houseNo}">
								<img style="padding:2px; margin-top:18px;" alt="포스터" src="resources/images/${RHPL.houseNo}.jpg"> 
							</a>
							<div class="txt_area" style="text-align:center; padding:2px; margin-top:28px;">
								<a class="cursor" style="font-family:'GmarketSansMedium', sans-serif;">
									<span class="txt_title" style="font-size : 23px; font-weight : 678; padding : 8px;">${RHPL.houseName}</span>
									<br>
									<span class="txt" style="color:black;"><span style="color:#86B6F6;">숙소위치  </span>${RHPL.houseLoc}</span>
									<br>
									<span class="txt" style="color:black;"><span style="color:#86B6F6;">주소  </span>${RHPL.houseAddr}</span>
									<br>
									<span class="txt" style="color:black;"><span style="color:#86B6F6;">전화번호  </span>${RHPL.houseTel}</span>
									<br>
									<span class="txt" style="color:black;"><span style="color:#86B6F6;">평균★  </span>${RHPL.avgScore}점</span>
									<br>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>	
				<div class="paging">
					<div class="items" style="display:flex;">
						<div style="position:relative; left:30%;">
							<c:if test="${pageNum > 1}">
								<button class="btn btn-primary btn-ghost btn-open" style="margin:0px; margin-top:28px; padding:2px; position:relative;" onclick="location.href='searchResult.do?pageNum=${currentPage-1}&searchKey=${searchKey}&searchValue=${searchValue}'">
									<img alt="이전" src="resources/images/arrow_left1.png">
								</button>
							</c:if>
						</div>
						<div style="position:relative; left:63%;">
							<c:if test="${currentPage < totalPage}">
								<button class="btn btn-primary btn-ghost btn-open" style="margin:0px; margin-top:28px; padding:2px; position:relative;" onclick="location.href='searchResult.do?pageNum=${currentPage+1}&searchKey=${searchKey}&searchValue=${searchValue}'">
									<img alt="이전" src="resources/images/arrow_right.png">
								</button>
							</c:if>
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>