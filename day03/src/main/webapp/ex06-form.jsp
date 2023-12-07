<%@page import="food.FoodDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06-form.jsp</title>
</head>
<body>

<form action="ex06-action.jsp">
<p><input type="text" name="storeName" placeholder="식당이름" required></p>
	<p><input type="text" name="menuName" placeholder="메뉴이름" required></p>
	<p>
		<select name="category" required>
			<option value="">=== 카테고리 ===</option>
			<option value="족발/보쌈">족발/보쌈</option>
			<option value="찜/탕/찌개">찜/탕/찌개</option>
			<option value="돈까스/회/일식">돈까스/회/일식</option>
			<option value="피자">피자</option>
			<option value="고기/구이">고기/구이</option>
			<option value="야식">야식</option>
			<option value="양식">양식</option>
			<option value="치킨">치킨</option>
			<option value="중식">중식</option>
		</select>
	</p>												<!-- required 반드시 입력해야하는 값 -->
	<p><input type="number" name="menuPrice" placeholder="주문금액" min="0" step="100" required></p>
	<p><input type="submit"></p>
</form>

<table border="1" cellpadding="10" cellspacing="1">
	<thead>
		<tr bgcolor="#dadada">
			<th>가게이름</th>
			<th>메뉴이름</th>
			<th>메뉴가격</th>
			<th>카테고리</th>
		</tr>
	</thead>
	<tbody>
	<%
		List<FoodDTO> list = (List<FoodDTO>) session.getAttribute("list");
		for(int i = 0; list != null && i < list.size(); i++) {
			FoodDTO dto = list.get(i);
	%>
	<tr>
			<th><%=dto.getStoreName() %></th>
			<th><%=dto.getMenuName() %></th>
			<th><%=dto.getMenuPrice() %></th>
			<th><%=dto.getCategory() %></th>
	</tr>
	<% } %>
	</tbody>
</table>



</body>
</html>