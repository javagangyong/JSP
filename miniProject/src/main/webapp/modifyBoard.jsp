<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${boardDAO.selectOneBoard(param.idx) }" />

<c:if test="${pageContext.request.method == 'GET' }">
<div class="frame">
	<form method="POST" enctype="multipart/form-data">
		<p><input type="text" name="title" value="${dto.title }" placeholder="제목" id="inputTitle" required autofocus></p>
		<p><textarea name="content" placeholder="내용" id="inputText" required>${dto.content }</textarea></p>
		<p><input type="file" name="uploadFile" required></p>
		<p><input type="submit" value="등록"></p>
		
		<input type="hidden" name="writer" value="${login.userid }">
		<input type="hidden" name="idx" value="${dto.idx }">
	</form>
</div>
</c:if>
<c:if test="${pageContext.request.method == 'POST' }">
	<c:set var="dto" value="${fileUtil.getDTO(pageContext.request) }" />
	<c:set var="row" value="${boardDAO.update(dto, param.idx) }"/>
	
	<script>
		const row = '${row}'
		if(row != 0) {
			alert('게시글 수정 완료')
			location.href = '${cpath}/boardView.jsp?idx=${param.idx}'
		}
		else {
			alert('게시글 수정 실패')
			history.go(-1)
		}
	</script>
</c:if>

<%@ include file="footer.jsp" %>