<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="memberDAO" value="${MemberDAO.getInstance() }" />

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul {
		display : flex;
		justify-content: space-around;
		list-style: none;
	}
	div.userid {
		text-align: right;
		padding-right: 20px;
		height: 30px;
	}
	h1 {
		text-align: center;
	}
</style>
</head>
<body>

<header>
	<h1><a href="${cpath }">day17 - boardReply</a></h1>
	<div class="userid">
		사용자 : ${login.userid }
	</div>
	<nav>
		<ul>
			<c:if test="${empty login }" >
				<li><a href="${cpath }/login.jsp">로그인</a></li>
			</c:if>
			<li><a href="${cpath }/logout.jsp">로그아웃</a></li>
			<li><a href="${cpath }/join.jsp">회원가입</a></li>
			<li><a href="${cpath }/board.jsp">게시판</a></li>
			<c:if test="${not empty login }" >
				<li><a href="${cpath }/withdraw.jsp">회원탈퇴</a></li>
			</c:if>
		</ul>
	</nav>
</header>

