<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
	<c:if test="${pageContext.request.method == 'GET' }">
		<form method="POST">
			<div id="loginBox">
				<h3>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요</h3>
				<p id="loginID"><input type="text" name="userid" placeholder="아이디" required autofocus></p>		
				<p id="loginPW"><input type="password" name="userpw" placeholder="비밀번호" required></p>		
				<p id="loginSubmit"><input type="submit" value="로그인"></p>	
			</div>
		</form>
	</c:if>
</section>

<c:if test="${pageContext.request.method == 'POST' }">
   <jsp:useBean id="dto" class="member.MemberDTO"/>
   <jsp:setProperty property="*" name="dto"/>   
   <c:set var="login" value="${memberDAO.login(dto) }" scope="session"/>
   <c:if test="${empty login }">
      <script>
         alert('아이디 또는 비밀번호를 잘못 입력했습니다.\n입력하신 내용을 다시 확인해주세요.')
         history.go(-1)
      </script>
   </c:if>
   <c:if test="${not empty login }">
      <c:redirect url="/"/>
   </c:if>
</c:if>

<%@ include file="footer.jsp" %>