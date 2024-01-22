<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
	<table id="myboardList">
		<div><h2>📌 ${login.userid }님이 쓴 글</h2></div>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
				<th>삭제여부</th>
			</tr>
		</thead>
		<c:set var="list" value="${boardDAO.selectListByWriter(login.userid) }"/>
		<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.idx }</td>
				<td>
					<div style="display: flex; justify-content: center; align-items: center;">
						<img src="${cpath}/reviewImage/${dto.img }" width="100px;">
						<a href="${cpath}/boardView.jsp?idx=${dto.idx}">
						${dto.title }</a>
					</div>
				</td>
				<td>${dto.writer }</td>
				<td>${dto.writeDate }</td>
				<td>${dto.viewCount }</td>
				<td>${dto.deleted == 1 ? '❌' : '✔'}</td>
			</tr>
		</c:forEach>
	</table>
</section>
<%@ include file="footer.jsp" %>