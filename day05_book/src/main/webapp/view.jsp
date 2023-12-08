<%@ page import="book.BookDTO"%>
<%@ page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view.jsp</title>
</head>
<body>
<%
	BookDAO dao = (BookDAO) application.getAttribute("dao");
	int idx = Integer.parseInt(request.getParameter("idx"));
	BookDTO dto = dao.selectOne(idx);
	
	request.setAttribute("dto", dto);
	request.getRequestDispatcher("view-show.jsp").forward(request, response);
%>



</body>
</html>