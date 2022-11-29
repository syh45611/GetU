<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header3.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	var up = '${update}'
	var num = '${houseNo}'
	var result = '${result}';
	var chk = '${chkIn}';
	if(up > 0){
		alert('수정완료');
	}

</script>
<script type="text/javascript">
	$(function() {
		$('#list1').load("updateRoomList.do?houseNo=" + num + "&chkIn="+chk);
	});

</script>
<body>
<div  class="u-clearfix u-sheet u-sheet-1" id="list5" style="width:700px; min-height:100px;   align-content: center; heght:1400px; text-align: center;  top: 60px;">
<a style="text-align: center; align-content: center; font-size: 50px;	">제휴점 관리페이지</a>
</div>


<div id="list3" style="width:1200px; min-height:80px;  heght:1400px; text-align: center;  top: 10px;">

</div>
	<div id="list2" style="top: 90px; text-align: center; align-content: center;">
	<form action="TestHtml.do">
		<input type="hidden" value="${houseNo}" name="houseNo" > <input
			type="date" value="${chkIn}" name="chkIn" style="width: 300px"> <input
			type="submit" value="검색" style="font-size: 15px; background: #86b6f6; color: white;">
	</form>
	</div>
	<div class="u-clearfix u-sheet u-sheet-1" id="list1"></div>

</body>
</html>