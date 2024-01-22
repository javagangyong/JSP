<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${empty login }">
		<script>
         alert('동영상이 마음에 드시나요?\n로그인하여 의견을 알려주세요.')
         history.go(-1)
      </script>
	</c:if>
	
	<c:if test="${not empty login }">
		<c:set var="dto" value="${likeDAO.selectLike(login.userid, param.idx) }" />
		<c:if test="${empty dto }">
		   ${likeDAO.insertLike(login.userid, param.idx) }
		   <c:redirect url="view.jsp?idx=${param.idx }" />
		</c:if>
	
		${likeDAO.deleteLike(login.userid, param.idx) }
		<c:redirect url="view.jsp?idx=${param.idx }" />
	</c:if>


</body>
</html>