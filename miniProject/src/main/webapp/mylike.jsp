<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<section>
	<div>
		<h2>📌 ${login.userid }님이 좋아요한 영화</h2>
	</div>
	<div id="box1">
		<c:set var="list"
			value="${movieDAO.selectListLikeMovie(login.userid) }" />
		<c:forEach var="dto" items="${list }">
			<div id="myLikeList">
				<div id="movieLikeImg">
					<a href="${cpath }/view.jsp?idx=${dto.idx}"><img
						src="image/${dto.poster }"></a>
				</div>
				<div id="movieBox">
					<strong id="likeTitle">${dto.title }</strong>
					<div>${dto.releaseDate }</div>
					<div>${dto.genre }</div>
				</div>
			</div>
		</c:forEach>
	</div>
</section>

<%@ include file="footer.jsp"%>