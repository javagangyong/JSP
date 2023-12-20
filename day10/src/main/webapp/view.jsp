<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
		width: 500px;
		margin: 0 auto;
	}
</style>
</head>
<body>

<jsp:useBean id="dao" class="bugs.BugsDAO" />
<c:set var="dto" value="${dao.selectOne(param.id) }" />

<div>
	<h3>${dto.name }</h3>
	<h3>${dto.artist_name }</h3>
	<pre>${dto.lyrics }</pre>
</div>

</body>
</html>