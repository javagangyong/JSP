<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<jsp:useBean id="dto" class="member.MemberDTO" />
<jsp:setProperty property="*" name="dto" />

<c:set var="login" value="${dao.login(dto) }" scope="session" />
<c:if test="${not empty login }" >
	<c:redirect url="/" />
</c:if>


<script>
		alert('일치하는 계정을 찾을 수 없습니다')
		history.go(-1)
</script>

</body>
</html>