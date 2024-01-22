<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="row" value="${memberDAO.delete(login.userid, login.userpw) }"/>

<script>
	const row = '${row}'
		if(row != 0){
			alert('회원 탈퇴가 성공적으로 진행되었습니다')
			location.href = '${cpath}/logout.jsp'
		}
		else {
			alert('회원 탈퇴에 실패하였습니다')
			history.go(-1)
		}
</script>

</body>
</html>