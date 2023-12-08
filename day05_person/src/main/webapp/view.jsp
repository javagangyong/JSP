<%@page import="person.PersonDTO"%>
<%@page import="java.util.ArrayList"%>
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
	ArrayList<PersonDTO> personList = (ArrayList<PersonDTO>)application.getAttribute("personList");

	PersonDTO data = null;
	String name = request.getParameter("name");
	
	for(PersonDTO dto : personList) { // 향상된 for문 personList의 dto를 하나씩 불러오면서
		if(dto.getName().equals(name)) {
			data = dto;
			break;
		}
	}
	
	request.setAttribute("dto", data);
	request.getRequestDispatcher("view-show.jsp").forward(request, response);
%>

</body>
</html>