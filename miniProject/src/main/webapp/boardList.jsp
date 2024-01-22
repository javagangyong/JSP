<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div class="sb">
	<div class="rel">
		<form id="searchBox">
			<input type="text" name="search" value="${param.search }"
				id="searchText">
			<button><img src="https://www.emojiall.com/images/240/apple/1f50d.png"></button>
		</form>
	</div>
	<div>
		<a href="${cpath }/writeBoard.jsp"><img src="https://ssl.pstatic.net/static/blog/img_write_btn.png" width="86" height="37" alt="글쓰기"></a>
	</div>
</div>

<c:set var="boardCount" value="${boardDAO.selectCount(param.search) }" />
<c:set var="paramPage" value="${empty param.page ? 1 : param.page }" />
<c:set var="paging" value="${Paging.newInstance(paramPage, boardCount) }" />
<c:set var="list" value="${boardDAO.selectListBoard(param.search, paging) }" />

<div class="wrapBoard">
	<c:forEach var="dto" items="${list }">
		<div id="oneBoard" class="flex">

			<div id="boardImg">
				<a href="${cpath }/boardView.jsp?idx=${dto.idx }">
					<img src="${cpath }/reviewImage/${dto.img }"></a>
			</div>

			<div id="boardInfo">
				<div id="fontsize26">❝</div>
				<div id="boardContent" class="contentColor">
					<a href="${cpath }/boardView.jsp?idx=${dto.idx }">
					${dto.content }</a>
				</div>
				<div id="contentWriter" class="contentColor">${dto.writer }</div>
				<div class="boardTitle">
					<a href="${cpath }/boardView.jsp?idx=${dto.idx }"> ${dto.title }</a>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<div class="frame center">
	<c:if test="${paging.prev }">
		<a href="${cpath }/boardList.jsp?page=${paging.begin - 10}&search=${param.serach }">[이전]</a>
	</c:if>
	
	<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<a class="${paging.page == i ? 'bold' : '' }"
			href="${cpath }/boardList.jsp?page=${i}&search=${param.search }">[${i }]</a>
	</c:forEach>
	
	<c:if test="${paging.next }">
		<a href="${cpath }/boardList.jsp?page=${paging.end + 1}&search=${param.search }">[다음]</a>
	</c:if>
</div>

<%@ include file="footer.jsp" %>
