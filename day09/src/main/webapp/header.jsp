<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<jsp:useBean id="dao" class="product.ProductDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.frame {
		width: 1200px;
		border: 1px dashed red;
		margin: 0 auto;
	}
	header {
		display: flex;
		justify-content: space-between;
	}
	nav {
		border: 1px dashed black;
	}
	nav > ul {
		display: flex;
		list-style: none; 
		width: 300px;
		padding: 0;
	}
	nav > ul > li {
		flex: 1;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	div.bbox {
		border: 1px dashed black;
		display: flex;
		flex-flow: wrap;
	}
	div.box {
		box-sizing: border-box;
		margin: 10px;
		padding: 10px;
		text-align: center;
		width: 500px;
		margin: auto;
		border: 1px dashed	green;
	}
</style>
</head>
<body>
<header class="frame">
	<a href="index.jsp"><h2>LOGO</h2></a>
	<nav>
		<ul>
			<li><a href="${cpath }/list.jsp">전체</a></li>
			<li><a href="${cpath }/list.jsp?category=name">이름</a></li>
			<li><a href="${cpath }/list.jsp?category=price">가격</a></li>
		</ul>		
	</nav>
</header>
