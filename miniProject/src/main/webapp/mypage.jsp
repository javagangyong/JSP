<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<main>

	<c:if test="${empty login }">
		<script>
			alert('로그인 후 사용 가능합니다.')
			location.href = '${cpath}/login.jsp'
		</script>
	</c:if>

	<c:if test="${not empty login }">
		<div id="mypageContent">
			<div id="mypageCategory">
				<ul>
					<li><a href="${cpath }/mypage.jsp">회원정보</a></li>
					<li><a href="${cpath }/myboard.jsp">내가 쓴 글</a></li>
					<li><a href="${cpath }/mylike.jsp">좋아요한 영화</a></li>
					<li><a href="${cpath }/deleteMember.jsp">회원탈퇴</a></li>
				</ul>
			</div>

			<c:set var="dto" value="${memberDAO.selectOne(param.idx) }" />
			<form method="POST" action="modifyMember.jsp">

				<div id="mypageBox">
					<h3>정보를 수정하신 후, 정보수정 버튼을 클릭해 주세요</h3>
					<p>
						<input type="text" name="userid" value="${login.userid }"
							placeholder="ID" required readonly>
					</p>
					<p>
						<input type="password" name="userpw" value="${login.userpw }"
							placeholder="Password" required autofocus>
					</p>
					<p>
						<input type="text" name="username" value="${login.username }"
							placeholder="name" required>
					</p>
					<p>
						<input type="email" name="email" value="${login.email }"
							placeholder="**@**.**" required>
					</p>
					<p id="mypageSelect">
						<label><input type="radio" name="gender" value="남성"
							${login.gender == '남성' ? 'checked' : '' } required>남성</label> <label><input
							type="radio" name="gender" value="여성"
							${login.gender == '여성' ? 'checked' : '' } required>여성</label>
					</p>
					<p id="mypageSubmit">
						<input type="submit" value="정보수정">
					</p>
				</div>
			</form>
		</div>
	</c:if>

</main>
<%@ include file="footer.jsp"%>