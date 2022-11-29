<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp" %> 
<c:set var="id" value='${sessionScope.memberId}'></c:set>
<c:if test="${empty id }">
	<script type="text/javascript">
		location.href="/gueChu/views/member/loginForm.do"
	</script>
</c:if>