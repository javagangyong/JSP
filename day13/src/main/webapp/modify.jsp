<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<section>
	<h3>정보수정 (modify.jsp)</h3>
	<c:set var="dto" value="${dao.selectOne(param.userid) }" />
	
	<form action="modify-action.jsp" method="POST">
		<p><input type="text" name="userID" value="${dto.userID }" placeholder="ID" required readonly></p>
		<p><input type="password" name="userPW" value="${dto.userPW }" placeholder="PassWord" required autofocus></p>
		<p><input type="text" name="userName" value="${dto.userName }" placeholder="이름" required></p>
		<p><input type="email" name="email" value="${dto.email }" placeholder="email" required></p>
		<p>
			<label><input type="radio" name="gender" value="남성" ${dto.gender == '남성' ? 'checked' : '' } required>남성</label>
			<label><input type="radio" name="gender" value="여성" ${dto.gender == '여성' ? 'checked' : '' } required>여성</label>
		</p>
		<p><input type="submit" value="가입신청"></p>
	</form>
</section>

	<%-- form태그에 action을 넣지않고 처리가능한데
		 userid는  --%>

</body>
</html>