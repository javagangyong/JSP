<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:if test="${empty login }" >
	<script>
		alert('먼저 로그인 후 게시글을 작성할 수 있습니다.')
		history.go(-1)
	</script>
</c:if>

<c:if test="${pageContext.request.method == 'GET' }">
<div id="writeBoardForm">
	<h2>무비 리뷰 글쓰기</h2>
	<form method="POST" enctype="multipart/form-data">
		<p><input type="text" name="title" placeholder="제목을 입력하세요" id="inputTitle" required autofocus></p>
		<p><textarea name="content" placeholder="내용을 입력하세요" id="inputText" required></textarea></p>
		<p class="sa">
			<input type="file" name="uploadFile" required>
			<input type="submit" value="등록">
		</p>
		
		<input type="hidden" name="writer" value="${login.userid }">
	</form>
</div>
</c:if>
<c:if test="${pageContext.request.method == 'POST' }">
	<c:set var="dto" value="${fileUtil.getDTO(pageContext.request) }" />
	<c:set var="row" value="${boardDAO.insert(dto) }"/>
	
	<script>
		const row = '${row}'
		if(row != 0) {
			alert('작성 완료')
			location.href = '${cpath}/boardList.jsp'
		}
		else {
			alert('작성 실패')
			history.go(-1)
		}
	</script>
</c:if>

<%@ include file="footer.jsp" %>