<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
		<div id="box2">
			<c:set var="list" value="${movieDAO.selectListMovie() }"/>
			<c:forEach var="dto" items="${list }">
			<div id="movieList2">
				<div class="viewIdx" style="font-size: 15px;">NO. ${dto.idx }</div>
				<div id="movieImg2">
					<a href="${cpath }/view.jsp?idx=${dto.idx}"><img src="image/${dto.poster }" height="300px"></a>
				</div>
				<div id="movieBox2">
					<strong class="title">${dto.title }</strong>
					<div>${dto.releaseDate }</div>
					<div>${dto.genre }</div>
				</div>
			</div>
			</c:forEach>
		</div>
</section>

<%@ include file="footer.jsp" %>