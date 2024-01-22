<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="center">

	<div id="join-hd">
		<img src="https://img.cgv.co.kr/R2014/images/common/img_join_hd.jpg">
		<p>CJ ONE 회원이 되시면 하나의 통합된 회원 ID와 비밀번호로
		<br>CGV와 CJ ONE의 다양한 서비스를 이용하실 수 있습니다.</p>
	</div>
	
	<c:if test="${pageContext.request.method == 'GET' }">
		<form method="POST">
		<div id="joinBox">
			<p><input type="text" name="userid" placeholder="아이디" required autofocus></p>
			<p>
				<input type="password" name="userpw" placeholder="비밀번호" required>
				<span class="pw1_message"></span>
			</p>
			<p><input type="text" name="username" placeholder="이름" required></p>
			<p><input type="email" name="email" placeholder="이메일" required></p>
			<p id="joinSelect">
				<label><input type="radio" name="gender" value="남성">남성</label>
				<label><input type="radio" name="gender" value="여성">여성</label>
			</p>
			<p id="joinSubmit"><input type="submit" value="가입"></p>
		</div>
		</form>
		<script>
		const userpw = document.querySelector('input[name="userpw"]')
		const pw1_message = document.querySelector('.pw1_message')
		
		 function pw1Handler(event) {
            const pw1Value = event.target.value
            if(pw1Value.length < 4) {
                pw1_message.innerText = '비밀번호는 4자 이상이여야 합니다'
                pw1_message.style.color = 'red'
            }
            else {
                pw1_message.innerText = '사용가능한 비밀번호 입니다'
                pw1_message.style.color = 'blue'
            }
        }
		userpw.onkeyup = pw1Handler
		</script>
	</c:if>
	
	
	<c:if test="${pageContext.request.method == 'POST' }">
		<jsp:useBean id="dto" class="member.MemberDTO"/>
		<jsp:setProperty property="*" name="dto"/>
		<c:set var="row" value="${memberDAO.insert(dto) }"/>
		<script>
	      const row = '${row}'
	      if(row != 0) {
	         alert('회원가입이 완료되었습니다')
	         location.href = '${cpath}/login.jsp'
	      }
	      else {
	         alert('회원가입에 실패하였습니다')
	         history.go(-1)
	      }
  	 	</script>
	</c:if>
	
</section>


<%@ include file="footer.jsp" %>