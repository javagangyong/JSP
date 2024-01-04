<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST">
		<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="Pw" required></p>
		<p><input type="submit" value="로그인"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="dto" class="member.MemberDTO" />
	<jsp:setProperty property="*" name="dto"/>
	<c:set var="login" value="${memberDAO.login(dto) }" scope="session" />
	<c:if test="${not empty login }" >
		<c:redirect url="index.jsp" />
	</c:if>
	<script>
		alert('아이디 또는 비밀번호가 잘못되었습니다')
		history.go(-1)
	</script>
</c:if>

</body>
</html>