<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
	<c:remove var="login" scope="session"/>
	<c:redirect url="/" />
</section>

</body>
</html>