<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContex.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<main>
	<h3>대문페이지</h3>
	
	<table id="boardList">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>날짜</th>
			</tr>
		</thead>
		<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.idx }</td>
				<td>
					<a href="${cpath }/view.jsp?idx=${dto.idx }">
					${dto.title }
					${not empty dto.image ? '💾' : '' }
					</a>
				</td>
				<td>${dto.writer }</td>
				<td>${dto.viewCount }</td>
				<td>${dto.writeDate }</td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="center">
		<c:if test="${paging.prev }">
			<a href="${cpath }/board?page=${paging.begin - 10}&search=${param.search }">[이전]</a>
		</c:if>
		
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
			<a class = "${paging.page == i ? 'bold' : '' }"
			 	href="${cpath }/board?page=${i}&search=${param.search }">[${i }]</a>
		</c:forEach>
		
		<c:if test="${paging.next }">
			<a href="${cpath }/board?page=${paging.end + 1 }&search=${param.search }">[다음]</a>
		</c:if>
	</div>
	
	<div class="sb">
		<div>
			<form>
				<input type="search" name="search" value="${param.search }" placeholder="검색어를 입력하세요">
				<input type="submit" value="검색">
			</form>
		</div>
		<div>
			<a href="${cpath }/write.jsp"><button>새 글 작성</button></a>
		</div>
	</div>
	
</main>


</body>
</html>