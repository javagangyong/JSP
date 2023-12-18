<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    
<section class="frame">
	<form action="add_action.jsp">
		<h3>항목 추가</h3>
		<p><input type="text" name="name" placeholder="상품 이름" required autofocus><p>
		<p><input type="text" name="price" placeholder="상품 가격" required><p>
		<p><input type="submit"></p>
	</form>
</section>

</body>
</html>