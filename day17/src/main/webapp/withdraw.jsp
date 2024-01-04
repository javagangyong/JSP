<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<form method="POST">
	<p><input type="password" name="userpw" placeholder="PassWord" required autofocus></p>	
	<p><input type="submit" value="회원탈퇴"></p>
</form>

<c:if test="${pageContext.request.method == 'POST' }" >
	<c:set var="row" value="${memberDAO.withdraw(login.userid, param.userpw) }" />
	<c:if test="${row != 0 }">
		<c:redirect url="logout.jsp"/>
	</c:if>
	
	<script>
		alert('비밀번호가 일치하지 않습니다')
		history.go(-1)
	</script>
</c:if>

</body>
</html>