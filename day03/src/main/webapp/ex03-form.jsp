<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-form.jsp</title>
</head>
<body>

<h1>업다운 게임 입력 / 출력</h1>
<hr>

<form action="ex03-action.jsp">
	<input type="number" name="user" required autofocus>
<!-- 	<input type="submit"> -->
	<button>제출</button>
<!-- 	버튼태그는 form태그 안에 있을때 submit역할을 한다 -->
	<a href="ex03-action.jsp?reset=true">다시</a>
</form>

<h3><%=request.getParameter("msg") %></h3>

</body>
</html>