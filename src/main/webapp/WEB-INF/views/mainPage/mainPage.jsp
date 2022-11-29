<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@alphardex/aqua.css/dist/aqua.min.css">
	<style type="text/css">
		ul 
		{ 
			list-style: none; 
			display: flex;
		}
		
		p 
		{ 
			padding: 10px; 
		}  
		
		.div1
		{
			display: flex;
	    	justify-content: center;
	    	flex-direction: row;
	    	font-color : #F5DEB3;
	    	padding : 12px;
	  		font-weight : bold;
		}
		
		select
		{
			padding : 8px;
			block-size : 48px;
			background-color : #FFFAF0;
			font-weight : bold;
			width : 123px;
			border : 2px solid black;
		}
		
		.sv
		{
			padding : 8px;
			block-size : 40px;
			background-color : #FFFAF0;
			font-weight : bold;
			width : 400px;
			height : 48px;
			border : 2px solid black;
		}
		
		.sm
		{
			padding : 8px;
			block-size : 48px;
			background-color : #FFFAF0;
			font-weight : bold;
			width : 77px;
			border : 2px solid black;
		}
		
		a
		{
			text-decoration : none;
		}
		
		#li1 > p
		{
			color : #F8F8FF;
		}
		
		.info
		{
			color : #222222;
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
			      		i 
			      		{
			        		transform: scale(0.75) translate(-16%, 0);
			      		}
			
			      		span 
			      		{
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
			}
		}
		
		.imgC1
		{
			position : relative;
			width : 100%;
			height : 200px;
			overflow : hidden;
		}
		
		.imgC2
		{
			position : absolute;
			top : 0;
			bottom : 0;
			right : -200%;
			left : -200%;
		}
		
		.imgC3
		{
			display : block;
			margin : 0 auto;
			max-width : 100%;
			max-height : 60%;
		}
		
		.imgC4
		{
			width : 40px;
			height : 40px;
			margin-top : 60px;
		}
		
		.imgC5
		{
			position : absolute;
			top : 0px;
			bottom : 0px;
			right : -200%;
			left : -200%;
		}
	</style>
</head>
<body>
	<section>
		<div class = "imgC1" style="margin-top: 50px;" >
			<div class = "imgC2">
				<img alt="header이미지" src="resources/images/mainLogo10.jpg" class="imgC3">
			</div>
		</div>
		<div class="div1" style="margin-top: -40px;">
			<form action="searchResult.do" name="SCB">
				<select name="searchKey">
					<option value="houseLoc">지역</option>
					<option value="houseName">숙소이름</option>
					<option value="houseAddr">숙소주소</option>
				</select> 
				<input class="sv" type="text" name="searchValue" placeholder="검색어를 입력해주세요."> 
				<input class="sm" type="submit" value="검색">
			</form>
		</div>
	</section>
	<section>
		<h1 style="font-size:40px; color:#86B6F6; text-align:center; padding:2px; padding-top:64px; margin:0px;"> 인기 숙소 </h1>
		<div>
			<div class="div1">
				<ul>
					<div>
						<c:if test="${startPage > PAGE_PER_BLOCK}">
							<div class="imgC4">
								<button style="width:40px; height:40px; margin:0px; position:absolute;" class="btn btn-primary btn-ghost btn-open" onclick="location.href='mainPage.do?pageNum=${startPage-1}'">
									<div class="imgC5">
										<img style="margin:0px; max-width:100%; max-height:100%;" alt="이전" src="resources/images/arrow_left1.png">
									</div>
								</button>	
							</div>
						</c:if>
						<c:if test="${pageNum > 1}">
							<div class="imgC4">
								<button style="width:40px; height:40px; margin:0px; position:absolute;" class="btn btn-primary btn-ghost btn-open" onclick="location.href='mainPage.do?pageNum=${currentPage-1}'">
									<div class="imgC5">
										<img style="margin:0px; max-width:100%; max-height:100%;" alt="이전" src="resources/images/arrow_left1.png">
									</div>
								</button>	
							</div>
						</c:if>
					</div>
					<li id="li1" onclick="location.href='mainPage.do'"><br> 
						<c:if test="${not empty HousePageList}">
							<c:forEach var="HPL" items="${HousePageList}">
								<li style="width:200px; table-layout:fixed; overflow:hidden;">
									<a class="info" href="houseContent.do?houseNo=${HPL.houseNo}"> 
										<img src="resources/images/${HPL.houseNo}.jpg" width="200" style="border-radius: 10%; padding:10px;" alt="숙소 포스터">
										<div>
											<p>
												${HPL.houseName}<br> 
												${HPL.houseAddr}<br> 
												평균★ ${HPL.avgScore}점
											</p>
										</div>
									</a>
								</li>
							</c:forEach>
						</c:if>
						<div>
							<c:if test="${currentPage < totalPage}">
								<div class="imgC4">
									<button style="width:40px; height:40px; margin:0px; position:absolute;" class="btn btn-primary btn-ghost btn-open" onclick="location.href='mainPage.do?pageNum=${currentPage+1}'">
										<div class="imgC5">
											<img style="margin:0px; max-width:100%; max-height:100%;" alt="이전" src="resources/images/arrow_right.png">
										</div>
									</button>
								</div>
							</c:if>
							<c:if test="${endPage < totalPage}">
								<div class="imgC4">
									<button style="width:40px; height:40px; margin:0px; position:absolute;" class="btn btn-primary btn-ghost btn-open" onclick="location.href='mainPage.do?pageNum=${endPage+1}'">
										<div class="imgC5">
											<img style="margin:0px; max-width:100%; max-height:100%;" alt="이전" src="resources/images/arrow_right.png">
										</div>
									</button>
								</div>
							</c:if>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div>
		<%@ include file="../footer.jsp"%>
		</div>
	</section>
</body>
</html>