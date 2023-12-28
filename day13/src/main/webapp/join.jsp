<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<section>
	<h3>회원가입 (join.jsp)</h3>
	<form action="join-action.jsp" method="POST">	<%-- method가 POST이면 주소창으로 쿼리스트링이 전달되지 
														않기때문에 한글을 전달할때 encoding이 필요하다
														request.setCharacterEncoding("UTF-8");
														이름, 성별 을 전달할때 한글을 전달하기때문 --%>
		<p><input type="text" name="userID" placeholder="ID" required autofocus></p>
		<p><input type="password" name="userPW" placeholder="PassWord" required></p>
		<p><input type="text" name="userName" placeholder="이름" required></p>
		<p><input type="email" name="email" placeholder="email" required></p>
		<p>
			<label><input type="radio" name="gender" value="남성" required>남성</label>
			<label><input type="radio" name="gender" value="여성" required>여성</label>
		</p>
		<p><input type="submit" value="가입신청"></p>
	</form>
</section>

</body>
</html>