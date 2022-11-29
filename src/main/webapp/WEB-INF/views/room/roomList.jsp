<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous">
</script>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var num = '${houseNo}';
	var chkI = '${chkIn}';
	var chkO = '${chkOut}';
	var chkOO = new Date(new Date('${chkOut}').setDate(new Date('${chkOut}')
			.getDate() - 1));
	var year = chkOO.getFullYear();
	var month = ('0' + (chkOO.getMonth() + 1)).slice(-2);
	var day = ('0' + chkOO.getDate()).slice(-2);
	var chkDate = year + '-' + month + '-' + day;
</script>
<script type="text/javascript">
	$(function() {
		$('#roomCont').load(
				"roomListContent.do?houseNo=" + num + "&chkIn=" + chkI
						+ "&chkOut=" + chkDate);
	});
	</script>
	<style type="text/css">
#chk {
  width: 130px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 7px;
  outline: none;
  padding-left: 10px;
/*   background-color: #86b6f6; */
}
	
	</style>
	</head>

<body>
	<div style="position: relative; left: 110px; top: 1px;">
		<form action="houseContent2.do">
			<input type="hidden" value="${houseNo}" name="houseNo">
			<table>
				<tr>
					<th><input type="date" id="chk" value="${chkIn}" name="chkIn" min="${chkIn}" ></th>
					<th><input type="date" id="chk" value="${chkOut}" name="chkOut" min="${chkIn}" ></th>
					<th><input type="submit" value="검색" style="color:white; background: #86b6f6;"></th>
				</tr>
			</table>
		</form>
		<div id="roomCont"></div>
	</div>
</body>
</html>