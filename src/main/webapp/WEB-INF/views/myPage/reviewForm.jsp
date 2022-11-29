<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="../header2.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="resources/bootstrap/js/jquery.js"></script>
	<link rel="stylesheet" href="resources/memberadmin/memberadmin.css">
	<link rel="stylesheet" href="resources/memberadmin/magic-check.css">
	<style type="text/css">
		@import url("resources/myPageCSS/star.css")
	</style>
	<style type="text/css">
		input 
		{
			width: 100%;
			height: 48px;
			border: none;
			border-bottom: 1px solid #000;
			outline: 0;
			font-size: 15px;
			margin-bottom: 16px;
			font-family: inherit;
		}
		
		body 
		{
			padding-top: 0px;
		}
	</style>
	<script type="text/javascript">
		$(function() 
		{
	        $('div p#star a').click(function() 
	        {
	         	var memberNo ="${empty memberNo}";
	        	if (memberNo=='true') 
	        	{
	 				alert("로그인을 해주세요")
	 				return false;
	 			}
	            
	        	var a = $('#star').children("a").removeClass("on");
	            $(this).addClass("on").prevAll("a").addClass("on");
	            console.log($(this).attr("value"));
	            var value = $(this).attr("value"); 
	            
	            var reviewScore = $(this).attr('data-reviewScore');
	            $('input#hidden2').attr('value', reviewScore);
	            
	            return value;	         
	         });
	      });
	</script>
</head>
<body>
	<div class="container" style="margin-top:46px; margin-bottom:28px;">
	<h1 class="title"> 리뷰 작성 </h1>
	<form action="reviewWrite.do">
		<input id="hidden1" type="hidden" name="memberNo" value="${memberNo}">
		<input id="hidden2" type="hidden" name="reviewScore" value="">
	 	<div style="display:none">
			<input type="submit" onclick="return false">
			<input type="text">
		</div> 		
		<div class="container1" style="margin-top:46px;">
			<div style="display:flex;">
				<div style="position:relative; left:12%; margin-top:7px; width:82px;">
					<label style="font-size:17px;"> 숙소이름 </label>
				</div>
				<select name="payNo" style="position:relative; width:303px;">
				<c:forEach var="pnl" items="${payNoTempList}" varStatus="pnlIndex">
					<c:if test="${reviewChk[pnlIndex.index] == 0}">
						<option value="${pnl}"> ${houseNameTempList[pnlIndex.index]}</option>
					</c:if>
					<c:if test="${reviewChk[pnlIndex.index] == 1}">
						<option value="${pnl}"> ${houseNameTempList[pnlIndex.index]}(작성됨) </option>
					</c:if>
				</c:forEach>
				</select>
			</div>					
			<div>
				<input type="text" placeholder="제목" name="reviewSubject" required="required" autofocus="autofocus">
			</div>		
			<div class="check">
				<textarea rows="5" cols="40" placeholder="리뷰내용" name="reviewContent" required="required"></textarea>
			</div>
				<div class="stst" style="left:200px;">
					<p id="star" class="sta">
						<a href="#" value="1" data-reviewScore="1">★</a><a href="#" value="2" data-reviewScore="2">★</a><a href="#" value="3" data-reviewScore="3">★</a><a href="#" value="4" data-reviewScore="4">★</a><a href="#" value="5" data-reviewScore="5">★</a>
					<p>	
				</div>			
			<div style="position:relative; top:80px; right:77px;">
				<input type="submit" class="btn_submit-btn" value="리뷰작성">
			</div>
		</div>
	</form>
</div>
</body>
</html>