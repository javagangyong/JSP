<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		border: 2px solid black;
		border-collapse: collapse;
	}
	tr {
		border-bottom: 1px solid grey;
	}
	td, th {
		border: 1px solid grey;
		padding: 10px;
	}
	thead {
		background-color: #dadada;
	}
	tbody > tr:hover {
		background-color: #eee;
		color: black;
		cursor: pointer;
	}
	.sb {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
</style>
</head>
<body>

<h1>list.jsp</h1>
<hr>

<div class="sb">
	<form action="list.jsp">
		<p>
			<input type="search" name="search" placeholder="검색어를 입력하세요"
				   autofocus value="${param.search }">
			<input type="submit" value="검색">
		</p>
	</form>
	<div>
		<a href="add.jsp"><button>추가</button></a>
	</div>
</div>


<table>
	<thead>
		<tr>
			<th>id</th>
			<th>artist_name</th>
			<th>name</th>
			<th>artist_img</th>
			<th>album_name</th>
			<th>album_img</th>
			<th>genre</th>
			<th>playTime</th>
			<th>기능</th>
		</tr>
	</thead>
	<tbody>
	
	<jsp:useBean id="dao" class="bugs.BugsDAO" />
	<c:set var="list" value="${dao.selectAll(param.search) }" />
	<c:forEach var="dto" items="${list }">
	
		<tr>
			<td>${dto.id }</td>
			<td>${dto.artist_name }</td>
			<td>${dto.name }</td>
			<td><img src="artist_img/${dto.artist_img }" height="50"></td>
			<td>${dto.album_name }</td>
			<td><img src="album_img/${dto.album_img }" height="50"></td>
			<td>${dto.genre }</td>
			<td>${dto.playTime }초</td>
			<td>
				<a href="view.jsp?id=${dto.id }"><button>상세조회</button></a>
				<a href="modify.jsp?id=${dto.id }"><button>수정</button></a>
				<a href="delete.jsp?id=${dto.id }"><button>삭제</button></a>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>


<!-- 단일 조회 가사 줄바꿈은 pre 태그로 묶어서 조회한다 -->
</body>
</html>