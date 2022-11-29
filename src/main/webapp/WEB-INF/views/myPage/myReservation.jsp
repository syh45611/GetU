<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %> 
<!DOCTYPE html>
<html>
	<%@ include file="sessionChk.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="resources/myPageCSS/MyPageContent.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@alphardex/aqua.css/dist/aqua.min.css">
	<style type="text/css">
		.list
		{ 
			float: left;
			padding: 10px;
		}
			
		.container_middle
		{
			padding-top : 2%;
			padding-bottom : 2%;
			padding-left : 14%;
			padding-right : 14%;
		}
			
		.content_main
		{
			position : relative;
			left : 2%;
			list-style: none; 
			display: flex;
		}
			
		.CT
		{
			text-align : center;
			position : relative;
			left : 28px;
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
		
		.list
		{
			position : relative;
			left : 2%;
			padding : 8px;
		}
		
		.items
		{
			position : relative;
			text-align : center;
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
		<jsp:include page="myPageMain.jsp"></jsp:include>
		<div class="content" style="margin-left:5%;">
			<c:if test="${reservationPageList.size() == 0}">
				<ul class="noItems">
					<li>
						<span class="txt_title"> 예약이 없습니다 </span>
					</li>
				</ul>
			</c:if>
			<c:if test="${reservationPageList.size() != 0}">
				<h3 style="position:relative; left:4%;"> 결제 목록 ${total} </h3>
				<ul>
					<c:forEach var="rpl" items="${reservationPageList}" varStatus="rplindex">
						<li class="list">
							<div style="display:flex;">
								<div>
									<a href="houseContent.do?houseNo=${rpl.houseNo}">
										<img src="resources/images/${rpl.houseNo}.jpg" width="180" style="border-radius: 10%; padding:8px;" alt="숙소 포스터">
									</a>
								</div>
								<div class="txt_area" style="overflow-x:hidden; width:50%; height:191px;">
									<a href="reservationContent.do?resNo=${rpl.resNo}" class="cursor">
										<span class="txt_title" style="margin-top:17px;">${houseNameList[rplindex.index]}</span><br>
										<span class="txt"><span>체크인  </span> ${rpl.chkIn}</span><br>
										<span class="txt"><span>체크아웃  </span> ${rpl.chkOut}</span><br>
									</a>
								</div>
	  						</div>
	  						<button class="btn btn-primary btn-ghost btn-fill" style="position:relative; left:20%; margin:0px;" onclick="location.href='payCancel.do?payNo=${rpl.payNo}'">
	    						예약취소
	  						</button>
						</li>
						<p>
					</c:forEach>
				</ul>
			</c:if>
		</div>
		<div class="paging">
			<div class="items" style="display:flex;">
				<div style="position:relative; left:25%;">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button class="btn btn-primary btn-ghost btn-open" style="margin:0px; margin-top:28px; padding:2px; position:relative;" onclick="location.href='myReservation.do?pageNum=${startPage - 1}'">
							<img alt="이전" src="resources/images/arrow_left1.png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="btn btn-primary btn-ghost btn-open" style="margin:0px; margin-top:28px; padding:2px; position:relative;" onclick="location.href='myReservation.do?pageNum=${currentPage - 1}'">
							<img alt="이전" src="resources/images/arrow_left1.png">
						</button>
					</c:if>
				</div>
				<%-- <c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='myReservation.do?pageNum=${i}'">${i}</span>
				</c:forEach> --%>
				<div style="position:relative; left:57%;">
					<c:if test="${currentPage < totalPage}">
						<button class="btn btn-primary btn-ghost btn-open" style="margin:0px; margin-top:28px; padding:2px; position:relative;" onclick="location.href='myReservation.do?pageNum=${currentPage + 1}'">
							<img alt="이전" src="resources/images/arrow_right.png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class="btn btn-primary btn-ghost btn-open" style="margin:0px; margin-top:28px; padding:2px; position:relative;" onclick="location.href='myReservation.do?pageNum=${endPage + 1}'">
							<img alt="이전" src="resources/images/arrow_right.png">
						</button> 
					</c:if>
				</div>
			</div> 
		</div> 
	</div>
</body>
</html>