<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="row" value="${boardDAO.delete(param.idx) }" />

<script>
	const row = '${row}'
	if(row != 0) {
		alert('게시글이 삭제되었습니다')
		location.href = '${cpath}/boardList.jsp'
	}
	else {
		alert('삭제 실패')
		history.go(-1)
	}
</script>

</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="row" value="${boardDAO.delete(param.idx) }" />

<script>
	const row = '${row}'
	if(row != 0) {
		alert('게시글이 삭제되었습니다')
		location.href = '${cpath}/boardList.jsp'
	}
	else {
		alert('삭제 실패')
		history.go(-1)
	}
</script>

</body>
>>>>>>> refs/remotes/origin/master
</html>