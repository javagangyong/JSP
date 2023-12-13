<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<jsp:useBean id="dao" class="youtube.YoutubeDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day08 - Youtube</title>
<style>
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: none;
	}
	.frame {
		border: 1px dashed red;
	}
	nav > ul {
		list-style: none;
	}
	div.box {
		display: flex;
		flex-flow: wrap;
		margin: auto;
		border: 1px dashed green;
	}
	div.item {
		box-sizing: border-box;
		width: 400px;
		margin: 10px;
		padding: 10px;
		text-align: center;
		border: 1px dashed black;
	}
</style>
</head>
<body>

<header class="frame">
	<h1><a href="${cpath }">Youtube</a></h1>
	<nav>
		<ul>
			<li><a href="${cpath }/list.jsp">전체</a></li>
		</ul>
	</nav>
</header>
