<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 자바코드와 스크립트코드가 있으면 무조건 자바코드가 먼저 실행된다 --%>
<%
	String makeCookie = request.getParameter("makeCookie");

	if(makeCookie != null) {
		Cookie cookie = new Cookie("donotPopup", makeCookie);	// 값은 뭐든 상관없다
		cookie.setMaxAge(30);
		response.addCookie(cookie);
	}
%>

<script>
	window.close()
</script>

</body>
</html>