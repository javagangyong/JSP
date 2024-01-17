<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="dto" value="${likeDAO.selectLike(login.userid, param.idx) }" />
${login.userid } ${param.idx }
<c:if test="${empty dto }">
	${likeDAO.insertLike(login.userid, param.idx) }
	<c:redirect url="view.jsp?idx=${param.idx }"/>
</c:if>

${likeDAO.deleteLike(login.userid, param.idx) }
<c:redirect url="view.jsp?idx=${param.idx }"/>


</body>
</html>