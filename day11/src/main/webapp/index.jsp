<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
	<div class="sb">
		<form action="index.jsp">
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
				<th>ID</th>
				<th>ARTIST_NAME</th>
				<th>NAME</th>
				<th>ARTIST_IMG</th>
				<th>ALBUM_NAME</th>
				<th>ALBUM_IMG</th>
				<th>GENRE</th>
				<th>PLAYTIME</th>
				<th>기능</th>
			</tr>
		</thead>
		<tbody>
		
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
</section>



</body>
</html>