<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<h3>항목 추가</h3>
	<form action="add-action.jsp">
		<p>
			<label><input type="radio" name="category" value="버거" required>버거</label>
			<label><input type="radio" name="category" value="음료" required>음료</label>
		</p>
		<p><input type="text" name="name" placeholder="상품 이름" required></p>
		<p><input type="number" name="price" placeholder="상품 가격" required></p>
		<p><input type="text" name="imgName" placeholder="그림 파일 이름" required></p>
		<p><textarea name="memo" placeholder="상세 설명" required></textarea></p>
		<p><input type="submit"></p>
	</form>
</section>

</body>
</html>