<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="id" value='${sessionScope.memberId}'></c:set>
<c:if test="${empty id }">
	<script type="text/javascript">
		location.href="loginForm.do";
	</script>
</c:if>